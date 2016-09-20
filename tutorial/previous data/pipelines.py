# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/en/latest/topics/item-pipeline.html


#class TutorialPipeline(object):
#    def process_item(self, item, spider):
#        return item
        
        
from scrapy.exceptions import DropItem
class DuplicatesPipeline(object):

	def __init__(self):
		self.links_seen = set()

	def process_item(self, item, dmoz3):
		if item['link'] in self.links_seen:
			raise DropItem("Duplicate item found: %s" % item)
		else:
			self.links_seen.add(item['link'])
			
			return item
			
import pymongo
class MongoPipeline(object):
	collection_name = 'toi'
	def __init__(self):
	client = MongoClient()
	db = client.trypro1
	def process_item(self, item, dmoz3):
		self.db[self.collection_name].insert(dict(item))
		return item

##############################################################################
# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/en/latest/topics/item-pipeline.html


#class TutorialPipeline(object):
#    def process_item(self, item, spider):
#        return item
        
import pymongo
from pymongo import MongoClient        
from scrapy.exceptions import DropItem
class DuplicatesPipeline(object):
	collection_name = 'toi'
	client = MongoClient('mongodb://localhost:27017/')
	db = client.trypro1

	def process_item(self, item, dmoz3):
		if self.db[self.collection_name].find(dict(item)).count():
			raise DropItem("Duplicate item found: %s" % item)
		else:
			self.db[self.collection_name].insert(dict(item))
			return item
