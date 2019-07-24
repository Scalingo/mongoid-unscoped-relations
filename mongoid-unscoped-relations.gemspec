Gem::Specification.new do |s|
  s.name        = 'mongoid-unscoped-relations'
  s.version     = '0.2.0'
  s.date        = '2019-07-24'
  s.summary     = 'Mongoid extension for unscoped relations'
  s.description = 'Extension to mongoid to define relationships which are fetched unscoped'
  s.authors     = ['Léo Unbekandt']
  s.email       = 'leo@scalingo.com'
  s.files       = [
    'lib/mongoid/unscoped_belongs_to.rb',
    'lib/mongoid-unscoped-relations.rb'
  ]
  s.homepage    =
    'http://github.com/Scalingo/mongoid-unscoped-relations'
  s.license       = 'MIT'
  s.add_dependency 'mongoid', '~> 7'
  s.add_dependency 'activesupport', '~> 5'
end
