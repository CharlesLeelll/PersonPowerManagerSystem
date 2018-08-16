package com.bean;

import java.util.Date;

public class User {

	private int uid;
	private String uname;
	private String uweb;
	private String uad;
	private String ustatus;
	private Date utime;
	
	public User() {
		super();
	}

	public int getUid() {
		return uid;
	}
	
	public User(int uid, String uname, String uweb, String uad, String ustatus, Date utime) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.uweb = uweb;
		this.uad = uad;
		this.ustatus = ustatus;
		this.utime = utime;
	}

	public Date getUtime() {
		return utime;
	}

	public void setUtime(Date utime) {
		this.utime = utime;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUweb() {
		return uweb;
	}
	public void setUweb(String uweb) {
		this.uweb = uweb;
	}
	public String getUad() {
		return uad;
	}
	public void setUad(String uad) {
		this.uad = uad;
	}
	public String getUstatus() {
		return ustatus;
	}
	public void setUstatus(String ustatus) {
		this.ustatus = ustatus;
	}
	
}
