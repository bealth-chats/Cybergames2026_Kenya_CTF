# Writeup

1. The prompt gives us the target URL: https://mail.equestriasociety.com/
2. We can see it's a web application, and doing an initial investigation of the network requests (via viewing the main.js file) reveals it's using GraphQL for its API.
3. We query the GraphQL endpoint `/graphql` to perform an introspective query to discover the schema. We query `__schema { types { name fields { name } } }`.
4. Analyzing the schema, we find the available queries: `enabledSsoConfigurations`, `me`, `messages`, `newsFeed`, `replySuggestions`, `sentMessages`, `ssoConfiguration`, `ssoConfigurations`, `user`, `users`.
5. We try to query these endpoints without authentication. Most return an `Unauthorized` error.
6. However, the `newsFeed` query does not require authentication and returns a list of news posts.
7. Looking at the schema for `newsFeed`, we see it returns an array of `NewsPost` objects. The `NewsPost` object has an `author` field, which is of type `User`.
8. The `User` object has a `subOrganization` field of type `SubOrganization`. The `SubOrganization` object has a `members` field of type `User`. The `User` object has an `email` field.
9. This nested structure allows us to extract information about other users. We can query the `newsFeed` endpoint and request the `email` of the `author`'s `subOrganization`'s `members`.
10. We send the following GraphQL query:
```graphql
{
  newsFeed {
    author {
      subOrganization {
        members {
          email
        }
      }
    }
  }
}
```
11. The response contains the email addresses of the members in the sub-organizations, one of which contains the flag: `SK-CERT{l34ky_l34ks_4ll_0v3r_3questria}@lol.com`.
12. The flag is `SK-CERT{l34ky_l34ks_4ll_0v3r_3questria}`.