package carseller.service;

import carseller.db.repository.DBRepository;

public class DBService {

	private DBRepository db;
	
	public DBService(){
		db = new DBRepository();
	}
	
	public void export(){
		db.exportDb();
	}
}
