from scrapy.spider     import BaseSpider
from scrapy.selector   import HtmlXPathSelector
from tutorial.items         import TutorialItem
from scrapy.http       import Request
import re
import datetime 

class MySpider(BaseSpider):
	name             = "dmoz3"
	allowed_domains    = ["timesofindia.indiatimes.com"]
	start_urls        = ["http://www.timesofindia.indiatimes.com/"]
	
	def parse(self, response):
		hxs             = HtmlXPathSelector(response)
		links            = hxs.select("//a/@href").extract()
		crawledLinks     = []
		linkPattern     = re.compile("^(?:ftp|http|https):\/\/(?:[\w\.\-\+]+:{0,1}[\w\.\-\+]*@)?(?:[a-z0-9\-\.]+)(?::[0-9]+)?(?:\/|\/(?:[\w#!:\.\?\+=&amp;%@!\-\/\(\)]+)|\?(?:[\w#!:\.\?\+=&amp;%@!\-\/\(\)]+))?$") #ftp/http/https+://+
        
		for link in links:
			if linkPattern.match(link) and not link in crawledLinks :
				crawledLinks.append(link)
				yield Request(link, self.parse)
				item = TutorialItem()
				item['link'] = link
				#item['date'] = datetime.datetime.now()
				yield item
                
            
#        titles    = hxs.select('//h1[@class="post_title"]/a/text()').extract()
#        for title in titles:
#            item             = TutorialItem()
#            item["title"]     = title
#            yield item
