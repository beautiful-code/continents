require 'yaml'

module Ravibhim
  module Continents
    CONTINENTS = ['Asia', 'Australia', 'Europe', 'Africa', 'North America', 'South America']

    # Load countries from yaml files.
    # and build up country to continent mapping
    COUNTRY_TO_CONTINENT = {}
    CONTINENTS.each do |cont|
      cont_file_name = cont.downcase.gsub(' ','_')
      cont_const_name = cont.upcase.gsub(' ','_')

      countries = YAML.load_file(File.dirname(__FILE__) + "/data/#{cont_file_name}.yml")
      countries.each do |country|
        COUNTRY_TO_CONTINENT[country] = cont
      end

      const_set("#{cont_const_name}_COUNTRIES", countries)
    end


    def self.get_continent(country)
      COUNTRY_TO_CONTINENT[country]
    end
  end
end
