package d_trade.model.vo;

public class Bid {
	private int postNo;
	private String userId;
	private String phone;
	private String email;
	private int postalCode;
	private String bAddr;
	private String lAddr;
	private int bpoint;
	private String nickName;
	private int point;
	
	
	public Bid() {}

	
	
	
	public Bid(int postNo, String userId, int bpoint, String nickName, int point) {
		super();
		this.postNo = postNo;
		this.userId = userId;
		this.bpoint = bpoint;
		this.nickName = nickName;
		this.point = point;
	}


	public Bid(int postNo, String userId, String phone, String email, int postalCode, String bAddr,
			String lAddr, int bpoint, String nickName) {
		super();
		this.postNo = postNo;
		this.userId = userId;
		this.nickName = nickName;
		this.phone = phone;
		this.email = email;
		this.postalCode = postalCode;
		this.bAddr = bAddr;
		this.lAddr = lAddr;
		this.bpoint = bpoint;
	}

	

	public Bid(int postNo, String userId, String nickName, String phone, String email, int postalCode, String bAddr, String lAddr,
			int bpoint, int point) {
		super();
		this.postNo = postNo;
		this.userId = userId;
		this.phone = phone;
		this.email = email;
		this.postalCode = postalCode;
		this.bAddr = bAddr;
		this.lAddr = lAddr;
		this.bpoint = bpoint;
		this.nickName = nickName;
		this.point = point;
	}


	public int getPostNo() {
		return postNo;
	}


	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
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


	public int getBpoint() {
		return bpoint;
	}


	public void setBpoint(int bpoint) {
		this.bpoint = bpoint;
	}


	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}
	
	
	
}
