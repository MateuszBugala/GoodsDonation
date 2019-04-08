package pl.coderslab.service;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomDaoAuthenticationProvider extends DaoAuthenticationProvider {

    @Override
    protected void additionalAuthenticationChecks(UserDetails userDetails, UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
        super.additionalAuthenticationChecks(userDetails, authentication);
        CurrentUser user = (CurrentUser) userDetails;
        if (user.getUser().getEnabled() == 0) {
            throw new UserDisabledException("User is disabled");
        }
    }

    public static class UserDisabledException extends AuthenticationException {
        public UserDisabledException(String message) {
            super(message);
        }
    }


}
