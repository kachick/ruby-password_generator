require './lib/password_generator/version'

Gem::Specification.new do |gem|
  # specific

  gem.description   = %q{A generator for daily passwords}

  gem.summary       = gem.description.dup
  gem.homepage      = 'http://kachick.github.com/ruby-password_generator/'
  gem.license       = 'MIT'
  gem.name          = 'password_generator'
  gem.version       = PasswordGenerator::VERSION.dup

  gem.add_runtime_dependency 'optionalargument', '~> 0.1'

  gem.add_development_dependency 'rspec', '>= 3.8', '< 4'
  gem.add_development_dependency 'yard', '>= 0.9.20', '< 2'
  gem.add_development_dependency 'rake', '>= 10', '< 20'
  gem.add_development_dependency 'bundler', '>= 2', '< 3'


  # common

  gem.authors       = ['Kenichi Kamiya']
  gem.email         = ['kachick1+ruby@gmail.com']
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end