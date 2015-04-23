package com.singthi.thisys.service;

import java.util.List;

import com.singthi.thisys.model.User;

public interface UserService {

	public List<User> findAll();
	
	public User getById(Integer id);

	public void save(User user);

	public void update(User user);

	public void delete(Integer id);
	
}
