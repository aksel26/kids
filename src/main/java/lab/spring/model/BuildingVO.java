package lab.spring.model;

public class BuildingVO {
	private String BUILDINGID; //�ü� id
	private String key;
	private String archyy;//����⵵
	private String floorcnt;//�ǹ�����
	private String bldgprusarea; //�ǹ��������
	private String grottar; //�����Ѹ���
	
	public BuildingVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getBUILDINGID() {
		return BUILDINGID;
	}

	public void setBUILDINGID(String bUILDINGID) {
		BUILDINGID = bUILDINGID;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getArchyy() {
		return archyy;
	}

	public void setArchyy(String archyy) {
		this.archyy = archyy;
	}

	public String getFloorcnt() {
		return floorcnt;
	}

	public void setFloorcnt(String floorcnt) {
		this.floorcnt = floorcnt;
	}

	public String getBldgprusarea() {
		return bldgprusarea;
	}

	public void setBldgprusarea(String bldgprusarea) {
		this.bldgprusarea = bldgprusarea;
	}

	public String getGrottar() {
		return grottar;
	}

	public void setGrottar(String grottar) {
		this.grottar = grottar;
	}

	@Override
	public String toString() {
		return "BuildingVO [BUILDINGID=" + BUILDINGID + ", key=" + key + ", archyy=" + archyy + ", floorcnt=" + floorcnt
				+ ", bldgprusarea=" + bldgprusarea + ", grottar=" + grottar + "]";
	}
	
	
	
	
}
