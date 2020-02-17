package f_message.model.vo;

import java.sql.Date;

public class Message {

	private int mNo;
	private String to;
	private String from;
	private String mTitle;
	private String content;
	private Date date;
	private int view;
	
	public Message() {}
	
	public Message(int mNo, String to, String from, String mTitle, String content, Date date, int view) {
		this.mNo = mNo;
		this.to = to;
		this.from = from;
		this.mTitle = mTitle;
		this.content = content;
		this.date = date;
		this.view = view;
	}
	// getter/setter 메소드
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getmTitle() {
		return mTitle;
	}
	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}

	@Override
	public String toString() {
		return "Message [mNo=" + mNo + ", to=" + to + ", from=" + from + ", mTitle=" + mTitle + ", content=" + content
				+ ", date=" + date + ", view=" + view + "]";
	}
	
	
	
}
