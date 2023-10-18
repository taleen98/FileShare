# FileShare Tool
TThe PowerShell script provided is designed to analyze shared folders on a Windows system using the Server Message Block (SMB) protocol. It retrieves information about these shared folders, inspects their security descriptors, and provides informative messages about the access permissions granted to various user groups or entities. The script offers a clear and color-coded output, making it easy to discern different access rights for each shared folder, such as full access, permissions for authenticated users, or interactive user access. This tool can be particularly useful for IT professionals and penetration testers.

## Running The Scipt 
#### Run The Tool Directly From The Memory:
```
IEX(New-Object Net.WebClient).downloadString('https://raw.githubusercontent.com/taleen98/FileShare/main/fileshare.ps1')
```
