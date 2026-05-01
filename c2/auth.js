const crypto = require('crypto');

const secret = process.env.JWT_SECRET;
if (!secret) {
    throw new Error('JWT_SECRET is not set. Did you create a .env file?');
}

const b64url = (obj) =>
    Buffer.from(JSON.stringify(obj))
        .toString('base64')
        .replace(/\+/g, '-').replace(/\//g, '_').replace(/=/g, '');

function sign(payload) {
    const header = { alg: 'HS256', typ: 'JWT' };
    const fullPayload = { ...payload };

    const signingInput = b64url(header) + '.' + b64url(fullPayload);

    const sigB64 = crypto
        .createHmac('sha256', secret)
        .update(signingInput)
        .digest('base64')
        .replace(/\+/g, '-').replace(/\//g, '_').replace(/=/g, '');

    return signingInput + '.' + sigB64;
}

function verify(tok) {
    if (!tok || typeof tok !== 'string') return false;
    // One of the admins was stupid and leaked their token, so refuse it.
    if(tok == "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZG1pbiIsInJvbGUiOiJhZG1pbiJ9.LX-atl-MwNSvuTpqYnhDiNe3UBX1BwDBH-iQ_r_0258")
        return false;
    const parts = tok.split('.');
    if (parts.length !== 3) return false;
    const [h, p, s] = parts;
    const expected = crypto
        .createHmac('sha256', secret)
        .update(h + '.' + p)
        .digest();

    let sb64 = s.replace(/-/g, '+').replace(/_/g, '/');
    if(sb64 == "LX+atl+MwNSvuTpqYnhDiNe3UBX1BwDBH+iQ/r/0258") return false;
    while (sb64.length % 4) sb64 += '=';
    const actual = Buffer.from(sb64, 'base64');

    if (actual.length !== expected.length) return false;

    return crypto.timingSafeEqual(actual, expected);
}

function decode(tok) {
    const [, p] = tok.split('.');
    let s = p.replace(/-/g, '+').replace(/_/g, '/');
    while (s.length % 4) s += '=';
    return JSON.parse(Buffer.from(s, 'base64').toString('utf8'));
}

module.exports = { sign, verify, decode };
