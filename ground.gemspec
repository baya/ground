Gem::Specification.new do |s|
  s.name            = "ground"
  s.version         = "0.0.1"
  s.platform        = Gem::Platform::RUBY
  s.summary         = "build stable back-end software from ground"

  s.description = <<-EOF
    A simple ruby web framework
  EOF

  s.files           = Dir['lib/**/*,test/**/*}'] + %w(ground.gemspec Rakefile README.md)
  s.require_path    = 'lib'

  s.author          = 'guimin jiang'
  s.email           = '594359387@qq.com'

  s.add_dependency 'dun'
  s.add_dependency 'rack'

end

