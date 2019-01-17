require 'rspec'
require 'nokogiri'
require 'rubygems'
require 'open-uri'

def crypto
  #Url => Nokogiri::HTML::Document
  symbol = []
  value = []
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))


  #récupére le cours de toutes les cryptomonnaies,
  price_crypto = page.xpath('//*[@class="price"]').collect{|x| x.text}

  #récupére le nom de toutes les cryptomonnaies
  name_crypto = page.xpath('//*[@class="currency-name-container link-secondary"]').collect{|x| x.text}

 # dans une array de hashs.
  cryptocurrencies_price = name_crypto.zip(price_crypto)
  final_array = []
  cryptocurrencies_price.each do |e|
    final_array << {e[0] => e[1]}
  end
  print final_array
  return final_array

end
