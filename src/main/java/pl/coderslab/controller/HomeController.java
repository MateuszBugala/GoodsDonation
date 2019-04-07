package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.DonatedItem;
import pl.coderslab.model.Donation;
import pl.coderslab.model.Role;
import pl.coderslab.model.User;
import pl.coderslab.service.CurrentUser;
import pl.coderslab.service.DonatedItemService;
import pl.coderslab.service.UserService;
import pl.coderslab.service.UserServiceImpl;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;


@Controller
@RequestMapping(path = "/", produces = "text/html; charset=UTF-8")
@SessionAttributes({"donationTemp"})
public class HomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserServiceImpl userServiceImpl;

    @Autowired
    private DonatedItemService donatedItemService;

    @ModelAttribute("donatedItems")
    public List<DonatedItem> findAll() {
        return donatedItemService.findAll();
    }

    @RequestMapping("/")
    public String home() {
        return "index";
    }

    @RequestMapping("/start")
    public String start(@AuthenticationPrincipal CurrentUser currentUser, Model model, HttpSession session) {
        Set<Role> roles = currentUser.getUser().getRoles();
        for (Role el : roles) {
            if (el.getName().equals("ROLE_ADMIN")) {
                return "redirect:/admin";
            }
        }
        return "redirect:/dashboard";
    }

    @RequestMapping("/dashboard")
    public String dashboard(@AuthenticationPrincipal CurrentUser currentUser, Model model, HttpSession session) {
        Donation donation = (Donation) session.getAttribute("donationTemp");
        if (donation == null) {
            donation = new Donation();
            donation.setUser(currentUser.getUser());
            model.addAttribute("donationTemp", donation);
        }
        return "app/dashboard";
    }

    //  create test users:
    @GetMapping("/create-user")
    @ResponseBody
    public String createUser() {
        User user = new User();
        user.setEmail("user@user.com");
        user.setPassword("1");
        user.setName("User1");
        userService.saveUser(user);
        User user2 = new User();
        user2.setEmail("admin@admin.com");
        user2.setPassword("1");
        user2.setName("Admin1");
        userServiceImpl.saveAdmin(user2);
        return "users created";
    }

//    @GetMapping("/create-admin")
//    @ResponseBody
//    public String createAdmin() {
//        User user = new User();
//        user.setEmail("admin@admin.com");
//        user.setPassword("1");
//        userServiceImpl.saveAdmin(user);
//        return "admin created";
//    }


}
