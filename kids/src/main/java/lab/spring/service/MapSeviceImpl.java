package lab.spring.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lab.spring.dao.DataDAO;
import lab.spring.model.ClassAreaVO;
import lab.spring.model.CommentVO;
import lab.spring.model.EnvironVO;
import lab.spring.model.KinderInfoVO;
import lab.spring.model.SafetyVO;
import lab.spring.model.SanitaryVO;
import lab.spring.model.UserVO;



@Service("MapService")
public class MapSeviceImpl implements MapService{
	


	@Autowired
	private DataDAO dao;
	
	public int addComment(CommentVO comment) {
		return dao.addComment(comment);
	}

	public List<CommentVO> findCommentList(String kdid) {
		return dao.findCommentList(kdid);
	}

	public List<KinderInfoVO> findKinderList() {
		return dao.findKinderList();
	}
	
	public List<KinderInfoVO> findSerachList(String keyword,int flag) {
		return dao.findSearchList(keyword,flag);
	}
	
	public UserVO login(String uid, String upwd) {
		// TODO Auto-generated method stub
		return dao.login(uid, upwd);
	}


	public List<SafetyVO> findSafety(List<String> safety_arr) {
		// TODO Auto-generated method stub
		return dao.findSafety(safety_arr);
	}


	public List<SafetyVO> getSafetyList(HashMap<String, String> safety_arr) {
		// TODO Auto-generated method stub
		return dao.getSafetyList(safety_arr);
	}

	public List<SanitaryVO> getSanitaryList(HashMap<String, String> sanitary_arr) {
		// TODO Auto-generated method stub
		return dao.getSanitaryList(sanitary_arr);
	}

	public List<ClassAreaVO> getBuildinfoList(HashMap<String, String> build_arr) {
		// TODO Auto-generated method stub
		return dao.getBuildinfoList(build_arr);
	}

	public List<EnvironVO> getEnvironList(HashMap<String, String> env_arr) {
		// TODO Auto-generated method stub
		return dao.getEnvironList(env_arr);
	}
	
	public List<KinderInfoVO> getRank(){
		return dao.getRank();
	}
}
