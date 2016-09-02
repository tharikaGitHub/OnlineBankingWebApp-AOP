package com.lankabank.web.dao;

import java.util.List;

import com.lankabank.web.model.User;

public interface UserDAO {
	public boolean addUser(User user);
	public boolean updateUser(User theUser, String user);
	public boolean validateUser(String userName, String password); //For Login
	public List<User> getUserByName(String userName);
}
