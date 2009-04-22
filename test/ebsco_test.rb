require 'test_helper'

class EbscoTest < Test::Unit::TestCase

  def setup
    Ebsco.token = "hello-world"
  end

  should "assign token to as default parameter" do
    assert_equal "hello-world", Ebsco.default_params[:Token]
  end

  should "set base uri automatically" do
    assert_equal "http://webservices.epnet.com", Ebsco.base_uri
  end

  context "index" do
    setup do
      sample_file = read_sample_file(:entry_point)
      Ebsco.expects(:get).with('/hgwebservice/HGWebservice.asmx/GetHgEntryPoint').returns(sample_file)
      @index = Ebsco.index
    end

    should "generate an site article" do
      assert_kind_of EbscoService::SiteArticle, @index
    end

    should "have two articles" do
      assert_equal 2, @index.article_body.link_list.article_links.length
    end
  end # index

end
