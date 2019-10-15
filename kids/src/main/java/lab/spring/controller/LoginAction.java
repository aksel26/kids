package lab.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lab.spring.model.CommentVO;
import lab.spring.model.KinderInfoVO;
import lab.spring.model.UserVO;
import lab.spring.service.MapService;


@Controller
public class LoginAction {
	
	@Autowired
	MapService service;
	
	/*
	@RequestMapping(value = "/login.do",method=RequestMethod.GET)
	public String form() {
		System.out.println("�α��� GET���");
		return "page-login";
	}
	*/
	
	@RequestMapping(value = "/login.do",method=RequestMethod.POST)
	public ModelAndView login(@RequestParam(value ="userid",required=false)String uid,
								@RequestParam(value = "userpwd", required=false)String upwd,
								HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserVO vo = null;
		vo = service.login(uid, upwd);
		
		
		if(vo!=null) {
			session.setAttribute("authInfo", vo);
			mav.setViewName("index");
		}else {
			mav.setViewName("page-register");
		}
		return mav;
	}
	
	@RequestMapping(value="/logout.do")
		public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index.do";
	}
	
	
}
