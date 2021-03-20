require "open-uri"

def findname(url)
	fn = url.split("/")
	nf = fn[-1]
	return nf
end	
print("[!]--> enter url -> ")
begin
	st = Time.now.to_i - Date.today.to_time.to_i
	url = gets.chomp()
	if not (url.include?("/"))
		puts "[e]--> error, check url and try again !"
		exit
	elsif not (url.include?("http") and url.include?("https"))
		url = "http://" + url
	end
	name = findname(url)

	open(name, "wb") do |file|
		file << open(url).read
	end
	#TODO : Here a file named Address is created. Empty files created due to incorrect addresses should be deleted.
rescue OpenURI::HTTPError => e

	res = e.io
	puts "[s]--> status --<> #{res.status}"
	
	puts "[e]--> error, check url and try again !"
ensure 
	et = Time.now.to_i - Date.today.to_time.to_i
       	puts "[!]--> total time : #{et - st}s" 	
end
	
