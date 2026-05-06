# Custom Prompt in Windows

Custom commands for Command Prompt and PowerShell

## Parrot OS Prompt in DOS

+ Run the following in Command Prompt

    ```console
    foo@bar:~$ setx prompt ^[[91m┌──[%username%^[[93m@^[[96m%computername%^[[91m]-[^[[92m$P^[[91m]$_^[[91m└──$G$S^[[93m#$S^[[37m
    ```

### Note

Replace all `^[` with `CTRL + [`

## PowerShell Custom Prompt

<!-- markdownlint-disable MD033 MD046 MD013 -->
<details>
  <summary>File</summary>
  <br>
  <ul>
    <li>
      <pre>
        <code>$PROFILE.AllUsersAllHosts</code>
      </pre>
    </li>
  </ul>
</details>

<details>
  <summary>Config</summary>
  <br>
  <ul>
    <li>Universal Profile</li>
    <br>
    <dl>
      <dd>
        <pre>
          <code>
            if (!(Test-Path -Path $PROFILE.AllUsersAllHosts)) {
                New-Item -ItemType File -Path $PROFILE.AllUsersAllHosts -Force
            }
          </code>
        </pre>
      </dd>
    </dl>
    <li>Custom Prompt</li>
    <br>
    <dl>
      <dd>
        <pre>
          <code>
            function prompt {
              $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
                $principal = [Security.Principal.WindowsPrincipal] $identity
                $adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator
                $color = Get-Random -Min 1 -Max 16
                <br>
                Write-Host ("`n" + $(if (Test-Path variable:/PSDebugContext) { '[DBG]: ' }
                      elseif($principal.IsInRole($adminRole)) { "[ADMIN]: " }
                      else { '' }
                      ) + $(Get-Date) + '_' + ($env:COMPUTERNAME)+ ' ' + $(Get-Location) +
                    $(if ($NestedPromptLevel -ge 1) { '>>' }) + '>' + "`n") -ForegroundColor $color
                return " "
            }
          </code>
        </pre>
      </dd>
    </dl>
    <li>Navigation Menu</li>
    <br>
    <dl>
      <dd>
        <pre>
          <code>Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete</code>
        </pre>
      </dd>
    </dl>
    <li>Autocompletion</li>
    <br>
    <dl>
      <dd>
        <pre>
          <code>Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward</code>
          <br>
          <code>Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward</code>
        </pre>
      </dd>
    </dl>
    <li>New Alias</li>
    <br>
    <dl>
      <dd>
        <pre>
          <code>New-Alias open ii</code>
        </pre>
      </dd>
    </dl>
  </ul>
</details>
<!-- markdownlint-enable -->

## System Dark Mode

+ Run the following in PowerShell

    <!-- markdownlint-disable MD013-->
    ```console
    New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0 -Type Dword -Force; New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0 -Type Dword -Force
    ```
    <!-- markdownlint-enable -->

## System Light Mode

+ Run the following in PowerShell

    <!-- markdownlint-disable MD013-->
    ```console
    New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0 -Type Dword -Force; New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 1 -Type Dword -Force
    ```
    <!-- markdownlint-enable -->
