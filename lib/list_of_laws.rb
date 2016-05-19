require 'nokogiri'
require 'httpclient'

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

#метод отримує данні від то_парс вибирає по шаблону данні законопроекту 
#і створює масив, де кожен елемент хеш, що відповідає одному закону
  def filter                                                                                    
<<<<<<< HEAD
      #read = to_parse
=======
>>>>>>> 6d02a66... write ListOfLaw#filter
      @list_array = []
      to_parse.css('table.striped tr').each do |row|
        clear_row =  row.text.split(/\n/)
        clear_row.shift   #без нього перший елемент пустий
        list_hash = {
                   :act_num  => clear_row[0],
                   :act_date => clear_row[1],
                   :act_name => clear_row[2],
                   :law_num  => clear_row[3],
                   :law_date => clear_row[4]
                    }
        @list_array << list_hash
      end
      @list_array.shift  
      return @list_array
    end
<<<<<<< HEAD


  
end

=======

end
>>>>>>> 6d02a66... write ListOfLaw#filter
