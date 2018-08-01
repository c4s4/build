# NeON Template File (http://github.com/c4s4/neon)

default: template

targets:

  template:
    doc: Generate Flask project
    steps:
    # prompt project name, create directory and copy files
    - print: 'This template will generate a Flask project'
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
      dir:   '={_BASE}/flask'
      todir: '={_HERE}/={name}'
    # rename project in build file
    - move:   '={_HERE}/={name}/main.py'
      tofile: '={_HERE}/={name}/={name}.py'
    - move:   '={_HERE}/={name}/test_main.py'
      tofile: '={_HERE}/={name}/test_={name}.py'
    - replace: '={_HERE}/={name}/test_={name}.py'
      with:
        $NAME$: =name
    - neon:    '={_HERE}/={name}/build.yml'
      targets: 'init'
    - print: "Project generated in '={name}' directory"
