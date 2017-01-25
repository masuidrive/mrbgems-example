MRuby::Gem::Specification.new('mrbgems-example') do |spec|
  spec.license = 'MIT'
  spec.authors = ['Yuichiro MASUI <masui@masuidrive.jp>']

  spec.objs << ["#{build_dir}/generated.o"]
  spec.test_preload = "#{dir}/test/assert2.rb"
  spec.add_test_dependency('mruby-print', :core => 'mruby-print')

  # rules
  generated_file = "#{build_dir}/generated.c"
  result_txt = "#{dir}/result.txt"

  # generated.c made from result.txt
  file generated_file.ext('o') => generated_file
  task generated_file => result_txt do |t|
    result = IO.read(result_txt).chomp
    open(t.name, 'w') do |f|
      f.puts "int result3() { return #{result}; }"
    end
  end
  
  # more options

  # Add compile flags
  # spec.cc.flags << ''

  # Add cflags to all
  # spec.mruby.cc.flags << '-g'

  # Add libraries
  # spec.linker.libraries << 'external_lib'

  # Default building fules
  # spec.rbfiles = Dir.glob("#{dir}/mrblib/*.rb")
  # spec.objs = Dir.glob("#{dir}/src/*.{c,cpp,m,asm,S}").map { |f| objfile(f.relative_path_from(dir).pathmap("#{build_dir}/%X")) }
  # spec.test_rbfiles = Dir.glob("#{dir}/test/*.rb")
  # spec.test_objs = Dir.glob("#{dir}/test/*.{c,cpp,m,asm,S}").map { |f| objfile(f.relative_path_from(dir).pathmap("#{build_dir}/%X")) }
  # spec.test_preload = 'test/assert.rb'

end
