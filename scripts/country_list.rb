CONTINENT = 'SA'
File.open("wiki_list.txt", "r") do |infile|
  while (line = infile.gets)
    (cont, ignore1, ignore2, ignore3, *country_tokens) = line.split(' ')
    next unless(cont == CONTINENT)

    country = country_tokens.join(' ')
    (simple_country, igonore) = country.split(',')
    simple_country.strip!
    puts "- #{simple_country}" 
  end
end
