package lab.spring.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lab.spring.model.CommentVO;
import lab.spring.model.KinderInfoVO;
import lab.spring.model.ScoreVO;
import lab.spring.model.detailGraphVO;
import lab.spring.service.MapService;

import org.apache.tomcat.util.codec.binary.Base64;
import org.rosuda.REngine.*;
import org.rosuda.REngine.Rserve.*;

@Controller
public class DetailController {

	@Autowired
	MapService service;

	@SuppressWarnings("finally")
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam(value = "kindername") String kindername,
			@RequestParam(value = "kinderinfoId") String kinderid,
			@RequestParam(value = "subofficeedu") String subofficeedu, HttpServletRequest request,
			HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		KinderInfoVO vo = new KinderInfoVO();
		KinderInfoVO vo2 = new KinderInfoVO();
		detailGraphVO detailvo = new detailGraphVO();

		List<KinderInfoVO> ranklist = null;

		if (session.getAttribute("rankflag") != null) {
			ranklist = service.getRank(session.getAttribute("rankflag").toString());
		}
		
		vo = service.getBadkinder(kindername, subofficeedu);
		vo2 = service.getBadkinder(kindername, subofficeedu);
		detailvo = service.getDetailGraph(kinderid);

		vo = XO(vo);
		ScoreVO score = service.getScore(kinderid);
		if (score == null) {
			score = new ScoreVO();
			score.setScore1(0);
			score.setScore2(0);
			score.setScore3(0);
		} else {
			score.setScore1(score.getScore1() * 10 / 6 * 10 / 12);
			score.setScore2(score.getScore2() * 10 / 3 * 10 / 12);
			score.setScore3(score.getScore3() * 10 / 1 * 10 / 12);
		}

		String positive = "";
		String negative = "";

		// 긍부정 단어 받아오기
		try {
//			File file = new File("/Users/minji/kids/kids/positive.txt");
			File file = new File("F:positive.txt");
			FileReader filereader = new FileReader(file);
			BufferedReader bufReader = new BufferedReader(filereader);
			positive = bufReader.readLine();

//			file = new File("/Users/minji/kids/kids/negative.txt");
			file = new File("F:negative.txt");
			filereader = new FileReader(file);
			bufReader = new BufferedReader(filereader);
			negative = bufReader.readLine();

			filereader.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		// 긍부정 단어
		mav.addObject("positive", positive);
		mav.addObject("negative", negative);

		// 스파이더 차트에 사용 할 3가지 점수
		mav.addObject("score", score);

		mav.addObject("rankSet", ranklist);
		mav.addObject("kindername", kindername);
		mav.addObject("kinderinfoId", kinderid);
		mav.addObject("badkinder", vo);
		mav.addObject("badDetail", vo2);

		// 6가지 그래프에 사용 할 vo
		mav.addObject("graph", detailvo);
		mav.setViewName("detail");
		return mav;

	}

	public KinderInfoVO XO(KinderInfoVO vo) {
		ArrayList<Integer> total = new ArrayList<Integer>();
		int cnt = 0;
		String image1 = "resources/images/red.png";
		String image2 = "resources/images/orange.png";
		String image3 = "resources/images/yellow.png";
		String image4 = "resources/images/green.png";

		if (vo.getBad_oper() == null) {
			vo.setBad_oper("양호");
		} else {
			vo.setBad_oper("O");
			cnt++;
			total.add(cnt);
		}

		if (vo.getBad_program() == null) {
			vo.setBad_program("양호");
		} else {
			vo.setBad_program("O");
			cnt++;
			total.add(cnt);
		}

		if (vo.getBad_meal() == null) {
			vo.setBad_meal("양호");
		} else {
			vo.setBad_meal("O");
			cnt++;
			total.add(cnt);
		}

		if (vo.getBad_care() == null) {
			vo.setBad_care("양호");
		} else {
			vo.setBad_care("O");
			cnt++;
			total.add(cnt);
		}

		if (vo.getBad_emp() == null) {
			vo.setBad_emp("양호");
		} else {
			vo.setBad_emp("O");
			cnt++;
			total.add(cnt);
		}

		if (vo.getBad_tax() == null) {
			vo.setBad_tax("양호");
		} else {
			vo.setBad_tax("O");
			cnt++;
			total.add(cnt);
		}

		if (vo.getBad_build() == null) {
			vo.setBad_build("양호");
		} else {
			vo.setBad_build("O");
			cnt++;
			total.add(cnt);
		}

		if (vo.getBad_money() == null) {
			vo.setBad_money("양호");
		} else {
			vo.setBad_money("O");
			cnt++;
			total.add(cnt);
		}

		if (total.size() >= 5) {
			vo.setImage(image1);
		} else if (total.size() >= 3) {
			vo.setImage(image2);
		} else if (total.size() >= 2) {
			vo.setImage(image3);
		} else {
			vo.setImage(image4);
		}
		return vo;
	}
}
