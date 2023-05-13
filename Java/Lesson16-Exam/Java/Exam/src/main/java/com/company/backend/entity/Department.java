package com.company.backend.entity;

public class Department {

	private int id;
	private String name;
	private int memberSize;
	private String fullnameUser;

	public Department(int id, String name, int memberSize) {
		this.id = id;
		this.name = name;
		this.memberSize = memberSize;
	}

	public Department(int id, String name, int memberSize, String fullnameUser) {
		this.id = id;
		this.name = name;
		this.memberSize = memberSize;
		this.fullnameUser = fullnameUser;
	}

	public Department(String name) {
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

	@Override
	public String toString() {
		if (fullnameUser == null) {
			return "Department [id=" + id + ", name=" + name + ", memberSize=" + memberSize + "]";
		} else {
			return "Department [id=" + id + ", name=" + name + ", memberSize=" + memberSize + ", fullnameUser="
					+ fullnameUser + "]";
		}

	}

}
