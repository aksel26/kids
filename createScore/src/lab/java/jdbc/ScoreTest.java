package lab.java.jdbc;


	import java.io.FileInputStream;
	import java.sql.*;
	import java.util.ArrayList;
import java.util.Iterator;
import java.util.Properties;

import lab.java.model.ClassAreaVO;
import lab.java.model.SafetyVO;
import lab.java.model.SanitaryVO;

	public class ScoreTest {
		
		Connection con = null;
		Properties prop = new Properties();
		Statement stat = null;
		PreparedStatement pstat = null;
		ResultSet rs;

		public Connection dbCon() {

			try {
				prop.load(new FileInputStream("/Users/minji/kids/createScore/dbinfo.properties"));
				Class.forName(prop.getProperty("driver"));
				System.out.println("driver load");
				con = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("user"),
						prop.getProperty("pwd"));
				System.out.println("db connect success");
			} catch (Exception e) {
				System.out.println(e.getMessage());
				//e.printStackTrace();
			}
			return con;
		}

		public void dbClose(Connection con, Statement stat, ResultSet rs) {
			try {
				if (rs != null)
					rs.close();
				if (stat != null)
					stat.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	public ArrayList<SafetyVO> selectSafetyinfo() {
			ArrayList<SafetyVO> sfArr = new ArrayList<SafetyVO>();
			con = dbCon();
			String sql = null;
			Statement stat = null;
		
			
			sql = "select kindername, nvl(fire_safe_dt,0), nvl(gas_ck_dt,0), nvl(elect_ck_dt,0), nvl(plyg_ck_dt,0)"
					+ " from safety";

			try {
				stat=con.createStatement();
				rs = stat.executeQuery(sql);


	            while(rs.next()){ 
	            	SafetyVO sf = new SafetyVO();
	                   String kindername = rs.getString(1);
	                   String fire_safe_dt = rs.getString(2);
	                   String  gas_ck_dt = rs.getString(3);
	                   String elect_ck_dt = rs.getString(4);
	                   String plyg_ck_dt = rs.getString(5);
	                   
	                   sf.setKindername(kindername);
	                   sf.setFire_safe_dt(fire_safe_dt);
	                   sf.setGas_ck_dt(gas_ck_dt);
	                   sf.setElect_ck_dt(elect_ck_dt);
	                   sf.setPlyg_ck_dt(plyg_ck_dt);
	                   
	                   sfArr.add(sf);
	              
	            }
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbClose(con, stat, rs);
			}
				return sfArr;
		}

	public ArrayList<SanitaryVO> selectSanitaryinfo() {
		ArrayList<SanitaryVO> snArr = new ArrayList<SanitaryVO>();
		con = dbCon();
		String sql = null;
		Statement stat = null;
	
		
		sql = "select kindername, nvl(arql_chk_dt,0), nvl(fxtm_dsnf_chk_dt,0), nvl(mdst_chk_dt,0), nvl(ilmn_chk_dt,0)"
				+ " from sanitary";

		try {
			stat=con.createStatement();
			rs = stat.executeQuery(sql);


            while(rs.next()){ 
            		SanitaryVO sn = new SanitaryVO();
                   String kindername = rs.getString(1);
                   String arql_chk_dt = rs.getString(2);
                   String  fxtm_dsnf_chk_dt = rs.getString(3);
                   String mdst_chk_dt = rs.getString(4);
                   String ilmn_chk_dt = rs.getString(5);
                   
                   sn.setKindername(kindername);
                   sn.setArql_chk_dt(arql_chk_dt);
                   sn.setFxtm_dsnf_chk_dt(fxtm_dsnf_chk_dt);
                   sn.setMdst_chk_dt(mdst_chk_dt);
                   sn.setIlmn_chk_dt(ilmn_chk_dt);
                   
                   snArr.add(sn);
              
            }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose(con, stat, rs);
		}
			return snArr;
	}
	
	public ArrayList<ClassAreaVO> selectBuildinfo() {
		ArrayList<ClassAreaVO> buildArr = new ArrayList<ClassAreaVO>();
		con = dbCon();
		String sql = null;
		Statement stat = null;
	
		
		sql = "select kindername, nvl(SUBSTR(phgrindrarea , 0, length(phgrindrarea)-1) ,0), nvl(SUBSTR(hlsparea , 0, length(hlsparea)-1) ,0),"
				+ "nvl(SUBSTR(ktchmssparea , 0, length(ktchmssparea)-1) ,0) from classarea";

		try {
			stat=con.createStatement();
			rs = stat.executeQuery(sql);


            while(rs.next()){ 
            	ClassAreaVO build = new ClassAreaVO();
                   String kindername = rs.getString(1);
                   String phgrindrarea = rs.getString(2);
                   String  hlsparea = rs.getString(3);
                   String ktchmssparea = rs.getString(4);
            
                   
                   build.setKindername(kindername);
                   build.setPhgrindrarea(phgrindrarea);
                   build.setHlsparea(hlsparea);
                   build.setKtchmssparea(ktchmssparea);
                   
                   buildArr.add(build);
              
            }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose(con, stat, rs);
		}
			return buildArr;
	}
	
	public ArrayList<Integer> safetyScore() {
		ArrayList<SafetyVO> sfArr = selectSafetyinfo();
		ArrayList<Integer> sfscore = new ArrayList<Integer>();
		Iterator<Integer> itr = sfscore.iterator();
		for(int i =0;i<sfArr.size();i++) {	
			if(sfArr.get(i).getFire_safe_dt().contains("2019")){
				sfscore.add(30);
			}else if(sfArr.get(i).getFire_safe_dt().contains("2018") || sfArr.get(i).getFire_safe_dt().contains("2017")) {
				sfscore.add(20);
			}else if(sfArr.get(i).getFire_safe_dt().contains("2016") || sfArr.get(i).getFire_safe_dt().contains("2015")) {
				sfscore.add(10);
			}else {
				sfscore.add(5);
			}
			
			if(sfArr.get(i).getGas_ck_dt().contains("2019")){
				sfscore.add(30);
			}else if(sfArr.get(i).getGas_ck_dt().contains("2018") || sfArr.get(i).getGas_ck_dt().contains("2017")) {
				sfscore.add(20);
			}else if(sfArr.get(i).getGas_ck_dt().contains("2016") || sfArr.get(i).getGas_ck_dt().contains("2015")) {
				sfscore.add(10);
			}else {
				sfscore.add(5);
			}
			
			if(sfArr.get(i).getElect_ck_dt().contains("2019")){
				sfscore.add(30);
			}else if(sfArr.get(i).getElect_ck_dt().contains("2018") || sfArr.get(i).getElect_ck_dt().contains("2017")) {
				sfscore.add(20);
			}else if(sfArr.get(i).getElect_ck_dt().contains("2016") || sfArr.get(i).getElect_ck_dt().contains("2015")) {
				sfscore.add(10);
			}else {
				sfscore.add(5);
			}
			
//			if(sfArr.get(i).getPlyg_ck_dt().contains("2019")){
//				sfscore += 30;
//			}else if(sfArr.get(i).getPlyg_ck_dt().contains("2018") || sfArr.get(i).getPlyg_ck_dt().contains("2017")) {
//				sfscore += 20;
//			}else if(sfArr.get(i).getPlyg_ck_dt().contains("2016") || sfArr.get(i).getPlyg_ck_dt().contains("2015")) {
//				sfscore += 10;
//			}else {
//				sfscore += 5;
//			}
//			System.out.println("유치원 아이디: "+sfArr.get(i).getKindername());
//			System.out.println("소방 안전 날짜: "+sfArr.get(i).getFire_safe_dt());
//			System.out.println("가스 점검 날짜: "+sfArr.get(i).getGas_ck_dt());
//			System.out.println("전기 점검 날짜 : "+sfArr.get(i).getElect_ck_dt());
//			System.out.println("놀이시설 점검 날짜 : "+sfArr.get(i).getPlyg_ck_dt());
//			System.out.println("총점 : "+sfscore);
//			System.out.println("-----------------------------------");
			
		}
			while(itr.hasNext()) {
				sfscore.get(itr.next());
			}
			return sfscore;
	}
	
public static void main(String[] args) {
				
				int snscore=0;
				int bscore=0;
				ScoreTest st = new ScoreTest();
				
				ArrayList<SanitaryVO> snArr = st.selectSanitaryinfo();
				ArrayList<ClassAreaVO> buildArr = st.selectBuildinfo();
				//ArrayList<KinderinfoVO> kinderArr = st.insertKinderscore();
				
				
	System.out.println(st.safetyScore());
			
			for(int i =0;i<snArr.size();i++) {	
				snscore=0;
				if(snArr.get(i).getArql_chk_dt().contains("2019")){
					snscore += 30;
				}else if(snArr.get(i).getArql_chk_dt().contains("2018") || snArr.get(i).getArql_chk_dt().contains("2017")) {
					snscore += 20;
				}else if(snArr.get(i).getArql_chk_dt().contains("2016") || snArr.get(i).getArql_chk_dt().contains("2015")) {
					snscore += 10;
				}else {
					snscore += 5;
				}
				
				if(snArr.get(i).getFxtm_dsnf_chk_dt().contains("2019")){
					snscore += 30;
				}else if(snArr.get(i).getFxtm_dsnf_chk_dt().contains("2018") || snArr.get(i).getFxtm_dsnf_chk_dt().contains("2017")) {
					snscore += 20;
				}else if(snArr.get(i).getFxtm_dsnf_chk_dt().contains("2016") || snArr.get(i).getFxtm_dsnf_chk_dt().contains("2015")) {
					snscore += 10;
				}else {
					snscore += 5;
				}
				
				if(snArr.get(i).getMdst_chk_dt().contains("2019")){
					snscore += 30;
				}else if(snArr.get(i).getMdst_chk_dt().contains("2018") || snArr.get(i).getMdst_chk_dt().contains("2017")) {
					snscore += 20;
				}else if(snArr.get(i).getMdst_chk_dt().contains("2016") || snArr.get(i).getMdst_chk_dt().contains("2015")) {
					snscore += 10;
				}else {
					snscore += 5;
				}
				
				if(snArr.get(i).getIlmn_chk_dt().contains("2019")){
					snscore += 30;
				}else if(snArr.get(i).getIlmn_chk_dt().contains("2018") || snArr.get(i).getIlmn_chk_dt().contains("2017")) {
					snscore += 20;
				}else if(snArr.get(i).getIlmn_chk_dt().contains("2016") || snArr.get(i).getIlmn_chk_dt().contains("2015")) {
					snscore += 10;
				}else {
					snscore += 5;
				}
				
//				System.out.println("유치원 아이디: "+snArr.get(i).getKindername());
//				System.out.println("실내공기질 점검일자: "+snArr.get(i).getArql_chk_dt());
//				System.out.println("정기소독 점검일자: "+snArr.get(i).getFxtm_dsnf_chk_dt());
//				System.out.println("미세먼지 검사일자 : "+snArr.get(i).getMdst_chk_dt());
//				System.out.println("조도관리 검사일자 : "+snArr.get(i).getIlmn_chk_dt());
//				System.out.println("총점 : "+snscore);
//				System.out.println("-----------------------------------");
			}
			

			//System.out.println(buildArr.get(1).getPhgrindrarea());
			for(int i =0;i<buildArr.size();i++) {	
				bscore=0;
				if(!buildArr.get(i).getPhgrindrarea().equals("0")){
					bscore += 40;
				
				}else {
					bscore += 5;
				}
				
				if(!buildArr.get(i).getHlsparea().equals("0")){
					bscore += 40;
				}else {
					bscore += 5;
				}
				
				if(!buildArr.get(i).getKtchmssparea().equals("0")){
					bscore += 40;
				}else {
					bscore += 5;
				}
				
				
//				System.out.println("유치원 아이디: "+buildArr.get(i).getKindername());
//				System.out.println("체육장 보유여부: "+buildArr.get(i).getPhgrindrarea());
//				System.out.println("보건/위생시설 보유여부: "+buildArr.get(i).getHlsparea());
//				System.out.println("조리실/급식공간 보유여부 : "+buildArr.get(i).getKtchmssparea());
//				System.out.println("총점 : "+bscore);
//				System.out.println("-----------------------------------");
			}
			

			
	}
			
			}

