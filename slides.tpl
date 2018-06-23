# NeON Template File (http://github.com/c4s4/neon)

default: template

targets:

  template:
    doc: Generate Slides project
    steps:
    # prompt project name, create directory and copy files
    - print: 'This template will generate a Slides project'
    - prompt:  'Name of this project'
      to:      'name'
      pattern: '^[\w-_]+$'
      error:   'Project name must be made of letters, numbers, - and _'
    - if: 'exists(joinpath(_HERE, name))'
      then:
      - throw: 'Project directory already exists'
    - mkdir: '={_HERE}/={name}'
    - copy:  '**/*'
      dir:   '={_BASE}/slides'
      todir: '={_HERE}/={name}'
    # rename project in build file
    - replace: '={_HERE}/={name}/build.yml'
      with:    {"'Slides'": =name}
    - print: "Project generated in '={name}' directory"
