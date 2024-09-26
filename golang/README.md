# Sample Go Project

Sample Go project to customize.

## Installation

### Unix users (Linux, BSDs and MacOSX)

Unix users may download and install latest *project* release with command:

```bash
sh -c "$(curl http://sweetohm.net/dist/project/install)"
```

If *curl* is not installed on you system, you might run:

```bash
sh -c "$(wget -O - http://sweetohm.net/dist/project/install)"
```

**Note:** Some directories are protected, even as *root*, on **MacOSX** (since *El Capitan* release), thus you can't install *project* in */usr/bin* for instance.

### Binary package

Otherwise, you can download latest binary archive at <https://github.com/c4s4/project/releases>. Unzip the archive, put the binary of your platform somewhere in your *PATH* and rename it *project*.

## Usage

To ensure that command *build args* only runs once at a time, you would type:

```bash
project 12345 build args
```

*Enjoy:*
