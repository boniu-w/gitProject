package com.wg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.wg.bean.Chapter;
import com.wg.dao.ChapterDao;

/**
*@author WG
*@date 2019年4月15日 上午11:28:33
*/
@Controller
@RequestMapping(value="/demo1")
public class Demo1 {
	@Autowired
	ChapterDao chapterDao;
	
	@RequestMapping(value="/test1")
	@ResponseBody
	public PageInfo<Chapter> test1(int classId) {
		//根据传入的 classId 查询章节信息
		System.out.println(classId+"----");
		List<Chapter> findByClassId = chapterDao.findByClassId(classId);
		PageInfo<Chapter> pageInfo=new PageInfo<Chapter>();
		pageInfo.setSize(findByClassId.size());  // list 总数
		pageInfo.setList(findByClassId);
		System.out.println(pageInfo.toString()); 
		return pageInfo;
	}
}
