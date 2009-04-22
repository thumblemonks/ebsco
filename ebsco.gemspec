Gem::Specification.new do |s|
  s.name     = "ebsco"
  s.version  = "0.1"
  s.date     = "2009-04-21"
  s.summary  = "An Ebsco, health library, web services, ruby API"
  s.email    = %w[gus@gusg.us]
  s.homepage = "http://github.com/thumblemonks/ebsco"
  s.description = "An Ebsco, health library, web services, ruby API. Based on HTTParty and HappyMapper."
  s.authors  = %w[Justin\ Knowlden]

  s.has_rdoc = false
  s.rdoc_options = ["--main", "README.markdown"]
  s.extra_rdoc_files = ["HISTORY.txt", "README.markdown"]

  # run git ls-files to get an updated list
  s.files = %w[
    MIT-LICENSE
    README.markdown
    Rakefile
    lib/ebsco.rb
    lib/ebsco/entry_point.rb
  ]
  
  s.test_files = %w[
    test/entry_point_test.rb
    test/samples/entry_point.xml
    test/test_helper.rb
  ]
end
