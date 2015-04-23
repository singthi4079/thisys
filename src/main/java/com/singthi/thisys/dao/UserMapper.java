package com.singthi.thisys.dao;

import java.util.List;

import com.singthi.thisys.common.persistence.annotation.MyBatisDao;
import com.singthi.thisys.model.User;

@MyBatisDao
public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	List<User> findAll();
}