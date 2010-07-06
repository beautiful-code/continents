require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Continents" do

  describe "CONTINENTS" do
    it 'gets set to the list of continents' do
      %w(Asia Australia).each do |c|
        Ravibhim::Continents::CONTINENTS.should include(c)
      end
    end
  end

  describe "Asia Countries" do
    ['India', 'Sri Lanka'].each do |c|
      it "has #{c} in Asian countries" do
        Ravibhim::Continents::ASIA_COUNTRIES.should include(c)
      end
    end
  end

  describe "Australia Countries" do
    ['Australia', 'New Zealand'].each do |c|
      it "has #{c} in Asian countries" do
        Ravibhim::Continents::AUSTRALIA_COUNTRIES.should include(c)
      end
    end
  end

  describe :get_country do
    it 'returns the continent given the country' do
      Ravibhim::Continents::get_continent('India').should == 'Asia'
    end

    it 'returns nil for an unrecognized country' do
      Ravibhim::Continents::get_continent('My Own Country').should == nil
    end
  end

end
