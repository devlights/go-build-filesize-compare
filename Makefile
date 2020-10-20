all: \
	_prepare \
	_build-normal \
	_with-ldflags \
	_with-trimpath \
	_with-ldflags-trimpath \
	_with-upx \
	_show-filesize \
	_run

_prepare:
	$(RM) -r bin
	mkdir -p bin
	@echo '-----------------------------------------------------------'

_build-normal:
	go build -o bin/build-normal main.go

_with-ldflags:
	go build "-ldflags=-s -w" -o bin/build-with-ldflags main.go

_with-trimpath:
	go build -trimpath -o bin/build-with-trimpath main.go

_with-ldflags-trimpath:
	go build "-ldflags=-s -w" -trimpath -o bin/build-with-trimpath-ldflags main.go

_with-upx: _with-ldflags-trimpath
	upx --lzma -o bin/build-with-upx bin/build-with-trimpath-ldflags

_show-filesize:
	@echo '-----------------------------------------------------------'
	ls -1 bin/build* | xargs wc -c | head -n -1

_run:
	@echo '-----------------------------------------------------------'
	time -p bin/build-normal
	@echo '-----------------------------------------------------------'
	time -p bin/build-with-ldflags
	@echo '-----------------------------------------------------------'
	time -p bin/build-with-trimpath
	@echo '-----------------------------------------------------------'
	time -p bin/build-with-trimpath-ldflags
	@echo '-----------------------------------------------------------'
	time -p bin/build-with-upx