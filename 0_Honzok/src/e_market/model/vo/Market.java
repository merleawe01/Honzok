package e_market.model.vo;

public class Market {
	private int postNo;
	private String itemStatus;
	private int itemPrice;
	private String useDate;
	private String etc;
	private String sellYn;
	private String postTitle;
	
	public Market() {}

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

	
	
	
}
