package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.model.User;
import pl.coderslab.service.CurrentUser;
import pl.coderslab.service.UserService;
import pl.coderslab.service.UserServiceImpl;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(path = "/", produces = "text/html; charset=UTF-8")
public class HomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserServiceImpl userServiceImpl;

    @RequestMapping("/")
    public String home(@AuthenticationPrincipal CurrentUser currentUser) {
        if (currentUser == null) {
            return "index";
        } else {
            return "redirect:/dashboard";
        }

    }

    @RequestMapping("/dashboard")
    public String dashboard() {
        return "app/dashboard";
    }

    @RequestMapping("/logout")
    public String logout() {
        SecurityContextHolder.clearContext();
//        SecurityContextHolder.getContext().getAuthentication().setAuthenticated(false);
        return "redirect:/";
    }


    //  create test users:
    @GetMapping("/create-user")
    @ResponseBody
    public String createUser() {
        User user = new User();
        user.setEmail("user@user.com");
        user.setPassword("1");
        userService.saveUser(user);
        return "user created";
    }

    @GetMapping("/create-admin")
    @ResponseBody
    public String createAdmin() {
        User user = new User();
        user.setEmail("admin@admin.com");
        user.setPassword("1");
        userServiceImpl.saveAdmin(user);
        return "admin created";
    }


}
