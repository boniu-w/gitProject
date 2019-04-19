package com.soft863.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.soft863.bean.Chapter;

/**
*@author WG
*@date 2019年4月15日 下午1:48:51
*/
@Repository
public interface ChapterMapper {
	//根据classId查询 
	List<Chapter> findByClassId(@Param("classId")int classId);
}
