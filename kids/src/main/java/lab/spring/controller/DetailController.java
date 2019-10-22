package lab.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lab.spring.model.KinderInfoVO;
import lab.spring.service.MapService;

@Controller
public class DetailController {

		@Autowired
		MapService service;
		
		@RequestMapping(value="/detail.do", method = RequestMethod.GET)
		public ModelAndView detail(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			List<KinderInfoVO> ranklist = null;
			ranklist = service.getRank();
			
			mav.addObject("rankSet",ranklist);
			
			mav.setViewName("detail");
			
			return mav;
				
		}
}
