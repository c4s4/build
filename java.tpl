# Neon template file (http://github.com/c4s4/neon)

default: template

targets:

  template:
    doc: Generate Java project
    steps:
    # prompt for name, make directory and copy files
    - print: 'This template will generate a Java project'
    - prompt:  'Name of this project'
      to:      'name'
      pattern: '^[a-zA-Z0-9_]+$'
      error:   'Project name must be made of letters, numbers and _'
    - if: 'exists(joinpath(_HERE, name))'
      then:
      - throw: 'Project directory already exists'
    - mkdir: '={_HERE}/={name}'
    - copy:  '*'
      dir:   '={_BASE}/java'
      todir: '={_HERE}/={name}'
    # process java source file
    - mkdir: '={_HERE}/={name}/src/={name}'
    - replace: '={_HERE}/={name}/Main.java'
      with:    {'package package': 'package ={name}'}
    - move:  'Main.java' 
      dir:   '={_HERE}/={name}'
      todir: '={_HERE}/={name}/src/={name}' 
    # process java test file
    - mkdir: '={_HERE}/={name}/test/={name}'
    - replace: '={_HERE}/={name}/MainTest.java'
      with:    {'package package': 'package ={name}'}
    - move:  'MainTest.java'
      dir:   '={_HERE}/={name}'
      todir: '={_HERE}/={name}/test/={name}'
    # process build file
    - replace: '={_HERE}/={name}/build.yml'
      with:    {'main': =name, 'package': =name}
    - print: "Project generated in '={name}' directory"
