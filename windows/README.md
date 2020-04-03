1. Win+R  `cmd` 입력 - 커멘드창(CLI) 진입

2. CLI에서 `powershell` 입력 - 파워쉘 진입

3. `Set-ExecutionPolicy RemoteSigned -scope CurrentUser` - 스쿱설치에 필요한 권한 주기

4. `iex (new-object net.webclient).downloadstring('https://get.scoop.sh')`  스쿱 설치

5. `scoop install 7zip openssh openssl git aria2` (scoop으로 7zip, git, aria2등 설치. 이 중 aria2는 다운로드 시간을 엄청나게 단축해주므로 반드시 설치)

6. `scoop bucket add extras` (별도 유틸등을 설치하기 위한 엑스트라 버킷 추가)

7. `scoop bucket add versions` (ruby, npm등의 버전을 골라 쓸 수 있게 해주는 버전 버킷 추가)

8. `scoop install concfg curl grep gzip nmap pshazz telnet touch vim extras/baretail extras/coretemp extras/hxd extras/postman extras/putty extras/vscode extras/wox extras/wxhexeditor`

> nmap 설치 중 에러 발생하여 우선 `scoop uninstall nmap` 명령으로 삭제

## Reference

https://crynut84.github.io/2018/01/10/building-dev-env-using-wsl/

http://youngrok.com/%EC%9C%88%EB%8F%84%EC%9A%B0%20%EA%B0%9C%EB%B0%9C%ED%99%98%EA%B2%BD%20%EC%82%BD%EC%A7%88%EA%B8%B0

https://okky.kr/article/592228
