
package c_information.model.vo;

import java.sql.Date;

public class TravelBoard {
	private int no;
	private String title;
	private String writer;
	private String content;
	private int view_count;
	private Date write_date;
	private int reco_count;
	private String local_name;
	private String address;
	private int star;
	private String caution;
	private String best_time;
	private double area_x;
	private double area_y;
	private String img_src;
	
	public TravelBoard() {}
	
	// 글 작성에서 사용할 생성자
	public TravelBoard(String title, String writer, String content, String best_time, String caution, String local_name, String address, int star,
			double area_x, double area_y) {
		super();
		this.title = title;
		this.writer = writer; 
		this.content = content;
		this.best_time = best_time;
		this.caution = caution;
		this.local_name = local_name;
		this.address = address;
		this.star = star;
		this.area_x = area_x;
		this.area_y = area_y;
	}
	
	// 리스트 뷰에서 사용할 생성자.
	public TravelBoard(int no, String title, String writer, int reco_count, String address, int star,
			double area_x, double area_y, String img_src) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.reco_count = reco_count;
		this.address = address;
		this.star = star;
		this.area_x = area_x;
		this.area_y = area_y;
		this.img_src = img_src;
	}
	
	// 디테일 뷰에서 사용할 생성자.
	public TravelBoard(int no, String title, String writer, String content, int view_count, int reco_count, String local_name,
			String address, int star, String caution, String best_time, double area_x, double area_y) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.view_count = view_count;
		this.reco_count = reco_count;
		this.local_name = local_name;
		this.address = address;
		this.star = star;
		this.caution = caution;
		this.best_time = best_time;
		this.area_x = area_x;
		this.area_y = area_y;
	}
	
	// 글 수정에서 사용할 생성자
	public TravelBoard(int no, String title, String content, String local_name, String address, int star,
			String caution, String best_time, double area_x, double area_y) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.local_name = local_name;
		this.address = address;
		this.star = star;
		this.caution = caution;
		this.best_time = best_time;
		this.area_x = area_x;
		this.area_y = area_y;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public int getReco_count() {
		return reco_count;
	}

	public void setReco_count(int reco_count) {
		this.reco_count = reco_count;
	}

	public String getLocal_name() {
		return local_name;
	}

	public void setLocal_name(String local_name) {
		this.local_name = local_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getCaution() {
		return caution;
	}

	public void setCaution(String caution) {
		this.caution = caution;
	}

	public String getBest_time() {
		return best_time;
	}

	public void setBest_time(String best_time) {
		this.best_time = best_time;
	}

	public double getArea_x() {
		return area_x;
	}

	public void setArea_x(double area_x) {
		this.area_x = area_x;
	}

	public double getArea_y() {
		return area_y;
	}

	public void setArea_y(double area_y) {
		this.area_y = area_y;
	}

	public String getImg_src() {
		return img_src;
	}

	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
}
