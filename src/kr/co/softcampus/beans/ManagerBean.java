package kr.co.softcampus.beans;

public class ManagerBean {
	private String manager_id;
	private String manager_pw;
	private boolean login_check;
	public boolean isLogin_check() {
		return login_check;
	}
	public ManagerBean(){
		this.login_check = false;
	}
	public void setLogin_check(boolean login_check) {
		this.login_check = login_check;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getManager_pw() {
		return manager_pw;
	}
	public void setManager_pw(String manager_pw) {
		this.manager_pw = manager_pw;
	}
}
