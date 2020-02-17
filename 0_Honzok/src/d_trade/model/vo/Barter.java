package d_trade.model.vo;

import java.sql.Date;

public class Barter {
	
	private int postNo;
	private Date dlTime;
	private char dlYN;
	private int minPoint;
	private int maxPoint;
	private int point;
	private String nickname;
	
	public Barter() {}

	
	
	
	
	
	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public Date getDlTime() {
		return dlTime;
	}

	public void setDlTime(Date dlTime) {
		this.dlTime = dlTime;
	}

	public char getDlYN() {
		return dlYN;
	}

	public void setDlYN(char dlYN) {
		this.dlYN = dlYN;
	}

	public int getMinPoint() {
		return minPoint;
	}

	public void setMinPoint(int minPoint) {
		this.minPoint = minPoint;
	}

	public int getMaxPoint() {
		return maxPoint;
	}

	public void setMaxPoint(int maxPoint) {
		this.maxPoint = maxPoint;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
	
	
	
}
