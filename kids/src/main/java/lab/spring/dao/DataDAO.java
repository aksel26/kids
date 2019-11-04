package lab.spring.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lab.spring.model.BuildingVO;

import lab.spring.model.ClassAreaVO;
import lab.spring.model.CommentVO;
import lab.spring.model.EnvironVO;
import lab.spring.model.KinderInfoVO;
import lab.spring.model.MealVO;
import lab.spring.model.SafetyVO;
import lab.spring.model.SanitaryVO;
import lab.spring.model.ScoreVO;
import lab.spring.model.CommentVO;
import lab.spring.model.KinderInfoVO;
import lab.spring.model.MealVO;
import lab.spring.model.SafetyVO;
import lab.spring.model.TeacherVO;
import lab.spring.model.UserVO;
import lab.spring.model.detailGraphVO;

@Repository
public class DataDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public int addComment(CommentVO comment) {
		return sqlSession.insert("lab.mybatis.user.UserMapper.addComment",comment);		
	}
	
	public List<CommentVO> findCommentList(String kdid){
		return sqlSession.selectList("lab.mybatis.user.UserMapper.getCommentList",kdid);
	}
	
	public UserVO login(String uid, String upwd) {
		
		Object vo = null;
		HashMap<String, String> hm = new HashMap<String, String>(); 
		hm.put("uid", uid);
		hm.put("upwd", upwd);
		vo=sqlSession.selectOne("lab.mybatis.user.UserMapper.login", hm);
		
		return (UserVO)vo;
	}
	
	public List<KinderInfoVO> findKinderList(){
		return sqlSession.selectList("lab.mybatis.user.UserMapper.getKinderList");
	}
	
	
	public List<KinderInfoVO> findSearchList(String keyword,int flag){
		
		if(flag==3) {//1 : 일반 검색
			return sqlSession.selectList("lab.mybatis.user.UserMapper.getEstablish",keyword+"%");	
		}
		else if(flag == 2){//2 : 구별 검색
			return sqlSession.selectList("lab.mybatis.user.UserMapper.getSearcGuhList",keyword+"%");
		}
		else {
			return sqlSession.selectList("lab.mybatis.user.UserMapper.getSearchList","%"+keyword+"%");
		}
		
		
	}
	
	
	
	
	public List<SafetyVO> findSafety(List<String> safety_arr){
		return sqlSession.selectList("lab.mybatis.user.UserMapper.findSafety");
	}
	
	public List<SafetyVO> getSafetyList(HashMap<String, String> safety_arr){
		List<SafetyVO> safetyList = null;

		safetyList = sqlSession.selectList("lab.mybatis.user.UserMapper.getSafetyList", safety_arr);
		return safetyList;
	}
	
	public List<SanitaryVO> getSanitaryList(HashMap<String, String> sanitary_arr){
		List<SanitaryVO> sanitaryList = null;
		sanitaryList = sqlSession.selectList("lab.mybatis.user.UserMapper.getSanitaryList", sanitary_arr);
		return sanitaryList;
	}
	
	public List<ClassAreaVO> getBuildinfoList(HashMap<String, String> build_arr){
		List<ClassAreaVO> buildList = null;
		buildList = sqlSession.selectList("lab.mybatis.user.UserMapper.getBuildinfoList", build_arr);
		return buildList;

	}
	
	public List<EnvironVO> getEnvironList(HashMap<String, String> env_arr){
		List<EnvironVO> envList = null;
		envList = sqlSession.selectList("lab.mybatis.user.UserMapper.getEnvironList", env_arr);
		return envList;

	}
	
	public List<KinderInfoVO> getRank(String flag){
		HashMap<String, String> hm = new HashMap<>();
		if(flag.equals("0")) {
			hm.put("flag", null);
		}else if(flag.equals("영등포구")) {
		flag="YD%";
		hm.put("flag", flag);
		}
		else if(flag.equals("종로구")) {
			flag="CR%";
			hm.put("flag", flag);
		}else if(flag.equals("중구")) {
			flag="JG%";
			hm.put("flag", flag);
		}else if(flag.equals("용산구")) {
			flag="YS%";
			hm.put("flag", flag);
		}else if(flag.equals("성동구")) {
			flag="SD%";
			hm.put("flag", flag);
		}else if(flag.equals("광진구")) {
			flag="KJ%";
			hm.put("flag", flag);
		}else if(flag.equals("동대문구")) {
			flag="DM%";
			hm.put("flag", flag);
		}else if(flag.equals("중랑구")) {
			flag="JR%";
			hm.put("flag", flag);
		}else if(flag.equals("성북구")) {
			flag="SB%";
			hm.put("flag", flag);
		}else if(flag.equals("강북구")) {
			flag="KB%";
			hm.put("flag", flag);
		}else if(flag.equals("도봉구")) {
			flag="DB%";
			hm.put("flag", flag);
		}else if(flag.equals("노원구")) {
			flag="NW%";
			hm.put("flag", flag);
		}else if(flag.equals("은평구")) {
			flag="YP%";
			hm.put("flag", flag);
		}else if(flag.equals("서대문구")) {
			flag="SM%";
			hm.put("flag", flag);
		}else if(flag.equals("마포구")) {
			flag="MP%";
			hm.put("flag", flag);
		}else if(flag.equals("양천구")) {
			flag="YC%";
			hm.put("flag", flag);
		}else if(flag.equals("강서구")) {
			flag="KS%";
			hm.put("flag", flag);
		}else if(flag.equals("구로구")) {
			flag="KR%";
			hm.put("flag", flag);
		}else if(flag.equals("금천구")) {
			flag="KC%";
			hm.put("flag", flag);
		}else if(flag.equals("동작구")) {
			flag="DJ%";
			hm.put("flag", flag);
		}else if(flag.equals("관악구")) {
			flag="KW%";
			hm.put("flag", flag);
		}else if(flag.equals("서초구")) {
			flag="SC%";
			hm.put("flag", flag);
		}else if(flag.equals("강남구")) {
			flag="KN%";
			hm.put("flag", flag);
		}else if(flag.equals("송파구")) {
			flag="SP%";
			hm.put("flag", flag);
		}else if(flag.equals("강동구")) {
			flag="KD%";
			hm.put("flag", flag);
		}
	
		return sqlSession.selectList("lab.mybatis.user.UserMapper.getRank", hm);
		
	}
	
	public KinderInfoVO getBadkinder(String kindername, String subofficeedu){
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("kindername", kindername);
		hm.put("subofficeedu", subofficeedu);
		
		return sqlSession.selectOne("lab.mybatis.user.UserMapper.getBadkinder", hm);
	}
	
	public ScoreVO getScore(String kdid) {
		return sqlSession.selectOne("lab.mybatis.user.UserMapper.getScore",kdid);
	}
	
	public detailGraphVO getDetailGraph(String kdid) {
		return sqlSession.selectOne("lab.mybatis.user.UserMapper.getDetailGraph",kdid);
	}
}
