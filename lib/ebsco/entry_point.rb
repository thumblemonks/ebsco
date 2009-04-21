module Ebsco

  class TextNode
    def self.parse(xml, options={})
      xml.children.to_s
    end
  end

  class ArticleLink
    include HappyMapper
    tag 'ArticleLink'

    attribute :chunkiid, Integer
    attribute :docid, String
    attribute :linkto, String
    element :text, TextNode
  end

  class LinkList
    include HappyMapper
    tag 'LinkList'
    element :header, String, :tag => 'ListHeader'
    has_many :article_links, ArticleLink
  end

  class ArticleBody
    include HappyMapper
    tag 'ArticleBody'
    has_one :link_list, LinkList
  end

  class SiteArticle
    include HappyMapper
    tag 'HGOnSiteArticle'
  
    attribute :iid, Integer
    attribute :lang, String

    has_one :article_body, ArticleBody
  end

end # Ebsco
