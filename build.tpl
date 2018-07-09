# NeON Template File (http://github.com/c4s4/neon)

default: template
properties:
  BUILD_FILE: |
              # NeON Build File (http://github.com/c4s4/neon)
              
              default: test
              
              targets:
              
                test:
                  doc: Test target
                  steps:
                  - print: 'Test!'

targets:

  template:
    doc: Generate build file
    steps:
    - if: 'exists(joinpath(_HERE, "build.yml"))'
      then:
      - throw: "Build file 'build.yml' already exists"
    - write: '={_HERE}/build.yml'
      text:  =BUILD_FILE
    - print: "Build file generated in build.yml"
