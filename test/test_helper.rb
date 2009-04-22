require 'test/unit'
require 'rubygems'
require 'shoulda'
require 'mocha'

require 'ebsco'
require 'ruby-debug'

class Test::Unit::TestCase
  def read_sample_file(base_filename)
    File.read(File.dirname(__FILE__) + "/samples/#{base_filename}.xml")
  end

  # def self.sample(base_filename)
  #   define_method(:setup) do
  #     @sample_file = read_sample_file(base_filename)
  #   end
  # end
end
