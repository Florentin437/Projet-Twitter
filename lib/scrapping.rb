require 'rubygems'
require 'nokogiri'
require 'open-uri'

@page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all"))

def crypto_Xpath
  crypto_infoS = @page.xpath('//td[3] | //td[5]').map do |x|
    x.content
  end
end

def crypto_scrap(crypto_infoS)
  i = 0
  final_array = []
  while crypto_infoS[i] != nil do
    final_array << Hash[crypto_infoS[i],crypto_infoS[i+1]]
    i = i + 2
  end
  return final_array
end

puts crypto_scrap(crypto_Xpath)


