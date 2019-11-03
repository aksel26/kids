package lab.spring.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lab.spring.model.CommentVO;
import lab.spring.service.MapService;


@Controller
public class CommentAction extends HttpServlet  {
	
	@Autowired
	MapService service;
	
	@RequestMapping(value="/commentList.do")
	@ResponseBody
	public String getCommentList(String kdid){
		
		StringBuffer result=new StringBuffer("");
		
		List<CommentVO> commentList = service.findCommentList(kdid);
		
		HashMap<String, Integer> hm = wordCount(commentList);
		
//		for(String key : hm.keySet()) {
//			System.out.println(key + " : " + hm.get(key));
//		}
		try {
			BufferedWriter fw = new BufferedWriter(
					new OutputStreamWriter(
							new FileOutputStream("F:\\Github\\kids\\kids\\src\\main\\webapp\\resources\\images\\worddata3.csv"),"utf-8"));
			
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

		result.append("{\"result\":[");
		for(int i = 0;i<commentList.size();i++) {
			result.append("[{\"Contents\":\""+commentList.get(i).getContents()+"\"},");
			result.append("{\"Writer\":\""+commentList.get(i).getWriter()+"\"},");
			result.append("{\"Score\":\""+commentList.get(i).getScore()+"\"}]");
			
			if(i!=commentList.size()-1) {
				result.append(",");
			}
		}
		result.append("]}");
		return result.toString();
	}
	
	@RequestMapping(value="/addCommnet.do")
	@ResponseBody
	public void addComment(
			HttpServletRequest request,
			String contents,
			String kdid,
			String user,
			String star
			) {
		
		
		CommentVO comment = new CommentVO();
		comment.setKdid(kdid);
		comment.setScore(star);
		comment.setWriter(user);
		comment.setContents(contents);
		
		service.addComment(comment);
	}
	
public HashMap<String, Integer> wordCount(List<CommentVO> ls) {
		
		HashMap<String, Integer> hm = new HashMap<>();
		HashSet<String> arr2 = new HashSet<String>();
		
		HashSet<String> hs = new HashSet<String>();
		
		try{
            //파일 객체 생성
            File file = new File("F:\\words.txt");
            //입력 스트림 생성
            FileReader filereader = new FileReader(file);
            
            BufferedReader bufReader = new BufferedReader(filereader);

            String line = "";
            while((line = bufReader.readLine()) != null){
            	hs.add(line);
            }
            filereader.close();
        }catch(Exception e) {
        	System.out.println(e.getMessage());
        }


		ArrayList<String> worr = new ArrayList<String>(hs);
		
		
		
		for(int i = 0 ; i<ls.size();i++) {
			
			String[] split = ls.get(i).getContents().split("\\s|\\,|\\.");
			
			for(int j = 0;j<split.length;j++) {
				
				for(int k = 0;k<worr.size();k++) {
					if(split[j].contains(worr.get(k))) {
						arr2.add(worr.get(k));
						break;
					}
				}
			}
		}
		
		ArrayList<String> arr3 = new ArrayList<>(arr2);
		
		
		for(int i = 0;i<arr3.size();i++) {
			hm.put(arr3.get(i), 0);
		}
		
		int weight = 1;
		if(arr3.size()<15) {
			weight = 40;
		}
		

		for(int i = 0 ; i<ls.size();i++) {
			String[] split = ls.get(i).getContents().split("\\s|\\.|\\,");
			for(int j = 0;j<split.length;j++) {
				for(int k = 0;k<worr.size();k++) {
					if(split[j].contains(worr.get(k))) {
						hm.replace(worr.get(k), hm.get(worr.get(k))+weight );
						break;
					}
				}
			}
		}
		
		return hm;
	}

	


	

}