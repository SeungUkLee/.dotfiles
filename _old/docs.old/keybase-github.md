```
$ brew cask install gpg-suite
$ brew cask install keybase
```

가지고있는 PGP 키쌍이 없을 경우 새로 만들어야한다. 이미 키 쌍이 Keybase 에 업록드 되어 있는 경우, 기존의 키를 컴퓨터에 다운로드하면 된다.

## 1. PGP 공개키-비공개키 키쌍 등록

### 1-1. 새 키 만들어서 하는 방법

```
$ keybase login

# 새 디바이스를 위한 새 PGP키 생성
$ keybase pgp gen —multi

# keyid 확인
$ gpg --list-secret-keys --keyid-format LONG
...
---------------------------------
sec   rsa4096/{keyid} 2020-09-29 [SC] [expires: 2036-09-25]
...

$ gpg --edit-key {keyid}
# gpg> uid 1
# gpg> trust
# Your decision? 5
# Do you really want to set this key to ultimate trust? (y/N) y
# gpg> save

$ keybase pgp export -q {keyid}
```

uid 가 unknown 에서 ultimate 로 변경되는 것 같다.

`$ keybase pgp export -q {keyid}` 명령 결과를 [https://github.com/settings/keys](https://github.com/settings/keys) 에서 New GPG Key 메뉴 선택하여 public 키 등록

### 1-2. 기존 키로 하는 법

```
$ keybase login

# 키 파일로 내보냄
$ keybase pgp export -s -q {keyid} | gpg --import
```

## 2. `.gitconfig` 수정

```
[commit]
	gpgsign = true
[user]
	signingkey = {keyid}
```

## Reference & Further more

- [Outsider - GitHub에서 커밋에 서명하기](https://blog.outsider.ne.kr/1209) (Github 에서 커밋 서명하는 이유)

- [simnalamburt's keybase-github.md (gist)](https://gist.github.com/simnalamburt/c921a9e70e9a43f5b4743499370d5a88)

- [Set up Keybase.io, GPG & Git to sign commits on GitHub](https://github.com/pstadler/keybase-gpg-github)

  - [gpg: signing failed issue](https://github.com/keybase/keybase-issues/issues/2798)

- [맥에서 GPG키를 이용하여 Commit 해보기](https://ujuc.github.io/2018/10/26/maeg-e-seo_gpgki-reur_i-yong-ha-yeo_commit_hae-bo-gi/) (Git GUI 툴에서 커밋이 가능하게 옵션 추가 및 다른 컴퓨터에도 가능하게 해두는 방법)

- [GnuPG 사용법](https://johngrib.github.io/wiki/gpg/#%ED%82%A4-%EC%84%9C%EB%B2%84%EB%A1%9C-%EC%A0%84%EC%86%A1%ED%95%98%EA%B8%B0)

- [librewiki - keybase](https://librewiki.net/wiki/Keybase) (Keybase 에 대한 내용)

- [키베이스 메뉴얼](https://www.codeandfood.com/code/2019/10/24/keybase-manual-korean.html) (Keybase Device 추가 등)

- [SETTING UP KEYBASE AND GPG TOOLS(MAC)](https://www.starkandwayne.com/blog/setting-up-keybase-and-gpg-tools-mac/) (여러 keybase command 가 나온다, 생각나면 보도록하자)
