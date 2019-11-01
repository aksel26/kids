package lab.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;

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
                        HttpSession session,HttpServletResponse response) throws IOException {
      ModelAndView mav = new ModelAndView();
      UserVO vo = null;
      vo = service.login(uid, upwd);


      
      
      if(vo!=null) {
         
         session.setAttribute("authInfo", vo);
         session.setAttribute("rankflag", vo.getLocation());
         mav.setViewName("redirect:index.do");         
      }
      
      else {
    	  response.setContentType("text/html; charset=UTF-8");    
         PrintWriter out = response.getWriter();
         
         out.println("<script>window.alert('다시 입력해 주세요'); history.go(-1);	</script>");
         out.close();   
         mav.setViewName("index");
         response.sendRedirect("index.do");
      } 
         
      
      return mav;
   }
   
   @RequestMapping(value="/logout.do")
      public String logout(HttpSession session) {
      session.invalidate();
      return "redirect:/index.do";
   }
   
   
}