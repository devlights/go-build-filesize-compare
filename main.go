package main

import (
	"fmt"
	"os"
	"strconv"

	"github.com/devlights/gomy/output"
)

func main() {
	os.Exit(run())
}

func run() int {
	fmt.Printf("hello %s[%s]\n", "Go", strconv.Itoa(999))
	output.Stdoutl("[message]", "hello Go")
	return 0
}
