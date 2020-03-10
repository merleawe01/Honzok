package g_board.model.vo;

import java.sql.Date;

public class Reply {
	private int cno;
	private int post_no;
	private String writer;
	private String content;
	private Date write_date;
	private String delete_yn;
	
	public Reply() {}

	public Reply(int cno, int post_no, String writer, String content, Date write_date, String delete_yn) {
		super();
		this.cno = cno;
		this.post_no = post_no;
		this.writer = writer;
		this.content = content;
		this.write_date = write_date;
		this.delete_yn = delete_yn;
	} 

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
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

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public String getDelete_yn() {
		return delete_yn;
	}

	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
	}

}
