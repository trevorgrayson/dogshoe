require File.expand_path("../lib/dog_shoe/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name    = 'dogshoe'
  gem.version = DogShoe::VERSION
  gem.date    = Date.today.to_s

  gem.summary = "ORM backed by scraped websites"
  gem.description = "Modeling backed with scraped website data"

  gem.authors  = ["Trevor Grayson"]
  gem.email    = 'trevor@ipsumllc.com'
  gem.homepage = 'http://github.com/trevorgrayson/dogshoe'

  gem.add_dependency('rake')
  gem.add_development_dependency('rspec', [">= 2.0.0"])

  # ensure the gem is built out of versioned files
  gem.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
end
