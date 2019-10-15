package lab.java.model;

public class SafetyVO {
	private String kinderinfoId;
	private String officeedu;
	private String subofficeedu;
	private String kindername;
	private String establish;
	private String edate;
	private String odate;
	private String addr;
	private String telno;
	private String hpaddr;
	private String opertime;
	private String POINT_Y;
	private String POINT_X;
	private String safetyid;
   private String fire_avd_yn; //�ҹ�����Ʒÿ���
   private String fire_avd_dt; //�ҹ�����Ʒ�����
   private String gas_ck_yn; //�������˿���
   private String gas_ck_dt; //������������
   private String fire_safe_yn; //�ҹ�������˿���
   private String fire_safe_dt; //�ҹ������������
   private String elect_ck_yn; //���⼳�����˿���
   private String elect_ck_dt; //���⼳����������
   private String plyg_ck_yn; //���̽ü� �����˻� ��󿩺�     
   private String plyg_ck_dt; //���̽ü� �����˻� ��������
   private String plyg_ck_rs_cd; //���̽ü� �����˻� ���˰��
   private String cctv_ist_yn; //CCTV ��ġ����
   private String cctv_ist_total; // CCTV �� ��ġ��
   private String cctv_ist_in; //CCTV �ǹ� �� ��ġ��
   private String cctv_ist_out;
   
   
   public String getSafetyid() {
	return safetyid;
}
public void setSafetyid(String safetyid) {
	this.safetyid = safetyid;
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
public String getKinderinfoId() {
	return kinderinfoId;
}
public void setKinderinfoId(String kinderinfoId) {
	this.kinderinfoId = kinderinfoId;
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
public String getFire_avd_yn() {
      return fire_avd_yn;
   }
   public void setFire_avd_yn(String fire_avd_yn) {
      this.fire_avd_yn = fire_avd_yn;
   }
   public String getFire_avd_dt() {
      return fire_avd_dt;
   }
   public void setFire_avd_dt(String fire_avd_dt) {
      this.fire_avd_dt = fire_avd_dt;
   }
   public String getGas_ck_yn() {
      return gas_ck_yn;
   }
   public void setGas_ck_yn(String gas_ck_yn) {
      this.gas_ck_yn = gas_ck_yn;
   }
   public String getGas_ck_dt() {
      return gas_ck_dt;
   }
   public void setGas_ck_dt(String gas_ck_dt) {
      this.gas_ck_dt = gas_ck_dt;
   }
   public String getFire_safe_yn() {
      return fire_safe_yn;
   }
   public void setFire_safe_yn(String fire_safe_yn) {
      this.fire_safe_yn = fire_safe_yn;
   }
   public String getFire_safe_dt() {
      return fire_safe_dt;
   }
   public void setFire_safe_dt(String fire_safe_dt) {
      this.fire_safe_dt = fire_safe_dt;
   }
   public String getElect_ck_yn() {
      return elect_ck_yn;
   }
   public void setElect_ck_yn(String elect_ck_yn) {
      this.elect_ck_yn = elect_ck_yn;
   }
   public String getElect_ck_dt() {
      return elect_ck_dt;
   }
   public void setElect_ck_dt(String elect_ck_dt) {
      this.elect_ck_dt = elect_ck_dt;
   }
   public String getPlyg_ck_yn() {
      return plyg_ck_yn;
   }
   public void setPlyg_ck_yn(String plyg_ck_yn) {
      this.plyg_ck_yn = plyg_ck_yn;
   }
   public String getPlyg_ck_dt() {
      return plyg_ck_dt;
   }
   public void setPlyg_ck_dt(String plyg_ck_dt) {
      this.plyg_ck_dt = plyg_ck_dt;
   }
   public String getPlyg_ck_rs_cd() {
      return plyg_ck_rs_cd;
   }
   public void setPlyg_ck_rs_cd(String plyg_ck_rs_cd) {
      this.plyg_ck_rs_cd = plyg_ck_rs_cd;
   }
   public String getCctv_ist_yn() {
      return cctv_ist_yn;
   }
   public void setCctv_ist_yn(String cctv_ist_yn) {
      this.cctv_ist_yn = cctv_ist_yn;
   }
   public String getCctv_ist_total() {
      return cctv_ist_total;
   }
   public void setCctv_ist_total(String cctv_ist_total) {
      this.cctv_ist_total = cctv_ist_total;
   }
   public String getCctv_ist_in() {
      return cctv_ist_in;
   }
   public void setCctv_ist_in(String cctv_ist_in) {
      this.cctv_ist_in = cctv_ist_in;
   }
   public String getCctv_ist_out() {
      return cctv_ist_out;
   }
   public void setCctv_ist_out(String cctv_ist_out) {
      this.cctv_ist_out = cctv_ist_out;
   } //CCTV �ǹ� �� ��ġ��
   
   
   
}