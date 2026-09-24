# name

Single-binary Go CLI. Module `name`, Go 1.27, zero dependencies. `name.go` is the entire app: it parses `-help` and `-version` flags and passes remaining arguments through unchanged.

## Commands

- Build: `go build -o build/<name>-<os>-<arch> .` (binaries belong in `build/`, which is gitignored)
- Test: `go test ./...`
- Check: `go vet ./... && gofmt -l .`

## Gotchas

- `Version` in name.go defaults to `"UNKNOWN"`; inject a real value at build time with `-ldflags "-X main.Version=<ver>"`.
- The test suite (`name_test.go`) is a placeholder — there is no real coverage yet.
- `build.yml` is a [NeON](http://github.com/c4s4/neon) build config extending `c4s4/build/golang.yml` (default tasks: fmt, lint, test); neon is installed at `~/.go/bin/neon`. Plain `go` commands above work as the local fallback.
