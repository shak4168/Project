package com.shop.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class MainController {
	
	/* �ʱ�ȭ�� ���� */
	@RequestMapping(value="/")
	public String main(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		
		return "index";
	}
}
