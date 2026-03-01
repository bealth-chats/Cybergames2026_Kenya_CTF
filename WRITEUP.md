# CTF Writeup: SAFEPS

## Description
Get flag. Or git gud.
nc exp.cybergame.sk 7004

## Exploration

1. **Analyze Files**: The challenge provided a `safeps.zip` file containing two important files: `docker-compose.yaml` and `script.ps1`.
2. **Review Environment Setup**:
   - `docker-compose.yaml` maps port `6969` to execute `script.ps1` via `socat` whenever a connection is made to the container.
   - `socat` handles incoming TCP connections and spawns a `pwsh` instance running `script.ps1` inside an Ubuntu environment.

## Analyzing `script.ps1`

The `script.ps1` script acts as a jailed environment. It heavily restricts user commands and character inputs:
1.  **Allowed Commands**: Only `help`, `about`, `time`, and `echo` are allowed.
2.  **Bad Characters**: The script filters out inputs containing `_`, `$`, `=`, `-`, `.`, `{`, `}`, `` ` ``, `[`, `]`.
3.  **Bad Words**: It maintains a `$Bad` list, which includes hundreds of standard PowerShell cmdlets and aliases (e.g., `get-childitem`, `gci`, `dir`, `cat`, `type`, `Get-Variable`, etc.).

Any input sent to the service is first checked against these blocklists. The checking is case-insensitive.

## The Bypass

The key vulnerability lies in how the `echo` command is implemented within the jail:

```powershell
"echo"  {
  $exprTrimmed = if ($parts.Count -gt 1) { $parts[1].Trim() } else { "" }
  if ([string]::IsNullOrWhiteSpace($exprTrimmed)) { return }

  # ... character and other checks ...

  $sb = [ScriptBlock]::Create($exprTrimmed)
  $result = & $sb
  if ($null -ne $result) { $result }
  return
}
```

The `echo` command takes the user's input string, converts it into a `[ScriptBlock]`, and executes it using `&`. This essentially means we have arbitrary code execution, provided we can construct a valid PowerShell expression that does not use any of the blocked characters or match any word in the `$Bad` list.

## Escaping the Jail

The challenge requires finding a command that is *not* in the `$Bad` list and allows us to read files or execute system commands.

After iterating over the `$Bad` list and comparing it against standard PowerShell cmdlets (using `Get-Command`), one notable function that wasn't blocked was `exec`.

In PowerShell on Linux/macOS, `exec` is a function that wraps the `Switch-Process` cmdlet. `Switch-Process` replaces the current `pwsh` process with a new executable.

By executing `exec sh`, we can break out of the restricted PowerShell script and launch a standard `/bin/sh` shell:

```bash
nc exp.cybergame.sk 7004
Welcome to SAFEPS, hardened environment.
echo (exec sh)
```

## Getting the Flag

Once we successfully spawn a `/bin/sh` shell, we no longer face the restrictions imposed by `script.ps1`.

Running `env` showed that our current working directory was `/srv` and the user was `root`.

We then explored the filesystem and found `script.ps1` in the `/srv` directory. Reading its contents using `cat /srv/script.ps1` revealed the actual flag hardcoded in the script on the server:

```bash
# cat /srv/script.ps1
$ErrorActionPreference = "SilentlyContinue"
Set-StrictMode -Off

$FLAG = "SK-CERT{1_l0v3_p0w45h3LLz_h0P3_u2}"
...
```

## Flag
`SK-CERT{1_l0v3_p0w45h3LLz_h0P3_u2}`
