package d_trade.model.vo;

import java.sql.Date;

public class Trade {
	
	private int postNo;
	private int boardNo;
	private String postTitle;
	private String userId;
	private String writer;
	private String content;
	private int viewCount;
	private Date writeDate;
	private Date modifyDate;
	private int recoCount;
	private char deleteYN;
	
	private String dlTime;
	private char dlYN;
	private int minPoint;
	private int maxPoint;
	private int point;
	private String nickname;

	private int rNo;
	
	public Trade() {}
	
	

	public Trade(String nickname) {
		super();
		this.nickname = nickname;
	}



	public Trade(String postTitle, String writer, String content) {
		super();
		this.postTitle = postTitle;
		this.writer = writer;
		this.content = content;
	}

	

	public Trade(String userId, int point, String nickname, String postTitle) {
		super();
		this.userId = userId;
		this.point = point;
		this.nickname = nickname;
		this.postTitle = postTitle;
	}
	
	public Trade(String userId, int point, String nickname) {
		super();
		this.userId = userId;
		this.point = point;
		this.nickname = nickname;
	}


	public Trade(int minPoint, int maxPoint, int point, String nickname) {
		super();
		this.minPoint = minPoint;
		this.maxPoint = maxPoint;
		this.point = point;
		this.nickname = nickname;
	}



	/*
	 * public Trade(int postNo, String postTitle, int point, int maxPoint, Date
	 * dlTime, String writer) { super(); this.postNo = postNo; this.postTitle =
	 * postTitle; this.writer = writer; this.dlTime = dlTime; this.maxPoint =
	 * maxPoint; this.point = point; }
	 */

	
	
	public Trade(int rNo, String postTitle, int maxPoint, int point, String dlTime, String writer) {
		super();
		this.rNo = rNo;
		this.postTitle = postTitle;
		this.writer = writer;
		this.dlTime = dlTime;
		this.maxPoint = maxPoint;
		this.point = point;
	}

	public Trade(int postNo, int rNo, String postTitle, int maxPoint, int point, String dlTime, String writer, char dlYN) {
		super();
		this.postNo = postNo;
		this.rNo = rNo;
		this.postTitle = postTitle;
		this.writer = writer;
		this.dlTime = dlTime;
		this.maxPoint = maxPoint;
		this.point = point;
		this.dlYN = dlYN;
	}
	

	public Trade(int postNo, int boardNo, String postTitle, String content, int viewCount, String nickname,int minPoint, int point, int maxPoint, String dlTime,char dlYN, Date writeDate,
			Date modifyDate, char deleteYN) {
		super();
		this.postNo = postNo;
		this.boardNo = boardNo;
		this.postTitle = postTitle;
		this.content = content;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
		this.modifyDate = modifyDate;
		this.deleteYN = deleteYN;
		this.dlTime = dlTime;
		this.maxPoint = maxPoint;
		this.point = point;
		this.nickname = nickname;
		this.minPoint = minPoint;
		this.dlYN = dlYN;
	}
	
	public Trade(int postNo, int boardNo, String postTitle, String content, int viewCount, String nickname,int minPoint, int point, int maxPoint, String dlTime, Date writeDate,
			Date modifyDate, char deleteYN) {
		super();
		this.postNo = postNo;
		this.boardNo = boardNo;
		this.postTitle = postTitle;
		this.content = content;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
		this.modifyDate = modifyDate;
		this.deleteYN = deleteYN;
		this.dlTime = dlTime;
		this.maxPoint = maxPoint;
		this.point = point;
		this.nickname = nickname;
		this.minPoint = minPoint;
	}


	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getRecoCount() {
		return recoCount;
	}

	public void setRecoCount(int recoCount) {
		this.recoCount = recoCount;
	}

	public char getDeleteYN() {
		return deleteYN;
	}

	public void setDeleteYN(char deleteYN) {
		this.deleteYN = deleteYN;
	}


	
	public String getDlTime() {
		return dlTime;
	}

	public void setDlTime(String dlTime) {
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



	public int getrNo() {
		return rNo;
	}



	public void setrNo(int rNo) {
		this.rNo = rNo;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}




	
	
	
	
	
	
	
}
