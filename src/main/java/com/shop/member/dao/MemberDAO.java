package com.shop.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.shop.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAO  {
	@Autowired
	private SqlSession sqlSession;	
	
	public MemberVO login(Map loginMap) throws DataAccessException{
		MemberVO member = (MemberVO)sqlSession.selectOne("mapper.member.login", loginMap);
	   return member;
	}
	
	public void insertNewMember(MemberVO memberVO) throws DataAccessException{
		sqlSession.insert("mapper.member.insertNewMember",memberVO);
	}

	public String selectOverlappedID(String user_id) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.member.selectOverlappedID",user_id);
		return result;
	}

	public String gettest() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.member.test","");
	}
	
	
}
