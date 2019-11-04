package lab.spring.controller;



import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger; 
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod; 
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes; 



import lab.spring.model.UserVO;
import lab.spring.service.UserRegService;
import lab.spring.service.UserService; 

@Controller 
 

public class UserController { 
	private static final Logger logger = LoggerFactory.getLogger(UserController.class); 

	@Autowired
	private UserService userService; 
	
	
	@RequestMapping(value = "/page-register", method=RequestMethod.GET) 
	public String page_register() throws Exception{
		return "page-register";
		
	}
	
	@RequestMapping(value = "/page-register1",method=RequestMethod.POST) 
	
	public ModelAndView user_register(HttpServletRequest request,HttpSession session) throws Exception {
		 
		
		   String id = request.getParameter("userid");
		   String pw = request.getParameter("userpwd");
		   String name = request.getParameter("username");
		   String email = request.getParameter("email");
		   String location = request.getParameter("location");

		   ModelAndView view = new ModelAndView();
		   UserVO vo = new UserVO();
		   
		   vo.setUserid(id);
		   vo.setUserpwd(pw);
		   vo.setUsername(name);
		   vo.setEmail(email);
		   vo.setLocation(location);
		   
		   if(location.equals("광진구")) {vo.setPOINT_X("37.545249");vo.setPOINT_Y("127.083211");}
			else if(location.equals("서초구")) {vo.setPOINT_X("37.495774");vo.setPOINT_Y("127.006647");}
			else if(location.equals("동작구")) {vo.setPOINT_X("37.503169");vo.setPOINT_Y("126.951332");}
			else if(location.equals("양천구")) {vo.setPOINT_X("37.522783");vo.setPOINT_Y("126.855652");}
			else if(location.equals("용산구")) {vo.setPOINT_X("37.536252");vo.setPOINT_Y("126.982931");}
			else if(location.equals("서대문구")) {vo.setPOINT_X("37.575935");vo.setPOINT_Y("126.935828");}
			else if(location.equals("관악구")){vo.setPOINT_X("37.481487");vo.setPOINT_Y("126.940439");}
			else if(location.equals("강북구")){vo.setPOINT_X("37.634510");vo.setPOINT_Y("127.021930");}
			else if(location.equals("성북구")){vo.setPOINT_X("37.598600");vo.setPOINT_Y("127.022138");}
			else if(location.equals("중랑구")) {vo.setPOINT_X("37.598088");vo.setPOINT_Y("127.092722");}
			else if(location.equals("강남구")) {vo.setPOINT_X("37.503173");vo.setPOINT_Y("127.050169");}
			else if(location.equals("영등포구")) {vo.setPOINT_X("37.517285");vo.setPOINT_Y("126.907831");}
			else if(location.equals("종로구")) {vo.setPOINT_X("37.584256");vo.setPOINT_Y("126.972959");}
			else if(location.equals("강서구")) {vo.setPOINT_X("37.554956");vo.setPOINT_Y("126.832973");}
			else if(location.equals("강동구")) {vo.setPOINT_X("37.544944");vo.setPOINT_Y("127.142351");}
			else if(location.equals("성동구")) {vo.setPOINT_X("37.554541");vo.setPOINT_Y("127.041052");}
			else if(location.equals("도봉구")) {vo.setPOINT_X("37.661328");vo.setPOINT_Y("127.035878");}
			else if(location.equals("구로구")) {vo.setPOINT_X("37.498454");vo.setPOINT_Y("126.856539");}
			else if(location.equals("노원구")) {vo.setPOINT_X("37.650681");vo.setPOINT_Y("127.068601");}
			else if(location.equals("마포구")) {vo.setPOINT_X("37.559956");vo.setPOINT_Y("126.907613");}
			else if(location.equals("송파구")) {vo.setPOINT_X("37.504126");vo.setPOINT_Y("127.115071");}
			else if(location.equals("동대문구")) {vo.setPOINT_X("37.581223");vo.setPOINT_Y("127.056578");}

		   
		   
		   session.setAttribute("authInfo", vo);
		   
		   userService.insertUser(vo);
		   
		   view.setViewName("redirect:/index.do");
		   return view;
		   
		   
	}
	}



