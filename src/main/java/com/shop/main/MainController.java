package com.shop.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.member.service.MemberService;;


@Controller

public class MainController {
	@Autowired
	private MemberService memberService;

	@RequestMapping(value= {"/","index.do"} ,method={RequestMethod.POST, RequestMethod.GET})
	public String main(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{

		
		return "/main/main";
	}
}
