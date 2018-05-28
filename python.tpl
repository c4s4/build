# NeON Template File (http://github.com/c4s4/neon)

default: template

targets:

  template:
    doc: Generate Python project
    steps:
    # prompt project name, create directory and copy files
    - print: 'This template will generate a Python project'
    - print: 'Python must be installed with virtualenv and pip'
    - prompt:  'Name of this project'
      to:      'name'
      pattern: '^[\w_]+$'
      error:   'Project name must be made of letters, numbers and underscore'
    - if: 'exists(joinpath(_HERE, name))'
      then:
      - throw: 'Project directory already exists'
    - mkdir: '={_HERE}/={name}'
    - copy:  '**/*'
      dir:   '={_BASE}/python'
      todir: '={_HERE}/={name}'
    # rename project in build file
    - mkdir: '={_HERE}/={name}/={name}'
    - touch: '={_HERE}/={name}/={name}/__init__.py'
    - move:   '={_HERE}/={name}/__main__.py'
      tofile: '={_HERE}/={name}/={name}/__main__.py'
    - move:   '={_HERE}/={name}/main.py'
      tofile: '={_HERE}/={name}/={name}/main.py'
    - move:  'test_main.py'
      dir:   '={_HERE}/={name}'
      todir: '={_HERE}/={name}/={name}'
    - replace: '={_HERE}/**/*_main*.py'
      with:
        '$PACKAGE$': =name
    - $: ['neon', '-file', '={_HERE}/={name}/build.yml', 'init']
    - print: "Project generated in '={name}' directory"
