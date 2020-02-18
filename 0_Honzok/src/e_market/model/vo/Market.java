package e_market.model.vo;

import java.sql.Date;

public class Market {
	private int postNo;
	private String itemStatus;
	private int itemPrice;
	private String useDate;
	private String etc;
	private String sellYn;
	private String postTitle;
	private int boardNo;
	private String writer;
	private String content;
	private int viewCount;
	private Date writeDate;
	private Date modifyDate;
	private int recoCount;
	
	public Market() {}
	
	public Market(int postNo, String postTitle, int boardNo, String writer, String content, int viewCount,
			Date writeDate, Date modifyDate, int recoCount) {
		super();
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.boardNo = boardNo;
		this.writer = writer;
		this.content = content;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
		this.modifyDate = modifyDate;
		this.recoCount = recoCount;
	}

	
	
	public Market(int postNo,  String postTitle, Date writeDate, String writer, int viewCount, 
			String content, String itemStatus, int itemPrice, String useDate, String etc) 
	{
		super();
		this.postNo = postNo;
		this.itemStatus = itemStatus;
		this.itemPrice = itemPrice;
		this.useDate = useDate;
		this.etc = etc;
		this.postTitle = postTitle;
		this.writer = writer;
		this.content = content;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
	}

	public Market(int postNo, String itemStatus, int itemPrice, String useDate, String etc, String sellYn,
			String postTitle, int boardNo, String writer, String content, int viewCount, Date writeDate,
			Date modifyDate, int recoCount) {
		super();
		this.postNo = postNo;
		this.itemStatus = itemStatus;
		this.itemPrice = itemPrice;
		this.useDate = useDate;
		this.etc = etc;
		this.sellYn = sellYn;
		this.postTitle = postTitle;
		this.boardNo = boardNo;
		this.writer = writer;
		this.content = content;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
		this.modifyDate = modifyDate;
		this.recoCount = recoCount;
	}


	public Market(String postTitle, String content, String itemStatus, int itemPrice, String useDate, String etc, String writer
			) {
		super();
		
		this.itemStatus = itemStatus;
		this.itemPrice = itemPrice;
		this.useDate = useDate;
		this.etc = etc;
		this.postTitle = postTitle;
		this.writer = writer;
		this.content = content;
	}

	public Market(int postNo, String itemStatus, int itemPrice, String useDate, String etc, String sellYn,
			String postTitle) {
		super();
		this.postNo = postNo;
		this.itemStatus = itemStatus;
		this.itemPrice = itemPrice;
		this.useDate = useDate;
		this.etc = etc;
		this.sellYn = sellYn;
		this.postTitle = postTitle;
	}
	
	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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

	

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getItemStatus() {
		return itemStatus;
	}

	public void setItemStatus(String itemStatus) {
		this.itemStatus = itemStatus;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getUseDate() {
		return useDate;
	}

	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getSellYn() {
		return sellYn;
	}

	public void setSellYn(String sellYn) {
		this.sellYn = sellYn;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	@Override
	public String toString() {
		return "Market [postNo=" + postNo + ", itemStatus=" + itemStatus + ", itemPrice=" + itemPrice + ", useDate="
				+ useDate + ", etc=" + etc + ", sellYn=" + sellYn + ", postTitle=" + postTitle + ", boardNo=" + boardNo
				+ ", writer=" + writer + ", content=" + content + ", viewCount=" + viewCount + ", writeDate="
				+ writeDate + ", modifyDate=" + modifyDate + ", recoCount=" + recoCount + "]";
	}

	
	
	
}
