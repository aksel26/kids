package lab.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lab.spring.model.BuildingVO;
import lab.spring.model.ClassAreaVO;
import lab.spring.model.EnvironVO;
import lab.spring.model.KinderInfoVO;
import lab.spring.model.SafetyVO;
import lab.spring.model.SanitaryVO;
import lab.spring.model.SchoolBusVO;
import lab.spring.model.TeacherVO;
import lab.spring.service.MapService;

@Controller
@RequestMapping(value = "/search.do", method = RequestMethod.POST)
public class SearchController {

	@Autowired
	MapService service;

	@RequestMapping(value = "/safety.do", method = RequestMethod.POST)
	@ResponseBody // json 데이터 사용할 때, json->문자열로 자동변환 시켜주는 어노테이션
	public List<SafetyVO> safetySort(@RequestBody HashMap<String, String> safetyArr) {

		List<SafetyVO> safL = null;

		safL = service.getSafetyList(safetyArr);
		System.out.println("안전 데이터 수:" + safL.size());

		return safL;

	}

	@RequestMapping(value = "/sanitary.do", method = RequestMethod.POST)
	@ResponseBody
	public List<SanitaryVO> sanitarySort(@RequestBody HashMap<String, String> sanitaryArr) {

		List<SanitaryVO> sanL = null;

		sanL = service.getSanitaryList(sanitaryArr);
		System.out.println(sanitaryArr.keySet());
		System.out.println("위생 데이터 수:" + sanL.size());

		return sanL;
	}

	@RequestMapping(value = "/build.do", method = RequestMethod.POST)
	@ResponseBody
	public List<ClassAreaVO> buildSort(@RequestBody HashMap<String, String> buildArr) {

		List<ClassAreaVO> buildL = null;

		buildL = service.getBuildinfoList(buildArr);
		System.out.println(buildArr.keySet());
		System.out.println("시설 데이터 수:" + buildL.size());

		return buildL;
	}

	@RequestMapping(value = "/environment.do", method = RequestMethod.POST)
	@ResponseBody
	public List<EnvironVO> envSort(@RequestBody HashMap<String, String> envArr) {

		List<EnvironVO> envL = null;

		envL = service.getEnvironList(envArr);
		System.out.println(envArr.keySet());
		System.out.println("환경 데이터 수:" + envL.size());

		return envL;
	}

	@RequestMapping(value="/allSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public List<KinderInfoVO>  findAll(@RequestBody HashMap<String, String> message){	  

		
		List<KinderInfoVO> KinderList = null;
		KinderList = service.findKinderList();
		
		
		
		return KinderList;
	}
	
	@RequestMapping(value="/keywordSearch.do")
	@ResponseBody
	public List<KinderInfoVO> findKeyword(String keyword){	  
		
		//System.out.println(keyword);
		
		List<KinderInfoVO> KinderList = null;
		KinderList = service.findSerachList(keyword);
		
		
		
		return KinderList;
	}
		
}
