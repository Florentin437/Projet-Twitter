require 'nokogiri'
require 'open-uri'


@annuaire = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
@nom_mairies = []

	@annuaire.xpath('//*[@class="lientxt"]').map do |v|
		@nom_mairies << v.text
	end


#def townhall_url
@annuaire = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
i = 0
	@mairie_href = @annuaire.xpath('//*[@class="lientxt"]/@href').map do |i|
		i.text
end
#end


#def get_townhall_email(townhall_url) #---> email des villes
	
	x = 0
	email_list = [] 
	@mairie_href.map do |x|
	html_mairies = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/#{x}"))

		html_mairies.xpath('//section[2]/div/table/tbody//tr[4]/td[2]').map do |mail|
			email_list << mail.text  
		end
	end

#end

while @email_list != nil do

mairie_email_list = Hash[@nom_mairies.zip(@email_list)]

end

puts mairie_email_list 


#@annuaire = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))


#def mairies_list(page)
	#name = @page.xpath('//*[@class="lientxt"]').map do |i|
	#i.text
	#end
#end

#puts mairies_list(@page)

#def email_collecter(get_townhall_email)
#i = 0
#while 