# -*- encoding: utf-8 -*-
# stub: namelib 2.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "namelib"
  s.version = "2.1.0"

  s.require_paths = ["lib"]
  s.authors = ["Aaron Patterson", "Gaspard d'Hautefeuille"]
  s.date = "2017-09-30"
  s.description = "namelib is a Ruby fork of NameCase, a library for converting denormalized names to be properly cased."
  s.email = ["ruby@dhautefeuille.eu"]
  s.extra_rdoc_files = ["History.txt", "LICENSE.txt", "Manifest.txt", "README.md"]
  s.files = [".gemtest", "Gemfile", "History.txt", "LICENSE.txt", "Manifest.txt", "README.md", "Rakefile", "lib/namelib.rb", "test/test_namelib.rb"]
  s.homepage = "https://github.com/HLFH/namelib/"
  s.licenses = ["GPL-3.0"]
  s.rdoc_options = ["--main", "README.md"]
  s.rubygems_version = "2.4.5"
  s.summary = "Ruby gem that properly cases your clients' names"
  s.test_files = ["test/test_namelib.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<minitest>, ["~> 5.0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.13"])
    else
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<minitest>, ["~> 4.0"])
      s.add_dependency(%q<hoe>, ["~> 3.13"])
    end
  else
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<minitest>, ["~> 4.0"])
    s.add_dependency(%q<hoe>, ["~> 3.13"])
  end
end
