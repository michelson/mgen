# Mgen

mruby gem (mgem) generator

mgen is a ruby cli to generate mruby gem projects

`$ gem install mgen`

## Usage

```
Tasks:
  mgen help [TASK]  # Describe available tasks or one specific task
  mgen info         # information about Mgen.
  mgen new <name>   # generates a new mgem project.
```

the mgem project will generate the maximal GEM structure based on mruby standard:

```
+- GEM_NAME           <- Name of GEM
   |
   +- include/        <- Header for Ruby extension (will exported)
   |
   +- mrblib/         <- Source for Ruby extension
   |
   +- src/            <- Source for C extension
   |
   +- test/           <- Test code (Ruby)
   |
   +- mrbgem.rake     <- GEM Specification
   |
   +- build_config.rb <- Build configuration
   |
   +- README.md       <- Readme for GEM
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
