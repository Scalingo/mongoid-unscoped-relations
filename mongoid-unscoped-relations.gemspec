Gem::Specification.new do |s|
  s.name        = 'mongoid-unscoped-relations'
  s.version     = '0.2.1'
  s.date        = '2026-01-27'
  s.summary     = 'DEPRECATED - Mongoid extension for unscoped relations'
  s.description = 'This gem is deprecated. Extension to mongoid to define relationships which are fetched unscoped'
  s.authors     = ['Scalingo']
  s.email       = 'leo@scalingo.com'
  s.files       = [
    'lib/mongoid/unscoped_belongs_to.rb',
    'lib/mongoid-unscoped-relations.rb'
  ]
  s.homepage    =
    'http://github.com/Scalingo/mongoid-unscoped-relations'
  s.license       = 'MIT'
  s.add_dependency 'mongoid', '~> 7'
  s.add_dependency 'activesupport', '>= 5', '< 7'
  s.metadata    = {
    "deprecated" => "true",
  }
end
