package lab.spring.model;

public class ClassAreaVO {
	private String classId; //�ü� id
	private String key;
	private String crcnt;//���Ǽ�
	private String clsrarea;//ü����
	private String phgrindrarea; //�ǹ��������
	private String hlsparea; //����,��������
	private String ktchmssparea; //������,�޽İ���
	private String otsparea; //��Ÿ����
	
	
	
	public ClassAreaVO() {
		super();
	}
	
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getCrcnt() {
		return crcnt;
	}
	public void setCrcnt(String crcnt) {
		this.crcnt = crcnt;
	}
	public String getClsrarea() {
		return clsrarea;
	}
	public void setClsrarea(String clsrarea) {
		this.clsrarea = clsrarea;
	}
	public String getPhgrindrarea() {
		return phgrindrarea;
	}
	public void setPhgrindrarea(String phgrindrarea) {
		this.phgrindrarea = phgrindrarea;
	}
	public String getHlsparea() {
		return hlsparea;
	}
	public void setHlsparea(String hlsparea) {
		this.hlsparea = hlsparea;
	}
	public String getKtchmssparea() {
		return ktchmssparea;
	}
	public void setKtchmssparea(String ktchmssparea) {
		this.ktchmssparea = ktchmssparea;
	}
	public String getOtsparea() {
		return otsparea;
	}
	public void setOtsparea(String otsparea) {
		this.otsparea = otsparea;
	}
	@Override
	public String toString() {
		return "ClassAreaVO [classId=" + classId + ", key=" + key + ", crcnt=" + crcnt + ", clsrarea=" + clsrarea
				+ ", phgrindrarea=" + phgrindrarea + ", hlsparea=" + hlsparea + ", ktchmssparea=" + ktchmssparea
				+ ", otsparea=" + otsparea + "]";
	}
 

	
	
}
