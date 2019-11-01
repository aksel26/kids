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
import lab.spring.model.ScoreVO;
import lab.spring.service.MapService;

import org.apache.tomcat.util.codec.binary.Base64;
import org.rosuda.REngine.*;
import org.rosuda.REngine.Rserve.*;

@Controller
public class DetailController {

		@Autowired
		MapService service;
		
		@SuppressWarnings("finally")
		@RequestMapping(value="/detail.do", method = RequestMethod.GET)
		public ModelAndView detail(@RequestParam(value= "kindername") String kindername,
									@RequestParam(value= "kinderinfoId") String kinderid,
									@RequestParam(value="subofficeedu") String subofficeedu,
									HttpServletRequest request) {
		
			ModelAndView mav = new ModelAndView();
			KinderInfoVO vo = new KinderInfoVO();
			KinderInfoVO vo2 = new KinderInfoVO();
			
			List<KinderInfoVO> ranklist = null;
			ranklist = service.getRank();
			
			vo=service.getBadkinder(kindername, subofficeedu);
			vo2=service.getBadkinder(kindername, subofficeedu);
		
			vo=XO(vo);

			ScoreVO score = service.getScore(kinderid);
			if(score == null) {
				score = new ScoreVO();
				score.setScore1(0);
				score.setScore2(0);
				score.setScore3(0);
			}
			else {
				score.setScore1(score.getScore1()*10/6*10/12);
				score.setScore2(score.getScore2()*10/3*10/12);
				score.setScore3(score.getScore3()*10/1*10/12);
			}
			try {
				RConnection r = new RConnection();
		        REXP x = null;
		        System.out.println(kinderid);
				r.eval("try(jpeg('test.jpg', quality=100))");
		    	String po = "kdid <- \""+kinderid+"\"";
		    	r.eval(po);
		    	r.eval("setwd(\"F:/Rworkspace/R1day\")");
		    	r.eval("source('F:/Rworkspace/R1day/commentanalysis.R')");
		    	r.eval("wordcloudp(sentence)");
		    	r.eval("graphics.off()");
		    	x=r.eval("r=readBin('test.jpg','raw',1024*1024);unlink('test.jpg');r");
		    	
				
		    	String base64Encoded = new String(Base64.encodeBase64(x.asBytes()),"UTF-8");
		    	
				mav.addObject("image",base64Encoded);

			}
			catch(Exception e) {
				System.out.println(e.getMessage());
				mav.addObject("image",1);
			}
			finally {
				mav.addObject("score",score);
				mav.addObject("rankSet",ranklist);
				mav.addObject("kindername", kindername);
				mav.addObject("kinderinfoId", kinderid);
				mav.addObject("badkinder", vo);
				mav.addObject("badDetail", vo2);
				mav.setViewName("detail");
				return mav;
			}
			
		}
		
	public KinderInfoVO XO(KinderInfoVO vo) {
		ArrayList<Integer> total = new ArrayList<Integer>(); 
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
		
		
		return vo;
	}
	
	public byte[] getCloud() throws REXPMismatchException {
		
		REXP x = null;
		String kinderid = "KN028";
		
		try {
			System.out.println("-1");
			RConnection r = new RConnection();
			System.out.println("0");
	        
	        System.out.println(kinderid);
			r.eval("try(jpeg('test.jpg', quality=100))");
			
			System.out.println("1");
			String po = "kdid <- \'"+kinderid+"\'";
	    	r.eval(po);
	    		    	
	    	r.eval("setwd(\"F:/Rworkspace/R1day\")");	    	
	    	r.eval("source('F:/Rworkspace/R1day/commentanalysis.R')");
	    	
	    	
	    	System.out.println("3");
	    	r.eval("wordcloudp(sentence)");
	    	System.out.println("4");
	    	r.eval("graphics.off()");
	    	System.out.println("5");
	    	x=r.eval("r=readBin('test.jpg','raw',512*512);unlink('test.jpg');r");
	    	System.out.println("6");
			
	    	String base64Encoded = new String(Base64.encodeBase64(x.asBytes()),"UTF-8");
	    	
	    	System.out.println("성공");
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return x.asBytes();
	}
	
	public static void main(String[] args) throws REXPMismatchException, REngineException {
    	
    	
		DetailController rs = new DetailController();
		rs.getCloud();
	

}

}



	


	