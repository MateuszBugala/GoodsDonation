package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.Token;
import pl.coderslab.model.User;
import pl.coderslab.config.security.CurrentUser;
import pl.coderslab.repository.TokenRepository;
import pl.coderslab.service.UserServiceImpl;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;

@Controller
@RequestMapping(produces = "text/html; charset=UTF-8")
@SessionAttributes({"currentUser"})
public class LoginController {

    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private TokenRepository tokenRepository;

    @GetMapping("/login")
    public String login(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        if (currentUser == null) {
            model.addAttribute("user", new User());
            return "login";
        } else {
            return "redirect:/dashboard";
        }
    }


    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        SecurityContextHolder.clearContext();
//        SecurityContextHolder.getContext().getAuthentication().setAuthenticated(false);
//        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/reset-password")
    public String resetPassword() {
        return "resetPassword";
    }


    @PostMapping("/reset-password")
    public String resetPassword(@RequestParam String email) {
        userService.resetPassword(email);
        return "redirect:/reset-password?sent=true";
    }

    @GetMapping("/new-password")
    public String newPassword(@RequestParam String token, @RequestParam String email, Model model) {
        User user = userService.getUser(token);
        Token tokenFromDb = userService.getVerificationToken(token);

        if ((user != null) && (user.getEmail().equals(email))) {
            if (LocalDateTime.now().isBefore(tokenFromDb.getExpiryDate())) {
                return "redirect:/reset-password?id="+tokenFromDb.getId()+"&email="+user.getEmail();
            } else {
                return "redirect:/reset-password?expired=true";
            }
        } else {
            return "redirect:/reset-password?invalid=true";
        }
    }


    @PostMapping("/new-password")
    public String newPassword(@RequestParam String password, @RequestParam String email, @RequestParam Long tokenId) {
        userService.updatePassword(userService.findByEmail(email), password);
        tokenRepository.delete(tokenId);
        return "redirect:/reset-password?reset=true";
    }

}
