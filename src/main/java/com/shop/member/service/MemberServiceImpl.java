package com.shop.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.shop.member.dao.MemberDAO;
import com.shop.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public MemberVO login(Map loginMap) throws Exception{
		return memberDAO.login(loginMap);
	}
	
	@Override
	public void addMember(MemberVO memberVO) throws Exception{
		memberDAO.insertNewMember(memberVO);
	}
	
	@Override
	public String overlapped(String user_id) throws Exception{
		return memberDAO.selectOverlappedID(user_id);
	}

}
