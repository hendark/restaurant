package com.zy.service;

import com.zy.po.User;

public interface UserService {

	public User selectByid(int id)throws Exception;
}