# NeON Template File (http://github.com/c4s4/neon)

default: template

targets:

  template:
    doc: Generate Golang Webservice project
    steps:
    # prompt project name, create directory and copy files
    - print: 'This template will generate a Golang Webservice project'
    - prompt:  'Name of this project'
      to:      'name'
      pattern: '^\w+$'
      error:   'Project name must be made of letters, numbers, - and _'
    - if: 'exists(joinpath(_HERE, name))'
      then:
      - throw: 'Project directory already exists'
    - mkdir: '={_HERE}/={name}'
    - copy:  '*'
      dir:   '={_BASE}/golangws'
      todir: '={_HERE}/={name}'
    # rename go source file and test
    - move:   '={_HERE}/={name}/main.go'
      tofile: '={_HERE}/={name}/={name}.go'
    - move:   '={_HERE}/={name}/main_test.go'
      tofile: '={_HERE}/={name}/={name}_test.go'
    - replace: '={_HERE}/={name}/build.yml'
      with:    {'main': =name}
    - print: "Project generated in '={name}' directory"
