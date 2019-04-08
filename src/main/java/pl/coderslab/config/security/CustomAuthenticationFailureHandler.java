package pl.coderslab.config.security;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {

        if(exception.getClass().isAssignableFrom(BadCredentialsException.class)) {
            setDefaultFailureUrl("/login?error=true");
        }
        else if (exception.getClass().isAssignableFrom(CustomDaoAuthenticationProvider.UserDisabledException.class)) {
            setDefaultFailureUrl("/403");
        }

        super.onAuthenticationFailure(request, response, exception);

    }
}
