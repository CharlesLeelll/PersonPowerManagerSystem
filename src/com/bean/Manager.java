package com.bean;

public class Manager {

	private int mid;
	private String mname;
	private String mpwd;
	private String mtel;
	
	public Manager() {
		super();
	}

	public Manager(int mid, String mname, String mpwd, String mtel) {
		super();
		this.mid = mid;
		this.mname = mname;
		this.mpwd = mpwd;
		this.mtel = mtel;
	}
	
	public int getId() {
		return mid;
	}
	
	public void setId(int id) {
		this.mid = id;
	}

	public String getName() {
		return mname;
	}

	public void setName(String name) {
		this.mname = name;
	}

	public String getPassword() {
		return mpwd;
	}

	public void setPassword(String password) {
		this.mpwd = password;
	}

	public String getTel() {
		return mtel;
	}

	public void setTel(String tel) {
		this.mtel = tel;
	}
}
