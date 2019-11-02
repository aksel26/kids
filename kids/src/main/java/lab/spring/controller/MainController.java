package lab.spring.controller;


import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lab.spring.model.CommentVO;
import lab.spring.model.KinderInfoVO;
import lab.spring.model.UserVO;
import lab.spring.service.MapService;



@RestController
public class MainController {
	
	@Autowired
	MapService service;
	
	@RequestMapping(value="/index.do", method = RequestMethod.GET)
	public ModelAndView sayHello(HttpServletRequest request,HttpSession session) throws IOException {
		ModelAndView mav = new ModelAndView();
		List<KinderInfoVO> ranklist = null;
		UserVO vo = new UserVO();

		Document doc = Jsoup.connect("https://www.ipipipip.net/index.php?ln=ko").get();
		Elements item = doc.select(".yourip span");
		String ip = item.text();
		if(session.getAttribute("rankflag")==null || session.getAttribute("rankflag").toString().length() <= 1) {
			session.setAttribute("rankflag", "0");
		}

		mav.addObject("ip",ip);
		
		
		ranklist = service.getRank(session.getAttribute("rankflag").toString());
		mav.addObject("rankSet",ranklist);

		mav.setViewName("index");
		
		return mav;
			
	}

	
	@RequestMapping(value="/csv.do", method = RequestMethod.GET)
	public ModelAndView csv() throws IOException {
		ModelAndView mav = new ModelAndView();
		
		
		StringBuffer result = new StringBuffer("");
		
		result.append("text,frequency|");
		result.append("자리야,80|");
		result.append("트레이서,100|");
		result.append("한조,20|");
		result.append("솔져,60|");
		result.append("시메트라,50|");
		result.append("윈스턴,30|");
		result.append("라인하르트,30|");
		result.append("아나,20|");
		result.append("맥크리,20|");
		result.append("메르시,20|");
		result.append("이원호,20|");
		result.append("김민지,20|");
		result.append("김현민,20|");
		result.append("준바,20|");
		result.append("로드호그,20|");
		result.append("정크랫,20");
				 
				
		mav.addObject("data1",result.toString());
		mav.setViewName("csv");
		return mav;
	}	
	}
