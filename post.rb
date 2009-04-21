dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'happymapper'

file_contents = File.read('./posts.xml')

class Post
  include HappyMapper
  
  attribute :href, String
  attribute :hash, String
  attribute :description, String
  attribute :tag, String
  attribute :time, DateTime
  attribute :others, Integer
  attribute :extended, String
end

posts = Post.parse(file_contents)
posts.each { |post| puts "D:#{post.description}", "H:#{post.href}",  "E:#{post.extended}", '' }