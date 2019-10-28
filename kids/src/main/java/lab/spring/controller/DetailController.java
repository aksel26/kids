package lab.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lab.spring.model.KinderInfoVO;
import lab.spring.service.MapService;

@Controller
public class DetailController {

		@Autowired
		MapService service;
		
		@RequestMapping(value="/detail.do", method = RequestMethod.GET)
		public ModelAndView detail(@RequestParam(value= "kindername") String kindername,
									@RequestParam(value= "kinderinfoId") String kinderid,
									@RequestParam(value="subofficeedu") String subofficeedu,
									HttpServletRequest request) {
		
			ModelAndView mav = new ModelAndView();
			KinderInfoVO vo = new KinderInfoVO();
			
			List<KinderInfoVO> ranklist = null;
			ranklist = service.getRank();
			
			vo=service.getBadkinder(kindername, subofficeedu);
			
		
			vo=XO(vo);
		
			
			mav.addObject("rankSet",ranklist);
	
			mav.addObject("kindername", kindername);
			mav.addObject("kinderinfoId", kinderid);
			
			mav.addObject("badkinder", vo);
			
			mav.setViewName("detail");
			
			return mav;
				
		}
		
	public KinderInfoVO XO(KinderInfoVO vo) {
		ArrayList<Integer> total = new ArrayList(); 
		int cnt=0;
		String image1="resources/images/red.png";
		String image2="resources/images/orange.png";
		String image3="resources/images/yellow.png";
		String image4="resources/images/green.png";
		
		
		if(vo.getBad_oper() == null) {
			vo.setBad_oper("X");
		}else {
			vo.setBad_oper("O");
			cnt++;
			total.add(cnt);
		}
		
		if(vo.getBad_program() == null) {
			vo.setBad_program("X");
		}else {
			vo.setBad_program("O");
			cnt++;
			total.add(cnt);
		}
		
		if(vo.getBad_meal() == null) {
			vo.setBad_meal("X");
		}else {
			vo.setBad_meal("O");
			cnt++;
			total.add(cnt);
		}
		
		if(vo.getBad_care() == null) {
			vo.setBad_care("X");
		}else {
			vo.setBad_care("O");
			cnt++;
			total.add(cnt);
		}
		
		if(vo.getBad_emp() == null) {
			vo.setBad_emp("X");
		}else {
			vo.setBad_emp("O");
			cnt++;
			total.add(cnt);
		}
		
		if(vo.getBad_tax() == null) {
			vo.setBad_tax("X");
		}else {
			vo.setBad_tax("O");
			cnt++;
			total.add(cnt);
		}
		
		if(vo.getBad_build() == null) {
			vo.setBad_build("X");
		}else {
			vo.setBad_build("O");
			cnt++;
			total.add(cnt);
		}
		
		if(vo.getBad_money() == null) {
			vo.setBad_money("X");
		}else {
			vo.setBad_money("O");
			cnt++;
			total.add(cnt);
		}
		
		

		if(total.size()>=5) {
			vo.setImage(image1);
		}else if(total.size()>=3) {
			vo.setImage(image2);
		}else if(total.size()>=2) {
			vo.setImage(image3);
		}else {
			vo.setImage(image4);
		}
		
		System.out.println(total.size());
		
		return vo;
	}

	}

