package com.shop.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shop.member.service.MemberService;
import com.shop.member.vo.MemberVO;

@Controller("memberController")
@RequestMapping(value="/member")

public class MemberController{
	@Autowired
	MemberService memberService;
	@Autowired
	MemberVO memberVO = new MemberVO();

	  @RequestMapping(value="/login.do", method = RequestMethod.GET)
	  public String login(@RequestParam Map<String, String> loginMap,
              HttpServletRequest request, HttpServletResponse response) throws Exception {
	  
		  return "/member/loginForm";
	  }
	 
	
	@RequestMapping(value="/loginCheck.do", method = RequestMethod.POST)
	public ModelAndView loginCheck(@RequestParam Map<String, String> loginMap,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		memberVO = memberService.login(loginMap);
		
		if(memberVO != null && memberVO.getUser_id() != null){
			HttpSession session=request.getSession();
			session=request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo",memberVO);
			
			String action=(String)session.getAttribute("action");
			
			  if(action!=null){
			  mav.setViewName("forward:"+action); 
			  } else { mav.setViewName("/main/main");
			  
			  }
			 	 
		}else{
			String message="?ïÑ?ù¥?îî ?òê?äî ÎπÑÎ?Î≤àÌò∏Í∞? ??Î¶ΩÎãà?ã§. ?ã§?ãú Î°úÍ∑∏?ù∏?ï¥Ï£ºÏÑ∏?öî";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}
	
	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		session.invalidate();
		mav.setViewName("redirect:/index.do");
		
		System.out.println(session);
		return mav;
	}
	
	@RequestMapping(value="/addMember.do", method = RequestMethod.GET)
	public String addMember(@ModelAttribute("memberVO") MemberVO _memberVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		return "/member/memberForm";
	}
	
	@RequestMapping(value="/addMemberCheck.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity addMemberCheck(@ModelAttribute("memberVO") MemberVO _memberVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    memberService.addMember(_memberVO);
		    message  = "<script>";
		    message +=" alert('?öå?õê Í∞??ûÖ?ù¥ ?ôÑÎ£åÎêò?óà?äµ?ãà?ã§.');";
		    message += " location.href='"+request.getContextPath()+"/member/login.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('?ûë?óÖ Ï§? ?ò§Î•òÍ? Î∞úÏÉù?ñà?äµ?ãà?ã§. ?ã§?ãú ?ãú?èÑ?ï¥ Ï£ºÏÑ∏?öî');";
		    message += " location.href='"+request.getContextPath()+"/member/addMember.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("user_id") String user_id,HttpServletRequest request, HttpServletResponse response) throws Exception{
									//?ãú?ûë?ïò?ûêÎßàÏûê ?éò?ù¥Ïß??óê?Ñú ajaxÎ°? Î∞îÎ°ú Î∞õÏïÑ?ò§Í≤†Îã§.
		ResponseEntity resEntity = null;
		
		request.getParameter("user_id");
		
		String result = memberService.overlapped(user_id);
		
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		
		return resEntity;
	}
	

}
