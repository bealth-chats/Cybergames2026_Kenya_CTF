# Velvet Notes - Write-up

## Challenge Description
*This app will hide all your secrets. Some of them are already here and aren't even hidden.*

## Enumeration
The application is a note-taking application using Express and SQLite.
There are multiple API endpoints available under `/api/v1` and `/api/v2`.

When submitting invalid JSON parameter structures, such as passing an object for the password in the login request:
`{"username": "admin", "password": {"$gt": ""}}`
The application throws a `500 Internal Server Error` with a stack trace indicating a crash inside `bcrypt.compareSync` in `/app/routes/v2.js`.
This only occurs if the user is found in the database.

## Exploitation
1. **Boolean Oracle & Admin Credentials**: The `bcrypt` error provided a boolean oracle to confirm whether a user existed in the database. We successfully verified that the `admin` user existed. Brute-forcing the admin credentials revealed the weak password: `admin`.
2. **Accessing Notes**: Upon authenticating with the credentials `admin:admin`, we can fetch the admin's notes via the `/api/v2/notes` endpoint.
3. **Finding the Hidden Endpoint**: Among the numerous payload-testing notes left by the admin, some notes contained the string `secretendpointforflag`.
4. **Bypassing Restrictions**: Hitting the endpoint `/api/v2/secretendpointforflag` yields a `Forbidden` error. However, we can take advantage of the `/api/v1` namespace. Making a request to `/api/v1/secretendpointforflag` with the `admin` JWT successfully bypassed the access restriction and returned the flag.

## Flag
`SK-CERT{v3r510n_15_ju57_4_numb3r}`
