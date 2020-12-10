package home.model.service;

import java.util.ArrayList;
import java.util.List;

import home.model.dto.MemberDTO;

public interface MemberService {
	
	// 회원가입
	public void insert(MemberDTO dto);
	
	// 아이디 중복 체크
	public boolean selectId(String id);
	
	// 로그인
	public boolean loginCheck(MemberDTO dto);
	
	// 내 정보 확인	
	public MemberDTO myInfo(String id);
	
	// 정보 수정
	public void update(MemberDTO dto);
	
	// 회원 탈퇴
	public void delete (MemberDTO dto);
}
