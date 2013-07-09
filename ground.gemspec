Gem::Specification.new do |s|
  s.name            = "groud"
  s.version         = "0.0.1"
  s.platform        = Gem::Platform::RUBY
  s.summary         = "foot on the ground"

  s.description = <<-EOF
    A simple ruby web framework
  EOF

  s.files           = Dir['lib/**/*,test/**/*}'] + %w(ground.gemspec Rakefile README.md)
  s.require_path    = 'lib'

  s.author          = 'guimin jiang'
  s.email           = 'kayak.jiang@gmail.com'

  s.add_development_dependency 'dun'
  s.add_development_dependency 'rack'
end

