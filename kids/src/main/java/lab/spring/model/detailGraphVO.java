package lab.spring.model;

public class detailGraphVO {
	
	String child3;
	String child4;
	String child5;
	String area;
	String teacher;
	String bus;
	public String getChild3() {
		return child3;
	}
	public String getChild4() {
		return child4;
	}
	public String getChild5() {
		return child5;
	}
	public String getArea() {
		return area;
	}
	public String getTeacher() {
		return teacher;
	}
	public String getBus() {
		return bus;
	}
	public void setChild3(String child3) {
		this.child3 = child3;
	}
	public void setChild4(String child4) {
		this.child4 = child4;
	}
	public void setChild5(String child5) {
		this.child5 = child5;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public void setBus(String bus) {
		this.bus = bus;
	}
	@Override
	public String toString() {
		return "detailGraphVO [child3=" + child3 + ", child4=" + child4 + ", child5=" + child5 + ", area=" + area
				+ ", teacher=" + teacher + ", bus=" + bus + "]";
	}
}
