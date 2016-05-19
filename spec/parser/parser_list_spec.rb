require 'spec_helper'

#
<<<<<<< HEAD
filter_ex = {:act_num=>"1071-VIII", :act_date=>"31.03.2016", 
  :act_name=>"Постанова Верховної Ради України про прийняття за основу проекту Закону України про внесення змін
   до деяких законів України щодо врегулювання особливостей ліцензування господарської діяльності з надання фінансових послуг",
 :law_num=>"3739/П", :law_date=>"27.01.2016"}
=======
filter_ex = {:act_num=>"974-VIII", :act_date=>"03.02.2016",
 :act_name=>"Постанова Верховної Ради України про порядок денний четвертої сесії Верховної Ради України восьмого скликання",
 :law_num=>"3855", :law_date=>"01.02.2016"}
>>>>>>> 6d02a66... write ListOfLaw#filter

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
<<<<<<< HEAD
    it { expect(pars.filter).not_to be_falsey}
    it { expect(pars.filter[1]) == filter_ex }
    it { expect(pars.filter[0]).to include :act_num, :act_date, :act_name, :law_num, :law_date}
    it { expect(pars.filter[-1]).not_to be_empty}
=======
    it { expect(pars.filter).not_to be_falsey }
    it { expect(pars.filter[-1]).to eq filter_ex }
    it { expect(pars.filter[1]).not_to eq filter_ex }
    it { expect(pars.filter[0]).to include :act_num, :act_date, :act_name, :law_num, :law_date }
    it { expect(pars.filter[-1]).not_to be_empty }
>>>>>>> 6d02a66... write ListOfLaw#filter
  end

end