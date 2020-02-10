package c_information.model.vo;

import java.sql.Date;

public class FoodBoard {
	private int no;
	private String title;
	private String writer;
	private String content;
	private int view_count;
	private Date write_date;
	private int reco_count;
	private String category;
	private String local_name;
	private String address;
	private int star;
	private String rc_food;
	private double area_x;
	private double area_y;
	// 아직 이미지 안건드렸음....
	// 댓글도 어떻게 할지
	
	
	public FoodBoard() {}
	
	// 글 작성에서 사용할 생성자
	public FoodBoard(String title, String writer, String content, String category, String local_name, String address, int star,
			String rc_food, double area_x, double area_y) {
		super();
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.category = category;
		this.local_name = local_name;
		this.address = address;
		this.star = star;
		this.rc_food = rc_food;
		this.area_x = area_x;
		this.area_y = area_y;
	}
	
	

	// 리스트 뷰에서 사용할 생성자.
	public FoodBoard(int no, String title, String writer, int view_count, Date write_date, int reco_count, int star,
			double area_x, double area_y) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.view_count = view_count;
		this.write_date = write_date;
		this.reco_count = reco_count;
		this.star = star;
		this.area_x = area_x;
		this.area_y = area_y;
	}
	
	// 상세보기 뷰에서 사용할 생성자.
	
	
	
}
