package jspexp.z01_vo;
// jspexp.z01_vo.Product
// sno kind name price cnt
public class Product {
	
	private int sno;
	private String kind;
	private String name;
	private int price;
	private int cnt;

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public Product(int sno, String kind, String name, int price, int cnt) {
		super();
		this.sno = sno;
		this.kind = kind;
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}

	public Product(String kind, String name, int price, int cnt) {
		super();
		this.kind = kind;
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	
	public int getSno() {
		return sno;
	}


	public void setSno(int sno) {
		this.sno = sno;
	}


	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
	
	
	
}
