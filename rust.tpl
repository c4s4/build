# NeON Template File (http://github.com/c4s4/neon)

default: template

targets:

  template:
    doc: Generate Rust project
    steps:
    # prompt project name, create directory and copy files
    - print: 'This template will generate a Rust project'
    - prompt:  'Name of this project'
      to:      'name'
      pattern: '^[\w_-]+$'
      error:   'Project name must be made of letters, numbers, - and _'
    - if: 'exists(joinpath(_HERE, name))'
      then:
      - throw: 'Project directory already exists'
    - mkdir: '={_HERE}/={name}'
    - copy:  '**/*'
      dir:   '={_BASE}/rust'
      todir: '={_HERE}/={name}'
      exclude: [Cargo.lock, target/**/*]
    # rename project in Cargo.toml
    - replace: '={_HERE}/={name}/Cargo.toml'
      with:    {'rust': =name}
    - replace: '={_HERE}/={name}/src/main.rs'
      with:    {'rust': =name}
    - replace: '={_HERE}/={name}/tests/integration_test.rs'
      with:    {'rust': =name}
    - replace: '={_HERE}/={name}/README.md'
      with:
        rust: =name
        Rust: '={uppercase(name[0])+name[1:]}'
    - print: "Project generated in '={name}' directory"
