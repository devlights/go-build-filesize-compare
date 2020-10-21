# go-build-filesize-compare
This is example that compare filesize using 'go build' command

[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/devlights/go-build-filesize-compare)

## Run

Here's the result of running it on Gitpod.

```sh
$ cat /etc/os-release
NAME="Ubuntu"
VERSION="20.04 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu Focal Fossa (development branch)"
VERSION_ID="20.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal
```

```sh
$ make
rm -f -r bin
mkdir -p bin
-----------------------------------------------------------
go build -o bin/build-normal main.go
go build "-ldflags=-s -w" -o bin/build-with-ldflags main.go
go build -trimpath -o bin/build-with-trimpath main.go
go build "-ldflags=-s -w" -trimpath -o bin/build-with-trimpath-ldflags main.go
upx --lzma -o bin/build-with-upx bin/build-with-trimpath-ldflags
                       Ultimate Packer for eXecutables
                          Copyright (C) 1996 - 2018
UPX 3.95        Markus Oberhumer, Laszlo Molnar & John Reiser   Aug 26th 2018

        File size         Ratio      Format      Name
   --------------------   ------   -----------   -----------
   1409024 ->    452852   32.14%   linux/amd64   build-with-upx                

Packed 1 file.
-----------------------------------------------------------
ls -1 bin/build* | xargs wc -c | head -n -1
2056769 bin/build-normal
1409024 bin/build-with-ldflags
2056769 bin/build-with-trimpath
1409024 bin/build-with-trimpath-ldflags
 452852 bin/build-with-upx
-----------------------------------------------------------
time -p bin/build-normal
hello Go[999]
[message]            hello Go
real 0.00
user 0.00
sys 0.00
-----------------------------------------------------------
time -p bin/build-with-ldflags
hello Go[999]
[message]            hello Go
real 0.00
user 0.00
sys 0.00
-----------------------------------------------------------
time -p bin/build-with-trimpath
hello Go[999]
[message]            hello Go
real 0.00
user 0.00
sys 0.00
-----------------------------------------------------------
time -p bin/build-with-trimpath-ldflags
hello Go[999]
[message]            hello Go
real 0.00
user 0.00
sys 0.00
-----------------------------------------------------------
time -p bin/build-with-upx
hello Go[999]
[message]            hello Go
real 0.08
user 0.06
sys 0.01
```

## REFERENCES

- [How to reduce compiled file size?](https://stackoverflow.com/questions/3861634/how-to-reduce-compiled-file-size)
- [よく使うGoのBuildオプションと、UPXの圧縮がバイナリサイズにどの程度影響しているか調べた](https://qiita.com/laqiiz/items/80c103e719346f398b37)
- [[v1.13版] goでスタティックバイナリを生成する方法](https://iguchitomokatsu.com/posts/how-to-make-static-binary-of-golang/)
- [go tool link](https://golang.org/cmd/link/)
- [go build (Compile packages and dependencies)](https://golang.org/cmd/go/#hdr-Compile_packages_and_dependencies)
- [[Linux]wcコマンドの意外な使い方](https://cammy.co.jp/technical/2016/09/29/linuxwc%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%81%AE%E4%BB%A5%E5%A4%96%E3%81%AA%E4%BD%BF%E3%81%84%E6%96%B9/)
- [Remove the last line from a file in Bash](https://stackoverflow.com/questions/4881930/remove-the-last-line-from-a-file-in-bash)
- [デバッグ情報の歩き方](https://qiita.com/mhiramat/items/8df17f5113434e93ff0c)
