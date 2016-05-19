require 'nokogiri'
require 'httpclient'
require 'sqlite3'
require 'fileutils'

class ListOfLaws
  #
  def initialize(page_url, db_dir= "#{ENV['HOME']}/parsed_voting")
    @page_url = page_url 
    @db_dir   = db_dir       
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

#створює базу данних і директорію, якщо їх немає, за умовчанням створюється в home/user  
  def create_database
    FileUtils.mkdir_p(@db_dir) unless Dir.exist?(@db_dir) 
       
    unless File.exists? "#{@db_dir}/list_of_parsed_links.sqlite"
      @db = SQLite3::Database.new "#{@db_dir}/list_of_parsed_links.sqlite"
      @db.execute("CREATE TABLE parsed_list (act_number,_act_date, name, law_number, law_date)")
    else
      nil
    end   
  end

  def count
        #передає не парсовані елементи іншому класу     
  end

  def checker
        #перевыря чи елемент зведений до бази
        #і передає його count та add_to_data - якщо не зведений       
  end

  def add_to_data
      #додає в кінець бази нові зведені списки
      #     
  end

end

