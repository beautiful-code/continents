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

  describe "Africa Countries" do
    ['South Africa', 'Egypt'].each do |c|
      it "has #{c} in Africa countries" do
        Ravibhim::Continents::AFRICA_COUNTRIES.should include(c)
      end
    end
  end

  describe "Australia Countries" do
    ['Australia', 'New Zealand'].each do |c|
      it "has #{c} in Australian countries" do
        Ravibhim::Continents::AUSTRALIA_COUNTRIES.should include(c)
      end
    end
  end

  describe "Europe Countries" do
    ['United Kingdom', 'Germany'].each do |c|
      it "has #{c} in European countries" do
        Ravibhim::Continents::EUROPE_COUNTRIES.should include(c)
      end
    end
  end

  describe "North America Countries" do
    ['United States of America', 'Canada'].each do |c|
      it "has #{c} in North America countries" do
        Ravibhim::Continents::NORTH_AMERICA_COUNTRIES.should include(c)
      end
    end
  end

  describe "South America Countries" do
    ['Brazil', 'Argentina'].each do |c|
      it "has #{c} in South America countries" do
        Ravibhim::Continents::SOUTH_AMERICA_COUNTRIES.should include(c)
      end
    end
  end

  describe "COUNTRIES" do
    it 'gets set to the list of countries' do
      ['India', 'Australia', 'United States of America', 'France', 'Argentina', 'Nigeria' ].each do |c|
        Ravibhim::Continents::COUNTRIES.should include(c)
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

  describe :get_countries do
    it 'returns the countries in a continent' do
      Ravibhim::Continents::get_countries('Asia').should include('India')
      Ravibhim::Continents::get_countries('Asia').should include('Sri Lanka')

      Ravibhim::Continents::get_countries('North America').should include('United States of America')
      Ravibhim::Continents::get_countries('Europe').should include('Germany')
    end
  end

end
