package home.model.service;

import java.util.ArrayList;
import java.util.List;

import home.model.dto.MemberDTO;

public interface MemberService {
	
	// 회원가입
	public void insertMember(MemberDTO dto);
	
	// 아이디 중복 체크
	public boolean selectId(MemberDTO dto);
	
	// 로그인
	public boolean loginCheck(MemberDTO dto);
	
	// 내 정보 확인	
	public MemberDTO myInfo(String id);
	
	// 정보 수정
	public void updateMember(MemberDTO dto);
	
	// 회원 탈퇴
	public void deleteMember (MemberDTO dto);
	
	public MemberDTO getUserById(String username)throws Exception;
	
}
