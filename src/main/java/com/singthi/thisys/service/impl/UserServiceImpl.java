package com.singthi.thisys.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.singthi.thisys.dao.UserMapper;
import com.singthi.thisys.model.User;
import com.singthi.thisys.service.UserService;

@Service("userService")
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserMapper userMapper;

	public List<User> findAll() {
		
		return userMapper.findAll();
	}

}
