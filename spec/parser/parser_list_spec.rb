require 'spec_helper'

#
filter_ex = {:act_num=>"974-VIII", :act_date=>"03.02.2016",
 :act_name=>"Постанова Верховної Ради України про порядок денний четвертої сесії Верховної Ради України восьмого скликання",
 :law_num=>"3855", :law_date=>"01.02.2016"}

page = "http://w1.c1.rada.gov.ua/pls/site2/p_bills_stand_laws"


describe ListOfLaws, vcr: { cassette_name: 'list' } do


  let(:pars) { ListOfLaws.new(page) }

  describe '#to_parse' do 
    it { expect(pars.to_parse) == Array }
    it { expect(pars.to_parse).not_to be_nil }
    it { expect(ListOfLaws.new("some_text")) == 'Page not found' }
  end
#має повертати масив із хешами, що відповідають шаблону
  describe '#filter' do
    it { expect(pars.filter).not_to be_falsey }
    it { expect(pars.filter[-1]).to eq filter_ex }
    it { expect(pars.filter[1]).not_to eq filter_ex }
    it { expect(pars.filter[0]).to include :act_num, :act_date, :act_name, :law_num, :law_date }
    it { expect(pars.filter[-1]).not_to be_empty }
  end

  describe '#create_database' do
    #не шарю - пишу просто так
  end
end