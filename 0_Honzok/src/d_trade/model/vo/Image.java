package d_trade.model.vo;

import java.sql.Date;

public class Image {
	private int imgId;
	private int postNo;
	private String originName;
	private String changeName;
	private String imgSrc;
	private Date uploadDate;
	private int fileLevel;
	private String status;
	
	public Image() {}

	
	
	public Image(int postNo, String changeName) {
		super();
		this.postNo = postNo;
		this.changeName = changeName;
	}



	public Image(int imgId, int postNo, String originName, String changeName, String imgSrc, Date uploadDate,
			int fileLevel, String status) {
		super();
		this.imgId = imgId;
		this.postNo = postNo;
		this.originName = originName;
		this.changeName = changeName;
		this.imgSrc = imgSrc;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.status = status;
	}

	public int getImgId() {
		return imgId;
	}

	public void setImgId(int imgId) {
		this.imgId = imgId;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getImgSrc() {
		return imgSrc;
	}

	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
