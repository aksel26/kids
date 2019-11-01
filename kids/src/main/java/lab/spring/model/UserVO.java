package lab.spring.model;

public class UserVO {
	private String userid; 
	private String userpwd;
	private String username;
	private String email;
	private String location;
	private String POINT_X;
	private String POINT_Y;
	public UserVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPOINT_X() {
		return POINT_X;
	}
	public String getPOINT_Y() {
		return POINT_Y;
	}
	public void setPOINT_X(String pOINT_X) {
		POINT_X = pOINT_X;
	}
	public void setPOINT_Y(String pOINT_Y) {
		POINT_Y = pOINT_Y;
	}
	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + ", email=" + email
				+ ", location=" + location + ", POINT_X=" + POINT_X + ", POINT_Y=" + POINT_Y + "]";
	}
}
