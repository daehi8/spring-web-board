package home.main.security;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import home.model.dto.MemberDTO;
import home.model.service.MemberService;

@Service("userDeSer")
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
    private UserAuthDAO userAuthDAO;

     @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    	System.out.println(username);

        CustomUserDetails user = userAuthDAO.getUserById(username);
        if(user==null) {
            throw new UsernameNotFoundException(username);
        }

        return user;
    }

}
