package c_information.model.vo;

import java.sql.Date;

public class Image {
	private int img_id;
	private int post_no;
	private String origin_name;
	private String change_name;
	private String img_src;
	private Date upload_date;
	private int fileLevel;
	private String status;
	
	public Image() {}

	public Image(String origin_name, String change_name, String img_src) {
		super();
		this.origin_name = origin_name;
		this.change_name = change_name;
		this.img_src = img_src;
	}
	
	public Image(String change_name, int fileLevel) {
		super();
		this.change_name = change_name;
		this.fileLevel = fileLevel;
	}

	public Image(int img_id, int post_no, String origin_name, String change_name, String img_src, Date upload_date,
			int fileLevel, String status) {
		super();
		this.img_id = img_id;
		this.post_no = post_no;
		this.origin_name = origin_name;
		this.change_name = change_name;
		this.img_src = img_src;
		this.upload_date = upload_date;
		this.fileLevel = fileLevel;
		this.status = status;
	}

	public int getImg_id() {
		return img_id;
	}

	public void setImg_id(int img_id) {
		this.img_id = img_id;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public String getOrigin_name() {
		return origin_name;
	}

	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}

	public String getChange_name() {
		return change_name;
	}

	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}

	public String getImg_src() {
		return img_src;
	}

	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}

	public Date getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
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
