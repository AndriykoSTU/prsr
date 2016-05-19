require 'spec_helper'

#

describe ListOfLaws, vcr: { cassette_name: 'list' } do

  page = "http://w1.c1.rada.gov.ua/pls/site2/p_bills_stand_laws"

  let(:pars) { ListOfLaws.new(page) }

  describe '#to_parse' do 
    it { expect(pars.to_parse) == Array }
    it { expect(pars.to_parse).not_to be_nil }
    it { expect(ListOfLaws.new("some_text")) == 'Page not found' }
  end

  

end