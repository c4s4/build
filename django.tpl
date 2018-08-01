# NeON Template File (http://github.com/c4s4/neon)

default: template

properties:
  FORBIDDEN: ['django', 'test']

targets:

  template:
    doc: Generate Django project
    steps:
    # prompt project name, create directory and copy files
    - print: 'This template will generate a Django project'
    - prompt:  'Name of this project'
      to:      'name'
      pattern: '^[\w_]+$'
      error:   'Project name must be made of letters, numbers and underscore'
    - if: 'contains(FORBIDDEN, name)'
      then:
      - throw: '"={name}" is not a valid project name as it collides with an existing Python module'
    - if: 'exists(joinpath(_HERE, name))'
      then:
      - throw: 'Project directory already exists'
    - mkdir: '={_HERE}/={name}'
    - copy:  '**/*'
      dir:   '={_BASE}/django'
      todir: '={_HERE}/={name}'
    # rename project in build file
    - replace: '={_HERE}/={name}/build.yml'
      with:    {"name": =name}
    # install dependencies and start Django project
    - neon:    '={_HERE}/={name}/build.yml'
      targets: 'init'
    - chdir: '={_HERE}/={name}'
    - $: ['={_HERE}/={name}/venv/bin/django-admin', 'startproject', =name, '={_HERE}/={name}']
    - print: "Project generated in '={name}' directory"
