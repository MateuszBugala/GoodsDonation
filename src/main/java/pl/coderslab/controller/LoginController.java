package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.User;
import pl.coderslab.service.UserService;
import pl.coderslab.service.UserServiceImpl;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping(path = "/login", produces = "text/html; charset=UTF-8")
@SessionAttributes({"currentUser", "currentUserGroup"})
public class LoginController {

    @Autowired
    private UserServiceImpl userService;

    @GetMapping("/")
    public String login(Model model, HttpSession session) {
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/")
    public String authorize(@Valid User user, @RequestParam String password, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "login/login";
        }
        String emailCandidate = user.getEmail();
        String passwordCandidate = password;
        User authorizedUser = userService.authorization(emailCandidate, passwordCandidate);

        if (authorizedUser != null) {
            model.addAttribute("currentUser", authorizedUser);
            return "login/loginSuccess";
        } else {
            return "redirect:/login?error=true";
        }

    }

}
