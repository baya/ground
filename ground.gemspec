Gem::Specification.new do |s|
  s.name            = "ground"
  s.version         = "0.0.2"
  s.date            = "2014-06-25"
  s.platform        = Gem::Platform::RUBY
  s.summary         = "build stable back-end software from ground"
  s.homepage        = "https://github.com/baya/ground"
  s.license         = 'MIT'

  s.description = <<-EOF
    A simple ruby web framework
  EOF

  s.files           = Dir['{lib/**/*,test/**/*}']
  s.require_path    = 'lib'

  s.author          = 'jgm'
  s.email           = '594359387@qq.com'

end

