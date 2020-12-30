package home.main.sequrity;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userAuthDAO")
public class UserAuthDAO {
    
    @Autowired
    private SqlSessionTemplate dao = null;
 
    public CustomUserDetails getUserById(String username) {
        return dao.selectOne("member.selectUserById", username);
    }
 
}
