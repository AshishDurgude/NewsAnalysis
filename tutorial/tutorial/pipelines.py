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

	def process_item(self, item, spider):
		if self.db[self.collection_name].find(dict(item)).count():
			raise DropItem("Duplicate item found: %s" % item)
		else:
			self.db[self.collection_name].insert(dict(item))
			return item

