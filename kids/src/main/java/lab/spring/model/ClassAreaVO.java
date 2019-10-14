package lab.spring.model;

public class ClassAreaVO {
	private String kinderinfoId;
	private String edate;
	private String odate;
	private String addr;
	private String telno;
	private String hpaddr;
	private String opertime;	
	private String POINT_Y;
	private String POINT_X;
	private String key;
	private String officeedu;
	private String  subofficeedu;
	private String  kindername;
	private String  establish;
	private String clsrarea;//교실면적
	private String phgrindrarea; //체육시설
	private String hlsparea; //보건시설
	private String ktchmssparea; //조리시설
	private String otsparea; //기타시설
	public String getKinderinfoId() {
		return kinderinfoId;
	}
	public void setKinderinfoId(String kinderinfoId) {
		this.kinderinfoId = kinderinfoId;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getOdate() {
		return odate;
	}
	public void setOdate(String odate) {
		this.odate = odate;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTelno() {
		return telno;
	}
	public void setTelno(String telno) {
		this.telno = telno;
	}
	public String getHpaddr() {
		return hpaddr;
	}
	public void setHpaddr(String hpaddr) {
		this.hpaddr = hpaddr;
	}
	public String getOpertime() {
		return opertime;
	}
	public void setOpertime(String opertime) {
		this.opertime = opertime;
	}
	public String getPOINT_Y() {
		return POINT_Y;
	}
	public void setPOINT_Y(String pOINT_Y) {
		POINT_Y = pOINT_Y;
	}
	public String getPOINT_X() {
		return POINT_X;
	}
	public void setPOINT_X(String pOINT_X) {
		POINT_X = pOINT_X;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getOfficeedu() {
		return officeedu;
	}
	public void setOfficeedu(String officeedu) {
		this.officeedu = officeedu;
	}
	public String getSubofficeedu() {
		return subofficeedu;
	}
	public void setSubofficeedu(String subofficeedu) {
		this.subofficeedu = subofficeedu;
	}
	public String getKindername() {
		return kindername;
	}
	public void setKindername(String kindername) {
		this.kindername = kindername;
	}
	public String getEstablish() {
		return establish;
	}
	public void setEstablish(String establish) {
		this.establish = establish;

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
