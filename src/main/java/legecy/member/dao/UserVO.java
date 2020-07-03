package legecy.member.dao;

public class UserVO {
	
	private String id;
	private String pw;
	private String email;
	private String phonenumber;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	
	@Override
	public String toString() {
		return "UserVO2 [id=" + id + ", pw=" + pw + ", email=" + email + ", phonenumber=" + phonenumber + "]";
	}
	
	
}
