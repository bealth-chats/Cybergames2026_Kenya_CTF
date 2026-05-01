require('dotenv').config();

const express = require('express');
const path = require('path');
const fs = require('fs');
const { sign, verify, decode } = require('./auth');

const app = express();
const PORT = process.env.PORT || 3000;

const users = {
    demo:  { password: 'password123', role: 'user' },
    admin: { password: process.env.ADMIN_PASS,     role: 'admin' }
};

const adminData = {
    notes: [
        'TODO: Rotate private key.',
        'Server room key code rotated to 7321 on April 12.',
        'VIP customer: Acme Corp renewal locked at $48k/yr.',
        process.env.FLAG,
    ],
    metrics: {
        mrr: 124300,
        churnRate: 0.021,
        activeUsers: 8421
    }
};

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const VIEWABLE_SOURCES = [
    'server.js',
    'auth.js',
    'public/index.html',
    'public/app.html',
    'public/login.js',
    'public/app.js',
    'public/styles.css',
    'spunchbob.png'
];

app.get('/source', (req, res) => {
    const links = VIEWABLE_SOURCES.filter(i => i != 'spunchbob.png')
        .map((f) => `<li><a href="/source/${f}">${f}</a></li>`)
        .join('\n');
    res.send(`<!doctype html>
<html><head><title>Source</title>
<link rel="stylesheet" href="/styles.css"></head>
<body><main class="card"><h1>Source files</h1>
<ul>${links}</ul>
<p class="hint">Server-only files (.env, node_modules, package-lock.json) are not exposed.</p>
</main></body></html>`);
});

app.get('/source/*', (req, res) => {
    const requested = req.params[0];
    if (!VIEWABLE_SOURCES.includes(requested)) {
        return res.status(404).type('text/plain').send('Not found');
    }
    const abs = path.join(__dirname, requested);
    fs.readFile(abs, 'utf8', (err, data) => {
        if (err) return res.status(500).type('text/plain').send('Read error');
        res.type('text/plain').send(data);
    });
});

function parseCookies(req) {
    const out = {};
    const header = req.headers.cookie;
    if (!header) return out;
    header.split(';').forEach((pair) => {
        const idx = pair.indexOf('=');
        if (idx === -1) return;
        const k = pair.slice(0, idx).trim();
        const v = pair.slice(idx + 1).trim();
        out[k] = decodeURIComponent(v);
    });
    return out;
}

function requireAuth(req, res, next) {
    const cookies = parseCookies(req);
    const token = cookies.token;
    if (!token || !verify(token)) {
        return res.status(401).json({ error: 'unauthorized' });
    }
    req.user = decode(token);
    next();
}

function requireAdmin(req, res, next) {
    requireAuth(req, res, () => {
        if (req.user.role !== 'admin') {
            return res.status(403).json({ error: 'forbidden' });
        }
        next();
    });
}

app.post('/api/login', (req, res) => {
    const { username, password } = req.body || {};
    const user = users[username];
    if (!user || user.password !== password) {
        return res.status(401).json({ error: 'invalid credentials' });
    }
    const token = sign({ sub: username, role: user.role });
    res.setHeader(
        'Set-Cookie',
        `token=${token}; HttpOnly; Path=/; SameSite=Lax; Max-Age=3600`
    );
    res.json({ ok: true, token });
});

app.post('/api/logout', (req, res) => {
    res.setHeader('Set-Cookie', 'token=; HttpOnly; Path=/; Max-Age=0');
    res.json({ ok: true });
});

app.get('/api/me', requireAuth, (req, res) => {
    res.json({ user: req.user });
});

app.get('/api/admin/data', requireAdmin, (req, res) => {
    res.json(adminData);
});

app.get('/app', requireAuth, (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'app.html'));
});

app.use(express.static(path.join(__dirname, 'public')));

app.use((req, res) => {
    res.status(404).sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
