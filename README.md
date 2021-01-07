forked from hrsetyono/git-sftp-action

# git-sftp-action-with-password

Uses [git-ftp](https://github.com/git-ftp/git-ftp) and [GitHub actions](https://github.com/features/actions) to deploy a GitHub repository to an SFTP server.

**⚠️ Attention:** This is still in testing and not for production use.

## Example usage

```
name: Deploy via git-ftp
on: push
jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - run: 'echo "$SSH_PPK" > the_key'
      shell: bash
      env:
        SSH_KEY: ${{ secrets.SSH_PPK }}
    - name: git-ftp push
      uses: hrsetyono/git-sftp-action@v4
      with:
        url: "sftp://example.com/path/to/website"
        user: ${{ secrets.FTP_USER }}
        options: "--key /the_key --auto-init"
```

## Input parameters

Input parameter | Description | Required | Default
--- | --- | --- | ---
url | git-ftp url (see [documentation](https://github.com/git-ftp/git-ftp/blob/1.6.0/man/git-ftp.1.md#url)) | Yes | N/A
user | FTP username | Yes | N/A
password | FTP password | No | N/A
key | (TBI) Private key, the public key must be set to `authorized_keys` in your host | No | N/A
syncroot | Specifies a local directory to sync from as if it were the git project root path. | No | `.`
options | Additional options (see [documentation](https://github.com/git-ftp/git-ftp/blob/1.6.0/man/git-ftp.1.md#options)) | No | `--auto-init`
