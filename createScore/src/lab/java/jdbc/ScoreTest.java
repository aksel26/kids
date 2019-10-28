package lab.java.jdbc;


	import java.io.FileInputStream;
	import java.sql.*;
	import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import lab.java.model.ClassAreaVO;
import lab.java.model.KinderInfoVO;
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
		
		
		
	private ArrayList<KinderInfoVO> selectKinderinfo() {
		ArrayList<KinderInfoVO> kinderArr = new ArrayList<KinderInfoVO>();
		con = dbCon();
		String sql = null;
		Statement stat = null;
	
		
		sql = "select kindername, total from kinderinfo";

		try {
			stat=con.createStatement();
			rs = stat.executeQuery(sql);


            while(rs.next()){ 
            	  KinderInfoVO vo = new KinderInfoVO();
                   String kindername = rs.getString(1);
                   int total=rs.getInt(2);
                   
                   vo.setKindername(kindername);
                   vo.setTotal(total);
                   
                   kinderArr.add(vo);
              
            }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose(con, stat, rs);
		}
			return kinderArr;
	}
	
	public ArrayList<SafetyVO> selectSafetyinfo() {
			ArrayList<SafetyVO> sfArr = new ArrayList<SafetyVO>();
			con = dbCon();
			String sql = null;
			Statement stat = null;
		
			
			sql = "select kindername, nvl(fire_safe_dt,0), nvl(gas_ck_dt,0), nvl(elect_ck_dt,0), nvl(plyg_ck_dt,0), score1"
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
	                   int score1=rs.getInt(6);
	                   
	                   sf.setKindername(kindername);
	                   sf.setFire_safe_dt(fire_safe_dt);
	                   sf.setGas_ck_dt(gas_ck_dt);
	                   sf.setElect_ck_dt(elect_ck_dt);
	                   sf.setPlyg_ck_dt(plyg_ck_dt);
	                   sf.setScore1(score1);
	                   
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
	
		
		sql = "select kindername, nvl(arql_chk_dt,0), nvl(fxtm_dsnf_chk_dt,0), nvl(mdst_chk_dt,0), nvl(ilmn_chk_dt,0), score2"
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
                   double score2=rs.getDouble(6);
                   
                   sn.setKindername(kindername);
                   sn.setArql_chk_dt(arql_chk_dt);
                   sn.setFxtm_dsnf_chk_dt(fxtm_dsnf_chk_dt);
                   sn.setMdst_chk_dt(mdst_chk_dt);
                   sn.setIlmn_chk_dt(ilmn_chk_dt);
                   sn.setScore2(score2);
                   
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
				+ "nvl(SUBSTR(ktchmssparea , 0, length(ktchmssparea)-1) ,0), score3 from classarea";

		try {
			stat=con.createStatement();
			rs = stat.executeQuery(sql);


            while(rs.next()){ 
            	ClassAreaVO build = new ClassAreaVO();
                   String kindername = rs.getString(1);
                   String phgrindrarea = rs.getString(2);
                   String  hlsparea = rs.getString(3);
                   String ktchmssparea = rs.getString(4);
                   double score3=rs.getDouble(5);
            
                   
                   build.setKindername(kindername);
                   build.setPhgrindrarea(phgrindrarea);
                   build.setHlsparea(hlsparea);
                   build.setKtchmssparea(ktchmssparea);
                   build.setScore3(score3);
                   
                   buildArr.add(build);
              
            }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose(con, stat, rs);
		}
			return buildArr;
	}

	public int insertSafety() throws SQLException, InterruptedException {
		ArrayList<SafetyVO> sfArr = selectSafetyinfo();
		ArrayList<Integer> sfsum = new ArrayList<Integer>();
		//ArrayList<KinderinfoVO> kinderArr = selectKinderinfo();
		int sfscore;
		

		for(int i =0;i<sfArr.size();i++) {	
			sfscore=0;
			
			if(sfArr.get(i).getFire_safe_dt().contains("2019")){
				sfscore+=30;
				
			}else if(sfArr.get(i).getFire_safe_dt().contains("2018") || sfArr.get(i).getFire_safe_dt().contains("2017")) {
				sfscore+=20;
			}else if(sfArr.get(i).getFire_safe_dt().contains("2016") || sfArr.get(i).getFire_safe_dt().contains("2015")) {
				sfscore+=10;
			}else {
				sfscore+=5;
			}
			
			if(sfArr.get(i).getGas_ck_dt().contains("2019")){
				sfscore+=30;
			}else if(sfArr.get(i).getGas_ck_dt().contains("2018") || sfArr.get(i).getGas_ck_dt().contains("2017")) {
				sfscore+=20;
			}else if(sfArr.get(i).getGas_ck_dt().contains("2016") || sfArr.get(i).getGas_ck_dt().contains("2015")) {
				sfscore+=10;
			}else {
				sfscore+=5;
			}
			
			if(sfArr.get(i).getElect_ck_dt().contains("2019")){
				sfscore+=30;
			}else if(sfArr.get(i).getElect_ck_dt().contains("2018") || sfArr.get(i).getElect_ck_dt().contains("2017")) {
				sfscore+=20;
			}else if(sfArr.get(i).getElect_ck_dt().contains("2016") || sfArr.get(i).getElect_ck_dt().contains("2015")) {
				sfscore+=10;
			}else {
				sfscore+=5;
			}
			
			if(sfArr.get(i).getPlyg_ck_dt().contains("2019")){
				sfscore += 30;
			}else if(sfArr.get(i).getPlyg_ck_dt().contains("2018") || sfArr.get(i).getPlyg_ck_dt().contains("2017")) {
				sfscore += 20;
			}else if(sfArr.get(i).getPlyg_ck_dt().contains("2016") || sfArr.get(i).getPlyg_ck_dt().contains("2015")) {
				sfscore += 10;
			}else {
				sfscore += 5;
			}
			
			sfsum.add(sfscore);
			
		
			String sql = "update safety set score1="+sfsum.get(i)+" where kindername='"+sfArr.get(i).getKindername()+"'";
		
			try {
				con=dbCon();
				stat = con.createStatement(); 
				stat.executeUpdate(sql);	
				System.out.println(sfsum.size());

	         
			} catch (Exception e) {
			e.getMessage();
			}  try {
		        if (con != null && !con.isClosed())
	            {
	            con.close();
	            Thread.sleep(1000);
	             }
	        }
	    catch (SQLException e) {
	        e.printStackTrace();
	    }

		}
	
		return 0;
	}
	
	public int insertSanitary()  throws SQLException, InterruptedException {
		ArrayList<SanitaryVO> snArr = selectSanitaryinfo();
		ArrayList<Integer> snsum = new ArrayList<Integer>();
		//ArrayList<KinderinfoVO> kinderArr = selectKinderinfo();
		int snscore;
		
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
			
			snsum.add(snscore);
			
			String sql = "update sanitary set score2="+snsum.get(i)+" where kindername='"+snArr.get(i).getKindername()+"'";
			
			try {
				con=dbCon();
				stat = con.createStatement(); 
				stat.executeUpdate(sql);	
				System.out.println(snsum.size());

	         
			} catch (Exception e) {
			e.getMessage();
			}  try {
		        if (con != null && !con.isClosed())
	            {
	            con.close();
	            Thread.sleep(1000);
	             }
	        }
	    catch (SQLException e) {
	        e.printStackTrace();
	    }

		}
	
		return 0;
	}
	
	public int insertBuild()  throws SQLException, InterruptedException {
		ArrayList<ClassAreaVO> buildArr = selectBuildinfo();
		ArrayList<Integer> buildsum = new ArrayList<Integer>();
		//ArrayList<KinderinfoVO> kinderArr = selectKinderinfo();
		int bscore;
		
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
			
			buildsum.add(bscore);
			String sql = "update classarea set score3="+buildsum.get(i)+" where kindername='"+buildArr.get(i).getKindername()+"'";
			
			try {
				con=dbCon();
				stat = con.createStatement(); 
				stat.executeUpdate(sql);	
				System.out.println(buildsum.size());

	         
			} catch (Exception e) {
			e.getMessage();
			}  try {
		        if (con != null && !con.isClosed())
	            {
	            con.close();	
	            Thread.sleep(1000);
	             }
	        }
	    catch (SQLException e) {
	        e.printStackTrace();
	    }

		}
	
		return 0;
	}
	
	
	public int updateTotal() throws InterruptedException {
		ArrayList<SafetyVO> sfArr = selectSafetyinfo();
		ArrayList<SanitaryVO> snArr = selectSanitaryinfo();
		ArrayList<ClassAreaVO> buildArr = selectBuildinfo();
		
		HashMap<String,Double> total = new HashMap<String,Double>();
		double sum = 0;
		
		for(int i = 0;i<sfArr.size();i++) {
			for(int j = 0;j<snArr.size();j++) {
				if((sfArr.get(i).getKindername().equals(snArr.get(j).getKindername()))) {
					for(int k=0;k<buildArr.size();k++) {
						if((buildArr.get(k).getKindername().equals(snArr.get(j).getKindername()))) {
							sum = sfArr.get(i).getScore1()+snArr.get(j).getScore2()+buildArr.get(k).getScore3();
							
							total.put(buildArr.get(k).getKindername(), sum);
							break;
						}
					}								
				}
			}
		}
		
		for ( String name : total.keySet()) {
			String sql = "update kinderinfo set total= "+total.get(name)+"where kindername ='"+name+"'";
			
			try {
				con=dbCon();
				stat = con.createStatement(); 
				stat.executeUpdate(sql);	
				System.out.println(total.size());
				
			} catch (Exception e) {
				e.getMessage();
			}  try {
		        if (con != null && !con.isClosed())
	            {
	            con.close();	
	            Thread.sleep(1000);
	             }
	        }
	    catch (SQLException e) {
	        e.printStackTrace();
	    }

		}
		
		return 0;
	}
	


	public static void main(String[] args) throws SQLException, InterruptedException {
		
				ScoreTest st = new ScoreTest();
				//st.insertSafety();
				//st.insertSanitary();
				//st.insertBuild();
				st.updateTotal();
				//ArrayList<KinderinfoVO> kinderArr = st.insertKinderscore();

	}
			
			}

