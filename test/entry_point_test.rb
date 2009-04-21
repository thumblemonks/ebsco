require 'test_helper'

class EntryPointTest < Test::Unit::TestCase
  def sample_file
    File.read(File.dirname(__FILE__) + '/samples/entry_point.xml')
  end

  def setup
    @site_article = Ebsco::SiteArticle.parse(sample_file)
  end

  should("define iid attribute") { assert_equal 36334, @site_article.iid }
  should("define lang attribute") { assert_equal "en", @site_article.lang }

  context "ArticleBody > LinkList" do
    setup do
      @link_list = @site_article.article_body.link_list
    end

    should("define header element") { assert_equal "Content Selection", @link_list.header }
    
    context " > ArticleLink" do
      setup do
        @article_links = @link_list.article_links
        @inbrief_link = @article_links.first
      end

      should("define two article links") { assert_equal 2, @article_links.length }

      should("define chunkiid for first link") { assert_equal 33341, @inbrief_link.chunkiid }
      should("define docid for first link") { assert_equal "/dci/index", @inbrief_link.docid }
      should("define linkto for first link") { assert_equal "doc", @inbrief_link.linkto }
      should("define text for first link") { assert_equal "Conditions InBrief", @inbrief_link.text }
    end
  end
end
