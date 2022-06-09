package com.shop.member.service;

import java.util.Map;

import com.shop.member.vo.MemberVO;

public interface MemberService {
	public MemberVO login(Map  loginMap) throws Exception;
	public void addMember(MemberVO memberVO) throws Exception;
	public String overlapped(String user_id) throws Exception;
}
