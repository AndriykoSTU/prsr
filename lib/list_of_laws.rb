require 'nokogiri'

class ListOfLaws
  #
  def initialize(page_url)
    @page_url = page_url        
  end

  def to_parse
    page = HTTPClient.new.get(@page_url)
    if page.status == 200
      Nokogiri::HTML(page.body.encode('Windows-1251'))   
    else
      raise NotFound, 'Page not found'      
    end   
  end


  
end