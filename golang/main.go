package main

import (
	"flag"
	"fmt"
	"os"
)

// Version as printed with -version option
var Version = "UNKNOWN"

const (
	// Help as printed with -help option
	Help = `project [-h] [-v] args
Project does something:
-help       To print this help
-version    To print version
args        Arguments`
)

// parseCommandLine parses command line and returns:
// - help: a boolean that tells if we print help
// - version: a boolean that tells if we print version
// - args: arguments passed on command line
func parseCommandLine() (*bool, *bool, []string) {
	help := flag.Bool("help", false, "Print help")
	version := flag.Bool("version", false, "Print version")
	flag.Parse()
	return help, version, flag.Args()
}

func main() {
	help, version, args := parseCommandLine()
	if *help {
		fmt.Println(Help)
		os.Exit(0)
	}
	if *version {
		fmt.Println(Version)
		os.Exit(0)
	}
	fmt.Printf("Arguments: %#v\n", args)
}
