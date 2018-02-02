# Neon template file (http://github.com/c4s4/neon)

default: template

targets:

  template:
    doc: Generate Python project
    steps:
    # prompt project name, create directory and copy files
    - print: 'This template will generate a Python project'
    - prompt:  'Name of this project'
      to:      'name'
      pattern: '^\w+$'
      error:   'Project name must be made of letters, numbers, - and _'
    - if: 'exists(joinpath(_HERE, name))'
      then:
      - throw: 'Project directory already exists'
    - mkdir: '={_HERE}/={name}'
    - copy:  '**/*'
      dir:   '={_BASE}/python'
      todir: '={_HERE}/={name}'
    # rename project in build file
    - replace: '={_HERE}/={name}/build.yml'
      with:    {"name": =name}
    - move:   '={_HERE}/={name}/main.py'
      tofile: '={_HERE}/={name}/={name}.py'
    - print: "Project generated in '={name}' directory"
    - print: "You should run 'neon init' in the project directory"
