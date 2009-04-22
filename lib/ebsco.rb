require 'httparty'
require 'happymapper'

require 'ebsco/entry_point'

class Ebsco
  include HTTParty
  base_uri 'webservices.epnet.com'

  class << self
    def token=(token)
      default_params :Token => token
    end

    def index
      EbscoService::SiteArticle.parse get('http://webservices.epnet.com/hgwebservice/HGWebservice.asmx/GetHgEntryPoint').body
    end

    def article(chunkiid)
      puts "EBSCO: #{{"ChunkIID" => chunkiid}.inspect}"
      get('http://webservices.healthgate.com/healthinfo/Library.asmx/GetArticle', {"ChunkIID" => chunkiid}).body
    end
  end
end
