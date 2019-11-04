package lab.spring.controller;


import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
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
		
		
		List<CommentVO> commentList = service.findCommentList("KN027");
		HashMap<String, Integer> hm = wordCount(commentList);
		
		
		try {
			BufferedWriter fw = new BufferedWriter(
					new OutputStreamWriter(
							new FileOutputStream("/Users/minji/kids/kids/src/main/webapp/resources/images/worddata3.csv"),"UTF-8"));
			
			fw.write("text,frequency\r\n");
			
			for(String key : hm.keySet()) {
				fw.write(key+","+hm.get(key)+"\r\n");
			}
			
			fw.flush();
			fw.close();
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		mav.setViewName("csv");
		return mav;
	}	
	
	
	
	public HashMap<String, Integer> wordCount(List<CommentVO> ls) {
		
		HashMap<String, Integer> hm = new HashMap<>();
		
		
		
		HashSet<String> arr2 = new HashSet<String>();
		
		//HashSet 중복 제거
		for(int i = 0 ; i<ls.size();i++) {

			String[] split = ls.get(i).getContents().split(" ");
			
			for(int j = 0;j<split.length;j++) {
				
				arr2.add(split[j]);
			
			}
		}
		
		//HashMap
		ArrayList<String> arr3 = new ArrayList<>(arr2);
		
		for(int i = 0;i<arr3.size();i++) {
			hm.put(arr3.get(i), 0);
		}
		
		for(int i = 0 ; i<ls.size();i++) {
			String[] split = ls.get(i).getContents().split(" ");
			for(int j = 0;j<split.length;j++) {
				hm.replace(split[j], hm.get(split[j])+1 );
			}
		}
		
		return hm;
		
	}
	}
