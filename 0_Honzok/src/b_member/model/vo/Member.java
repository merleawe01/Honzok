package b_member.model.vo;

import java.sql.Date;

public class Member {
	private String userId;
	private String userPwd;
	private String userName;
	private String nickName;
	private int postalCode;
	private String bAddr;
	private String lAddr;
	private String phone;
	private String email;
	private Date enrollDate;
	private String status;
	private int point;
	private Date leaveDate;
	private String keyCode;
	
	// 기본 생성자
	public Member() {}

	// 매개변수 생성자
	public Member(String userId, String userPwd) {
		this.userId = userId;
		this.userPwd = userPwd;
	}

	public Member(String userName, String bAddr, String phone, String email) {
		super();
		this.userName = userName;
		this.bAddr = bAddr;
		this.phone = phone;
		this.email = email;
	}
	public Member(String userId, String userName, String nickName, int postalCode, String bAddr, String lAddr,
			String phone, String email, int point) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.nickName = nickName;
		this.postalCode = postalCode;
		this.bAddr = bAddr;
		this.lAddr = lAddr;
		this.phone = phone;
		this.email = email;
		this.point = point;
	}

	public Member(String userId, String userPwd, String userName, String nickName, int postalCode, String bAddr,
			String lAddr, String phone, String email, int point) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickName = nickName;
		this.postalCode = postalCode;
		this.bAddr = bAddr;
		this.lAddr = lAddr;
		this.phone = phone;
		this.email = email;
		this.point = point;

	}



	public Member(String userId, String userPwd, String userName, String nickName, int postalCode, String bAddr,
			String lAddr, String phone, String email, Date enrollDate, String status, int point) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickName = nickName;
		this.postalCode = postalCode;
		this.bAddr = bAddr;
		this.lAddr = lAddr;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.status = status;
		this.point = point;
	}

	public Member(String userId, String userPwd, String userName, String nickName, int postalCode, String bAddr,
			String lAddr, String phone, String email, Date enrollDate, String status, int point, Date leaveDate,
			String keyCode) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickName = nickName;
		this.postalCode = postalCode;
		this.bAddr = bAddr;
		this.lAddr = lAddr;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.status = status;
		this.point = point;
		this.leaveDate = leaveDate;
		this.keyCode = keyCode;
	}

	public Member(String userId, String userName, String nickName, int postalCode, String bAddr, String lAddr,
			String phone, String email) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.nickName = nickName;
		this.postalCode = postalCode;
		this.bAddr = bAddr;
		this.lAddr = lAddr;
		this.phone = phone;
		this.email = email;
	}

	

	public Member(String userId, String userPwd, String userName, String nickName, int postalCode, String bAddr,
			String lAddr, String phone, String email) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickName = nickName;
		this.postalCode = postalCode;
		this.bAddr = bAddr;
		this.lAddr = lAddr;
		this.phone = phone;
		this.email = email;
	}


	public Member(String userId, String userPwd, String userName, String nickName, String email) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickName = nickName;
		this.email = email;
	}


	// getter/setter 메소드
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(int postalCode) {
		this.postalCode = postalCode;
	}

	public String getbAddr() {
		return bAddr;
	}

	public void setbAddr(String bAddr) {
		this.bAddr = bAddr;
	}

	public String getlAddr() {
		return lAddr;
	}

	public void setlAddr(String lAddr) {
		this.lAddr = lAddr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public Date getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
	
}
