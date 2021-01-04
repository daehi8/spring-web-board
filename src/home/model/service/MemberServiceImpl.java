package home.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import home.model.dto.MemberDTO;

@Service("memberDAO")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSessionTemplate dao = null;
	
	@Override
	public void insertMember(MemberDTO dto) {
		dao.insert("member.insertMember", dto);
	}

	@Override
	public boolean selectId(MemberDTO dto) {
		int count = dao.selectOne("member.selectIdCheck", dto);
		boolean result = false;
		
		if(count == 1) result = true;
		else result = false;
			
		return result;
	}

	@Override
	public boolean loginCheck(MemberDTO dto) {
		int count = dao.selectOne("member.selectIdCheck", dto);
		boolean result = false;
		
		if(count == 1) result = true;
		else result = false;
			
		return result;
	}

	@Override
	public MemberDTO myInfo(String id) {
		return dao.selectOne("member.myInfo", id);
	}

	@Override
	public void updateMember(MemberDTO dto) {
		dao.update("member.updateMember", dto);		
	}

	@Override
	public void deleteMember(MemberDTO dto) {
		dao.update("member.deleteMember", dto);		
	}

	@Override
	public MemberDTO getUserById(String username) {
		return dao.selectOne("member.selectUserById", username);		
	}
}
