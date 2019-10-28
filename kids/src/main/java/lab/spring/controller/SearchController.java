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
		

		return safL;

	}

	@RequestMapping(value = "/sanitary.do", method = RequestMethod.POST)
	@ResponseBody
	public List<SanitaryVO> sanitarySort(@RequestBody HashMap<String, String> sanitaryArr) {

		List<SanitaryVO> sanL = null;

		sanL = service.getSanitaryList(sanitaryArr);
		

		return sanL;
	}

	@RequestMapping(value = "/build.do", method = RequestMethod.POST)
	@ResponseBody
	public List<ClassAreaVO> buildSort(@RequestBody HashMap<String, String> buildArr) {

		List<ClassAreaVO> buildL = null;

		buildL = service.getBuildinfoList(buildArr);

		return buildL;
	}

	@RequestMapping(value = "/environment.do", method = RequestMethod.POST)
	@ResponseBody
	public List<EnvironVO> envSort(@RequestBody HashMap<String, String> envArr) {

		List<EnvironVO> envL = null;

		envL = service.getEnvironList(envArr);
		return envL;
	}

	@RequestMapping(value="/allSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public List<KinderInfoVO>  findAll(@RequestBody HashMap<String, String> message){	  

		
		List<KinderInfoVO> KinderList = null;
		KinderList = service.findKinderList();
		
		
		
		return KinderList;
	}
	
	@RequestMapping(value="/keywordSearch.do",method = RequestMethod.POST)
	@ResponseBody
	public List<KinderInfoVO> findKeyword(@RequestBody HashMap<String, String> keyword){	  
		
		List<KinderInfoVO> KinderList = null;
		
		String gu = keyword.get("keyword");
		
		if(gu.equals("광진구")) {gu = "KJ";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("광진구")) {gu = "KJ";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("서초구")) {gu = "SC";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("동작구")) {gu = "DJ";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("양천구")) {gu = "YC";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("용산구")) {gu = "YS";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("서대문구")) {gu = "SM";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("관악구")) {gu = "KW";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("강북구")) {gu = "KB";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("성북구")) {gu = "SB";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("중랑구")) {gu = "JR";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("강남구")) {gu = "KN";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("영등포구")) {gu = "YD";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("종로구")) {gu = "CR";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("강서구")) {gu = "KS";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("강동구")) {gu = "KD";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("성동구")) {gu = "SD";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("도봉구")) {gu = "DB";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("구로구")) {gu = "KR";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("노원구")) {gu = "NW";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("마포구")) {gu = "MP";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("송파구")) {gu = "SP";KinderList = service.findSerachList(gu,2);}
		else if(gu.equals("동대문구")) {gu = "DM";KinderList = service.findSerachList(gu,2);}
		else {
			KinderList = service.findSerachList(keyword.get("keyword"),1);	
		}	
		return KinderList;		
	}
		
}
