# macOS

## Setup Summary

- 시스템 설정 및 파인더 설정
- backtick 설정 (한글입력 때 `₩` 대신 `` ` `` 사용)
- Homebrew 설치 및 패키지 설치
- Karbiner-elements 설정 install
- iTerm2 설정 import
- [zinit 설치](https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#install)
- `.dotfiles` 클론
- gitconfig, p10k, zsh, tmux, nvim 등 설정들 symlink
- [Git commit sign 설정](./git-commit-sign.md)


## 시스템 설정

### General

- `Language & Region` &rarr; `Preferred Languages` &rarr; 'English - Primary', 'Korean' 로 설정
- `Sharing` &rarr; `Local hostname` 편집 (Terminal 에 표시되기 때문에 가능한 짧게, 예: seunguk)
- `Date & Time` &rarr; `24-hour time` - on


### Appearance

- `Appearance` &rarr; `Dark`

### Accessibility

- `Pointer Control` &rarr; `Trackpad Options` &rarr; `Draggin style` &rarr; `Three Finger Drag` 로 설정

### Control Center

- Control Center Modules 
  - 원하는 대로 메뉴 막대 편집 (`Wi-Fi` 를 `Show is Menu Bar` 로 설정 등등)
  > 메뉴 막대에서 `Cmd` 누른 상태에서 아이콘을 드래그하여 편집 가능

- Other Modules
  - `Battery`
      - `Show in Menu Bar` - on
      - `Show in Control Center` - off
      - `Show Percentage` - on

- Menu Bar Only
  - `Clock` &rarr; `Clock options…`
      - `Show date` &rarr; `Never`
      - `Show the day of the week` - off
  - `Spotlight` &rarr; `Don’t Show in Menu Bar`
  - `Siri` &rarr; `Don’t Show in Menu Bar`
  - `Time Machine` &rarr; `Don’t Show in Menu Bar`


### Siri & Spotlight

- `Ask Siri` - off

### Privacy & Security

- `FileVault` - on

### Desktop & Dock

- `Automatically hide and show the Dock` - on

### Displays

- `True Tone` - off

### Lock Screen

- `Require password after screen saver begin or display is turned off` 를 `Immediately` 로 설정

### Keyboard
- `Key repeat rate` - fast
- `Delay until repeat` - short
- `Adjust keyboard brightness in low light` - off
- `keyboard brightness` - off
- `Keyboard navigation` - on

Text Input 
- `Input Sources` &rarr; `Edit…` &rarr; 모두 off
- `Text Replacements…` &rarr; 모두 제거

### Trackpad

- `Trackpad` &rarr; `Point & Click` &rarr; `Tab to click` 체크

## 파인더 설정

파인더(Finder)를 실행하고, `Finder` &rarr; `Settings` 를 선택 (`Cmd` + `,`)
- `General` &rarr; `New Finder windows show` &rarr; 자신의 홈 디렉토리 선택
- `Sidebar` 에서 폴더 제거 및 추가하여 Finder 왼쪽의 즐겨찾기 목록을 수정
- `Advanced`
  - `Show all filename extensions` 체크
  - 폴더를 우선 정렬를 위해 `Keep folders on top` &rarr; `In windows when sorting by name` 체크
  - `When performing a search` &rarr; `Search the Current Folder`

### 다운로드 폴더 옵션

`Downloads` 폴더로 이동하고 `View` &rarr; `Show View Options` 를 선택 (`Cmd` + `J`)
- `Group By` &rarr; `Date added`
- `Sort By` &rarr; `Name`

## Homebrew
- [Homebrew 설치](https://brew.sh/)
- [패키지들 설치](./macos-brew-packages.md)

## Advanced configs

### backtick

한글입력 때 `₩` 대신 `` ` `` 입력

```
mkdir ~/Library/KeyBindings

cat <<EOF > ~/Library/KeyBindings/DefaultKeyBinding.dict
{
  "₩" = ("insertText:", "\`");
  "~₩" = ("insertText:", "₩");
}
EOF
```

OS 재시작 필요.

`₩` 입력하려면 한글입력 상태에서 `Opt` + `` ` ``

### 영어 키 꾹 누를 때 반복되어 입력하게 만들기

```
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
```

VSCode 에서만 적용하고 싶으면:

```
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
```


### Shift + Space 로 빠르게 한영 전환하기 (opt)

```
defaults export com.apple.symbolichotkeys - | plutil -convert json -o - - |
  jq '.AppleSymbolicHotKeys["61"].value.parameters[2] = 131072 | .AppleSymbolicHotKeys["60"].value.parameters[2] = 655360' |
  plutil -convert xml1 -o - - | defaults import com.apple.symbolichotkeys -
```

OS 재시작 필요.

### Use sudo with TouchID (opt)

```
cat - /etc/pam.d/sudo <<< 'auth sufficient pam_tid.so' | sudo tee /etc/pam.d/sudo
```

## iTerm2 설정 import

iTerm2 &rarr; Settings 선택 (`Cmd` + `,`) 
  - `General` &rarr; `Preferences`
    - `Load preferences from a custom folder or URL` 체크 &rarr; `~/.dotfiles/iterm2` 로 경로 설정 &rarr; `Copy local preference to custom folder now?` 라는 창이 뜨면  `Don't Copy` 선택
    - `Save changes` &rarr; `Manually` 또는 `Automatically` 선택  

또는

`~/Library/Preferences/com.googlecode.iterm2.plist` 파일 대신 나의 iTerm2 설정 파일로 overwrite 하면 된다.

```
cp ~/.dotfiles/iterm2/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

overwrite /Users/seunguk/Library/Preferences/com.googlecode.iterm2.plist? (y/n [n]) y
```

## Other configs
- [Karbiner-elements 설정 install](https://genesy.github.io/karabiner-complex-rules-generator/#eyJ0aXRsZSI6InNldW5ndWtsZWUncyBrYXJhYmluZXIgc2V0dGluZ3MiLCJydWxlcyI6W3siZGVzY3JpcHRpb24iOiJjYXBzX2xvY2sgdG8gbGVmdF9jb250cm9sIiwibWFuaXB1bGF0b3JzIjpbeyJmcm9tIjp7ImtleV9jb2RlIjoiY2Fwc19sb2NrIiwibW9kaWZpZXJzIjp7Im9wdGlvbmFsIjpbImFueSJdfX0sInRvIjpbeyJrZXlfY29kZSI6ImxlZnRfY29udHJvbCJ9XSwidHlwZSI6ImJhc2ljIn1dfV19)
- [zinit 설치](https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#install)
- `.dotfiles` 클론
- gitconfig, p10k, zsh, tmux, nvim 등 설정들 symlink (or [bootstrap.sh](../bootstrap.sh) 실행)
- [Git commit sign 설정](./git-commit-sign.md)

## Reference

- [simnalamburt dotfiles's macos docs](https://github.com/simnalamburt/.dotfiles/blob/master/docs/macos.md)
- [subicura - macOS 안내서](https://subicura.com/mac/setup/hello.html)
- [Sangkon Han - 개발자를 위한 macOS(>= Sonoma) 설정](https://www.sangkon.com/osx-setting-for-developer/)
