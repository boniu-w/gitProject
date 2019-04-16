package com.wg.bean;
/**
*@author WG
*@date 2019年4月15日 下午1:43:40
*/
public class Chapter {

//	chapterId  chapterName      chapterHref  classId  
	private int chapterId;
	private String chapterName;
	private String chapterHref;
	private int classId;
	private Classes classes;
	
	public int getChapterId() {
		return chapterId;
	}
	public void setChapterId(int chapterId) {
		this.chapterId = chapterId;
	}
	public String getChapterName() {
		return chapterName;
	}
	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}
	
	public String getChapterHref() {
		return chapterHref;
	}
	public void setChapterHref(String chapterHref) {
		this.chapterHref = chapterHref;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public Classes getClasses() {
		return classes;
	}
	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	@Override
	public String toString() {
		return "Chapter [chapterId=" + chapterId + ", chapterName=" + chapterName + ", chapterHref=" + chapterHref
				+ ", classId=" + classId + ", classes=" + classes + "]";
	}
	
	
}
