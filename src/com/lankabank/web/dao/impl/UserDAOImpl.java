package com.lankabank.web.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.lankabank.web.dao.UserDAO;
import com.lankabank.web.model.User;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private MongoTemplate userTemplate;
	
	public boolean addUser(User user) {
		if (!userTemplate.collectionExists(User.class)) {
			userTemplate.createCollection(User.class);
		}
		Query query = new Query();
		query.addCriteria(Criteria.where("userName").regex(user.getUserName()));
		List<User> temp = userTemplate.find(query, User.class);
		if(temp.size()==0) {
			userTemplate.insert(user);
			return true;
		} else {
			return false;
		}
		
	}
	
	public boolean updateUser(User theUser, String user) {
		String userName = user; 
		Query query = new Query();
		query.addCriteria(Criteria.where("userName").regex(userName));
		List<User> users = userTemplate.find(query, User.class); 
		if(users.size() == 1) {
			Update update = new Update().set("fullName", theUser.getFullName()).set("email", theUser.getEmail()).set("password", theUser.getPassword()).set("nic", theUser.getNic()).set("address", theUser.getAddress());
			userTemplate.updateFirst(query, update, User.class);
			return true;
		}
		return false;
	}
	
	public boolean validateUser(String userName, String password) {
		Query query = new Query();
		query.addCriteria(Criteria.where("userName").regex(userName));
		List<User> user = userTemplate.find(query, User.class); //Assume only a unique UserName can be there
		if (user.size() == 1) {
			String pswd = user.get(0).getPassword();
			if (pswd.equals(password)) {
				return true;
			}
		}
		return false;
	}
	
	public List<User> getUserByName(String userName) {
		Query query = new Query();
		query.addCriteria(Criteria.where("userName").regex(userName));
		List<User> user = userTemplate.find(query, User.class); //Assume only a unique UserName can be there
		return user;
	}

}
