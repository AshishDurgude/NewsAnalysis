import scrapy
class DmozSpider(scrapy.Spider):
	name = "dmoz1"
	allowed_domains = ["punemirror.in"]
	start_urls = [
    "http://www.punemirror.in"
	]
	def parse(self, response):
		filename = response.url.split("/")[-2] + '.html'
		with open(filename, 'wb') as f:
			f.write(response.body)


