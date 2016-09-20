package esdl1;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;

public class n {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			MongoClient mongo = new MongoClient("localhost", 27017);
			DB db = mongo.getDB("trypro1");
			
			DBCollection table = db.getCollection("toi");
		BasicDBObject searchQuery2 
		= new BasicDBObject("link",new BasicDBObject("$regex","sport"));
		int cnt=table.find(searchQuery2).count();
			System.out.println("Done");
		} catch (MongoException e) {
			e.printStackTrace();
		}

	}

}
