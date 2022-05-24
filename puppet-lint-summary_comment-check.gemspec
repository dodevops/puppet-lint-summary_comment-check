Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-summary_comment-check'
  spec.version     = '0.2.0'
  spec.homepage    = 'https://github.com/dodevops/puppet-lint-summary_comment-check'
  spec.license     = 'MIT'
  spec.author      = 'Dennis Ploeger'
  spec.email       = 'develop@dieploegers.de'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.test_files  = Dir['spec/**/*']
  spec.summary     = 'A puppet-lint plugin to check the @summary comment.'
  spec.description = <<-EOF
    A puppet-lint plugin to check that manifest files contain a properly formatted @summary comment.
  EOF

  spec.add_dependency             'puppet-lint', '> 1.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its', '~> 1.0'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
end
