package g_board.model.vo;

import java.sql.Date;

public class Board {
	
	private int postNo;
	private int boardNo;
	private String postTitle;
	private String writer;
	private String content;
	private int viewCount;
//	private Date writeDate;
	private Date modifyDate;
	private int recoCount;
	private char deleteYN;
	private String writeDate;
	
	
	public Board() {}








	public Board(int postNo, String postTitle, int viewCount, String writeDate) {
		super();
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
	}


	public Board(int postNo, String postTitle, String content, int viewCount, Date modifyDate) {
		super();
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.content = content;
		this.viewCount = viewCount;
		this.modifyDate = modifyDate;
	}



	public Board(int postNo, int boardNo, String postTitle, String content, int viewCount, String writeDate,
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
	}








	public Board(int postNo, int boardNo, String postTitle, String writer, String content, int viewCount,
			String writeDate, Date modifyDate, int recoCount, char deleteYN) {
		super();
		this.postNo = postNo;
		this.boardNo = boardNo;
		this.postTitle = postTitle;
		this.writer = writer;
		this.content = content;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
		this.modifyDate = modifyDate;
		this.recoCount = recoCount;
		this.deleteYN = deleteYN;
	}



	public Board(int postNo, String postTitle, String content, String writeDate) {
		super();
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.content = content;
		this.writeDate = writeDate;
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



	public String getWriteDate() {
		return writeDate;
	}



	public void setWriteDate(String writeDate) {
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
	
	



	
	
	
	
	
	
	
}
