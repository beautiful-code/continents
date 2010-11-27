require 'yaml'

module Ravibhim
  module Continents
    CONTINENTS = ['Asia', 'Australia', 'Europe', 'Africa', 'North America', 'South America']

    # Load countries from yaml files.
    # and build up country to continent mapping
    
    COUNTRY_TO_CONTINENT = {}
    COUNTRY_TO_CODE = {}
    CONTINENTS.each do |cont|
      cont_file_name = cont.downcase.gsub(' ','_')
      cont_const_name = cont.upcase.gsub(' ','_')

      country_info = YAML.load_file(File.dirname(__FILE__) + "/data/#{cont_file_name}.yml")
      countries = []

      country_info.each do |country_code|
        country, code = country_code.split('#')
        countries << country
        COUNTRY_TO_CONTINENT[country] = cont
        COUNTRY_TO_CODE[country] = code
      end

      const_set("#{cont_const_name}_COUNTRIES", countries)
    end

    COUNTRIES = COUNTRY_TO_CONTINENT.keys.sort

    def self.get_continent(country)
      COUNTRY_TO_CONTINENT[country]
    end

    def self.get_countries(cont)
      cont_const_name = cont.upcase.gsub(' ','_')
      const_get("#{cont_const_name}_COUNTRIES")
    end

    def self.get_iso_3166_1_code(country)
      COUNTRY_TO_CODE[country]
    end
  end
end
