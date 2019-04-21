package com.thxopen.dt.bean;

/**
 * Created by Administrator on 2015/4/13.
 */
public class User {

    public String name;
    public String position;
    public String salary;
    public String start_date;
    public String office;
    public String extn;
    public Integer status;
    public Integer role;

    public User(String name, String position, String salary, String start_date, String office, String extn, Integer status, Integer role) {
        this.name = name;
        this.position = position;
        this.salary = salary;
        this.start_date = start_date;
        this.office = office;
        this.extn = extn;
        this.status = status;
        this.role = role;
    }

    public String getName() {

        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getOffice() {
        return office;
    }

    public void setOffice(String office) {
        this.office = office;
    }

    public String getExtn() {
        return extn;
    }

    public void setExtn(String extn) {
        this.extn = extn;
    }

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}
}
