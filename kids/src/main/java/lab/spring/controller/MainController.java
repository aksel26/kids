package lab.spring.controller;


import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import lab.spring.service.MapService;



@RestController
public class MainController {
	
	@Autowired
	MapService service;
	
	@RequestMapping(value="/index.do", method = RequestMethod.GET)
	public ModelAndView sayHello(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		List<KinderInfoVO> ranklist = null;


		Document doc = Jsoup.connect("https://www.ipipipip.net/index.php?ln=ko").get();
		Elements item = doc.select(".yourip span");
		String ip = item.text();
		
		mav.addObject("ip",ip);
		
		
		ranklist = service.getRank();
		mav.addObject("rankSet",ranklist);

		mav.setViewName("index");
		
		return mav;
			
	}


	
	
	@RequestMapping(value="/newinfo.do", method = RequestMethod.GET)
	public ModelAndView newinfo() throws IOException {
		ModelAndView mav = new ModelAndView();
		
		Document doc = Jsoup.connect("https://www.ipipipip.net/index.php?ln=ko").get();
		Elements item = doc.select(".yourip span");
		String ip = item.text();
		
		mav.addObject("ip",ip);
		mav.setViewName("newInfo");
		return mav;
			
	}
	}
