import scrapy
from scrapy.linkextractors import LinkExtractor
from tutorial.items import TutorialItem

class DmozSpider(scrapy.Spider):
    name = "dmoz"
    allowed_domains = ["indianexpress.com"]
    start_urls = [
        "http://www.indianexpress.com/"
    ]

    def parse(self, response):
#        filename = response.url.split("/")[-2] + '.html'
#        with open(filename, 'wb') as f:
#            f.write(response.body)
		l=LinkExtractor()
		links=l.extract_links(response)
		for alink in links:
			item =TutorialItem()
			item['link']=alink.url
#			item['text']=alink.text
#			item['nofollow']=alink.nofollow
#			item['fragment']=alink.fragment
			yield item
			
#		filename = response.url.split("/")[-2] + '.txt'
#		with open(filename, 'wb') as f:
#			for link in links:
#				f.write(str(link)+"\n")
		
