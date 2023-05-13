package com.company.backend.entity;

public class Project {
	
	private int id;
	private String name;
	private int memberSize;
	private String fullname;

	public Project(int id, String name, int memberSize, String fullname) {
		this.id = id;
		this.name = name;
		this.memberSize = memberSize;
		this.fullname = fullname;
	}

	public Project(int id, String name, int memberSize) {
		this.id = id;
		this.name = name;
		this.memberSize = memberSize;
	}

	public Project(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public int getMemberSize() {
		return memberSize;
	}

	public String getFullname() {
		return fullname;
	}

	@Override
	public String toString() {
		return "Project [id=" + id + ", name=" + name + ", memberSize=" + memberSize + ", fullname=" + fullname + "]";
	}
	
	
	
}
