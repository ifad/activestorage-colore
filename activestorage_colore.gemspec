# frozen_string_literal: true

require File.expand_path('lib/activestorage/colore/version', __dir__)

Gem::Specification.new do |spec|
  spec.name          = 'activestorage-colore'
  spec.version       = ActiveStorage::Colore::VERSION
  spec.authors       = ['Diego Rosario Brogna']
  spec.email         = ['d.brogna@ifad.org']

  spec.summary       = 'Active Storage Colore Service'
  spec.homepage      = 'https://github.com/ifad/activestorage-colore'
  spec.license       = 'MIT'

  spec.files         = Dir.glob('{LICENSE,README.md,lib/**/*.rb}', File::FNM_DOTMATCH)
  spec.require_paths = ['lib']

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/ifad/activestorage-colore/issues',
    'homepage_uri' => 'https://github.com/ifad/activestorage-colore',
    'source_code_uri' => 'https://github.com/ifad/activestorage-colore',
    'rubygems_mfa_required' => 'true'
  }

  spec.required_ruby_version = '>= 3.1'

  spec.add_dependency 'activestorage', '>= 7.1'
end
