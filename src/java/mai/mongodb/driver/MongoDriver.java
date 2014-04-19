/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package mai.mongodb.driver;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import mai.constantfields.DBParameters;
import mai.constantfields.FieldsOfDB;

/**
 *
 * @author vadim
 */
public class MongoDriver {
    private static MongoDriver mongo;
    public static MongoDriver getInstance(){
        if (mongo == null){
            mongo = new MongoDriver();
        }
        return mongo;
    }
    
    private static DB getDataBase(){
       DB db;
        try {
            MongoClient mongoClient = new MongoClient(DBParameters.IP_ADDRESS, DBParameters.PORT);
            db = mongoClient.getDB(DBParameters.DB_NAME);
            return db;
        } catch (UnknownHostException ex) {
            Logger.getLogger(MongoDriver.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void insert(){
       DBCollection table = getDataBase().getCollection("user");
        BasicDBObject doc = new BasicDBObject();
        doc.put("name", "mkyong");
	doc.put("age", 30);
	doc.put("createdDate", new Date());
	table.insert(doc);
    }
    
    public static  DBCursor getAllBooks(){
        DBCollection booksCollection = getDataBase().getCollection(DBParameters.COLLECTION_NAME);
        BasicDBObject orQuery = new BasicDBObject();
	List<BasicDBObject> orQueryList = new ArrayList<BasicDBObject>();
	orQueryList.add(new BasicDBObject(FieldsOfDB.MY, "true"));
	orQueryList.add(new BasicDBObject(FieldsOfDB.IN_LIB, "true"));
	orQuery.put("$or", orQueryList);
        DBCursor cursor = booksCollection.find(orQuery);
        return cursor;
    }
    
    // книги что дал
    public static DBCursor getBooksThoseThatGave(){
        DBCollection booksCollection = getDataBase().getCollection(DBParameters.COLLECTION_NAME);
        BasicDBObject andQuery = new BasicDBObject();
	List<BasicDBObject> andQueryList = new ArrayList<BasicDBObject>();
	andQueryList.add(new BasicDBObject(FieldsOfDB.MY, "true"));
	andQueryList.add(new BasicDBObject(FieldsOfDB.IN_LIB, "false"));
	andQuery.put("$and", andQueryList);
        DBCursor cursor = booksCollection.find(andQuery);
        return cursor;
    }
    // книги что  есть в библиотеке
    public static DBCursor getBooksInMyLib(){
        DBCollection booksCollection = getDataBase().getCollection(DBParameters.COLLECTION_NAME);
        BasicDBObject query = new BasicDBObject();
	DBCursor cursor = booksCollection.find(new BasicDBObject(FieldsOfDB.IN_LIB, "true"));
        return cursor;
    }
    // книги что взял
    public static DBCursor getBooksThoseThatTook(){
        DBCollection booksCollection = getDataBase().getCollection(DBParameters.COLLECTION_NAME);
        BasicDBObject andQuery = new BasicDBObject();
	List<BasicDBObject> andQueryList = new ArrayList<BasicDBObject>();
	andQueryList.add(new BasicDBObject(FieldsOfDB.MY, "false"));
	andQueryList.add(new BasicDBObject(FieldsOfDB.IN_LIB, "true"));
	andQuery.put("$and", andQueryList);
        DBCursor cursor = booksCollection.find(andQuery);
        return cursor;
    }
    
    public static void updateDocument(BasicDBObject sourceObj,BasicDBObject newObj ){
       DBCollection table =  getDataBase().getCollection(DBParameters.COLLECTION_NAME);
	BasicDBObject updateObj = new BasicDBObject();
	updateObj.put("$set", newObj);
	table.update(sourceObj, updateObj);       
    }
    public static void removeDocument(BasicDBObject rmBook){
       DBCollection table =  getDataBase().getCollection(DBParameters.COLLECTION_NAME);
	table.remove(rmBook);
    }
    public static void insertDocument(BasicDBObject newDoc){
        DBCollection table =  getDataBase().getCollection(DBParameters.COLLECTION_NAME);
	table.insert(newDoc);
    }
    
       public static DBCursor getAllMyBooks(){
        DBCollection booksCollection = getDataBase().getCollection(DBParameters.COLLECTION_NAME);
        DBCursor cursor = booksCollection.find(new BasicDBObject(FieldsOfDB.MY, "true"));
        return cursor;
    }
    
    
}
