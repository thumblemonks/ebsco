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
      EbscoService::SiteArticle.parse get('/hgwebservice/HGWebservice.asmx/GetHgEntryPoint').body
    end
  end
end
