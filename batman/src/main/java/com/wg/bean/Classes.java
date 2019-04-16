package com.wg.bean;
/**
*@author WG
*@date 2019年4月15日 下午1:42:04
*/
public class Classes {

//	classId  className  classHref 
	private int classId;
	private String className;
	private String classHref;
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getClassHref() {
		return classHref;
	}
	public void setClassHref(String classHref) {
		this.classHref = classHref;
	}
	@Override
	public String toString() {
		return "Classes [classId=" + classId + ", className=" + className + ", classHref=" + classHref + "]";
	}
	
}
