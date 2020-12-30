package home.main.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@SuppressWarnings("serial")
public class CustomUserDetails implements UserDetails {

    private String id;
    private String pw;
    private String AUTHORITY;
    private boolean ENABLED;
    private String NAME;
	
	// setter
	public void setUsername(String username) {
		this.id = username;
	}

	// setter
	public void setPassword(String password) {
		this.pw = password;
	}
    
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(AUTHORITY));
		return auth;
	}

	 @Override
	    public String getPassword() {
	        return pw;
	    }
	 
	    @Override
	    public String getUsername() {
	        return id;
	    }
	 
	    @Override
	    public boolean isAccountNonExpired() {
	        return true;
	    }
	 
	    @Override
	    public boolean isAccountNonLocked() {
	        return true;
	    }
	 
	    @Override
	    public boolean isCredentialsNonExpired() {
	        return true;
	    }
	 
	    @Override
	    public boolean isEnabled() {
	        return ENABLED;
	    }
	    
	    public String getNAME() {
	        return NAME;
	    }
	 
	    public void setNAME(String name) {
	        NAME = name;
	    }

}
