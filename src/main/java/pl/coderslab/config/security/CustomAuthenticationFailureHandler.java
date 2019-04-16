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

        if(exception instanceof BadCredentialsException) {
            setDefaultFailureUrl("/login?error=true");
        }
        else if (exception instanceof CustomDaoAuthenticationProvider.UserDisabledException) {
            setDefaultFailureUrl("/403");
        }
        else if (exception instanceof CustomDaoAuthenticationProvider.UserNotActivatedException) {
            setDefaultFailureUrl("/403?activated=false");
        }


        super.onAuthenticationFailure(request, response, exception);

    }
}
