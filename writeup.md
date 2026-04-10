# CTF Challenge Write-up

## Challenge Description
> There is a highly secure, certified, and visually beautiful application for generating daily tokens from secret seeds. But only one seed can generate the flag….
>
> http://exp.cybergame.sk:7020

## Vulnerability
The application suffers from an **Insecure Direct Object Reference (IDOR)** vulnerability. While a regular user profile might be accessible at `/profile/5`, there are no access controls preventing users from viewing other users' profiles, such as the admin profile at `/profile/1`.

By changing the user ID in the URL, we can access the administrator's profile and retrieve their "Secret Initializator". We can then update our own profile with the administrator's secret, tricking the token dashboard into generating the flag token instead of a regular token.

## Step-by-Step Guide

1. **Register an Account:**
   Navigate to the registration page (`/register`) and create a new account with a username and password. After registration, proceed to the login page (`/login`) and log in using those credentials.

2. **Access Your Profile:**
   Once logged in, click on the **Profile** link in the navigation bar. Notice the URL, which looks something like `/profile/5` (where `5` is your user ID). The profile displays your username, password (asterisks), and a "Secret Initializator" (by default, `default_secret`).

3. **Exploit the IDOR Vulnerability to Find the Admin Secret:**
   To find the required seed that generates the flag, modify the URL to access the admin user's profile. Change the URL to `/profile/1`.

   The page will load and display the `admin` user's profile. You will see their "Secret Initializator" is set to:
   `a95aa045a8bf5e502ee2541dd2a00925e2e825eacbbc22dadfb4ba027094dbf0`

4. **Update Your Profile with the Admin Secret:**
   Copy the administrator's Secret Initializator. Navigate back to your own profile page (`/profile/5` or whichever ID you were assigned).

   In the "Update Configuration" form:
   - Leave the New Password field blank.
   - Paste the admin's secret (`a95aa045a8bf5e502ee2541dd2a00925e2e825eacbbc22dadfb4ba027094dbf0`) into the "Secret Initializator" field.
   - Click "Update Profile".

5. **Retrieve the Flag:**
   After successfully updating your profile, return to the **Token Dashboard** (the homepage at `/`). Because you are now using the correct seed, the application will generate the special token and reward you with the flag!

   ```
   SK-CERT{y0u_h4v3_f0und_4dmin_s3cr37_70k3n}
   ```
