package lab.spring.controller;



import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
 


	public class UserRegController {

		@Autowired
		private UserRegService reg_service;

	// id 중복 체크 컨트롤러
		@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
		@ResponseBody
		public int idCheck(@RequestParam("userId") String user_id) throws Exception {

			return reg_service.userIdCheck(user_id);
		}
	}
