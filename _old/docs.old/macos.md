# macOS

---

## Setup

1.  Apple ID 생성. 카드번호가 필요하다. iTunes 혹은 앱스토어를 써서 활성화해야한다.
2.  (opt) OS 최신버전으로 업데이트
3.  OS 설치 후 설정들
    - iCloud로 어느어느 항목 공유할지 설정 (데스크톱, 문서, 사진, 이메일은 공유 안해도 될 듯).
    - 트랙패드/마우스 터치옵션 설정
    - 손쉬운 사용 &rarr; 트랙패드 옵션 &rarr; 세 손가락으로 드래그하기 활성화
    - 키 반복속도, 마우스 속도 설정
    - Finder 사이드바, 초기 디렉토리 경로 변경, "모든 파일 확장자 보기"
    - Caps Lock 키를 Ctrl 키로 수정
    - (opt) FileVault로 Full Disk Encryption 수행 (참고: [본격 macOS에 개발 환경 구축하기 > 보안](https://subicura.com/2017/11/22/mac-os-development-environment-setup.html#%EB%B3%B4%EC%95%88))
4.  Homebrew, Homebrew-Cask 설치 및 패키지들 전부 설치
5.  소프트웨어 설치 후 설정들
    - `.dotfiles` 클론
    - (opt) iTerm2 설정 임포트
    - `/etc/shells`에 원하는 쉘 추가, 기본 쉘 변경
    - ssh, vimrc, gitconfig, gitexclude 등의 설정들 심링크
    - 키베이스에 디바이스 추가
    - [git 커밋사인 설정](./keybase-github.md)

## Alacritty 설정

```
# Alacritty Config
# @see https://medium.com/@pezcoder/how-i-migrated-from-iterm-to-alacritty-c50a04705f95
# @see https://github.com/alacritty/alacritty/blob/master/INSTALL.md#terminfo

# Clone alacritty
git clone https://github.com/alacritty/alacritty.git
cd alacritty

# setup terminfo
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

# cleanup
cd .. && rm -rf alacritty

defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
defaults -currentHost write -globalDomain AppleFontSmoothing -int 2
```

## (Opt) 4K가 아닌 디스플레이에 대해서도 HiDPI 강제로 활성화하기

```sh
# 켜기
sudo defaults write \
  /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true

# 끄기
sudo defaults delete \
  /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled

# Reference: https://www.tekrevue.com/tip/hidpi-mode-os-x/
```

## Reference

- [simnalamburt dotfiles's macos docs](https://github.com/simnalamburt/.dotfiles/blob/master/docs/macos.md)
