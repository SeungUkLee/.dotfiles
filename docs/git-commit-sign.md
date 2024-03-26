```
brew install gnupg pinentry-mac
```

## PGP key pair 등록

가지고있는 PGP 키쌍이 없을 경우 새로 만들어야한다. 이미 키 쌍이 있는 경우, 비밀키를 컴퓨터에 다운로드한다.

### 기존 키로 하는 방법

- 비밀키를 컴퓨터에 다운로드
- `gpg --import private.key`
- `gpg --list-secret-keys` 로 키 아이디 확인
- `gpg --edit-key {키 아이디}` 로 신뢰 레벨을 올려주는 절차가 필요

```
gpg> trust
Your decision? 5
Do you really want to set this key to ultimate trust? (y/N) y
gpg> save
```

### 새로운 키 만드는 방법

- `gpg --full-generate-key` or `gpg --generate-key`
```
Real name: Seunguk Lee
Email address: inheritlucem@gmail.com
You selected this USER-ID:
    "Seunguk Lee <inheritlucem@gmail.com"

Change (N)ame, (E)mail, or (O)kay/(Q)uit? O
```

- `gpg --list-secret-keys` 로 새 키가 만들어진 것을 확인할 수 있음
```
sec   ed25519 2024-03-13 [SC]
      2606E551EF74EB100BAB85C9D9A9418ADDF844A2
uid           [ultimate] Seunguk Lee <inheritlucem@gmail.com>
ssb   cv25519 2024-03-13 [E]
```

## `.gitconfig` 수정

```
[commit]
  gpgsign = true

[user]
  signingkey = ...
```


## References

- [simnalamburt - 깃 커밋 서명하는법](https://gist.github.com/simnalamburt/c921a9e70e9a43f5b4743499370d5a88)
- [Github Docs - GPG 커밋 서명 확인](https://docs.github.com/ko/authentication/managing-commit-signature-verification/about-commit-signature-verification#gpg-commit-signature-verification)
