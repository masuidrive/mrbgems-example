MRuby::Gem::Specification.new('mrbgems-example') do |spec|
  spec.license = 'MIT'
  spec.authors = ['Yuichiro MASUI <masui@masuidrive.jp>']
 
  # spec.cflags = ''
 
  # spec.mruby_cflags = ''
  # spec.mruby_ldflags = ''
  # spec.mruby_libs = ''
  # spec.mruby_includes = ["#{spec.dir}/include"]
 
  # spec.rbfiles = Dir.glob("#{dir}/mrblib/*.rb")
  spec.objs << ["#{build_dir}/generated.o"]
  # spec.test_rbfiles = Dir.glob("#{dir}/test/*.rb")
  # spec.test_objs = Dir.glob("#{dir}/test/*.{c,cpp,m,asm,S}").map { |f| f.relative_path_from(dir).pathmap("#{build_dir}/%X.o") }
  # spec.test_preload = 'test/assert.rb'

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
end
