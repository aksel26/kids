package lab.spring.controller;

import java.io.IOException;
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
public class TotalController {
	
	@Autowired 
	MapService service;
	
	@RequestMapping(value="/rank.do", method=RequestMethod.GET)
	public ModelAndView rank(HttpServletRequest request) throws IOException{
		
		ModelAndView mav = new ModelAndView();
		List<KinderInfoVO> ranklist = null;
		
		
		return mav;
		
	}

}
