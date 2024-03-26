Haskell 를 Vim 에서 사용하고 싶으면 빌드된 바이너리 haskell-language-server 를 다운받고 압축을 풀고 `~/.local/bin` 디렉토리로 옮겨야한다. 그리고 옮긴 파일에 실행 권한 부여 (`$ chmod +x haskell-language-server-*`). 해당 사이트를 참고.

- [coc-vim + haskell-language-server starter tutorial 2020](https://www.reddit.com/r/vim/comments/k3ar3i/cocvim_haskelllanguageserver_starter_tutorial_2020/)

- [Github - haskell-language-server's README.md#pre-built-binaries](https://github.com/haskell/haskell-language-server#pre-built-binaries)

그리고 `stack` 명령어로 프로젝트를 생성하고 해당 프로젝트에 `hie.yaml` 파일을 추가해야된다.

```yaml
cradle:
  stack:
```
