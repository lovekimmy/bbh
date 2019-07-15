package com.example.ssh_system.mapper;

import com.example.ssh_system.entity.User;
import com.example.ssh_system.util.QueryCondition;

import java.util.List;

public interface UserMapper {

    List <User> findByCondition(QueryCondition condition);

    User selectByPrimaryKey(Integer id);

    List<User> findStudentById(Integer id,Integer payId);

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}