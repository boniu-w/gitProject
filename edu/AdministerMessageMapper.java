package com.soft863.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.soft863.bean.User;


/**
*@author WG
*@date 2019年4月18日 上午11:16:55
*/
@Repository
public interface AdministerMessageMapper {

	List<User> findAllAddminiter();

	int deleteOneUserById(int userId);
	
	/**
	 * 添加一条数据并 返回自动生成的主键
	 * @param user
	 * @return
	 */
	int addUser(User user);
	
	/**
	 * 给userId 赋权限 1002
	 * @param userId
	 * @return
	 */
	int addToUserType(int userId);
}
