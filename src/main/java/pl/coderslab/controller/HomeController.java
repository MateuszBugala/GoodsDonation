package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.config.security.CurrentUser;
import pl.coderslab.model.DonatedItem;
import pl.coderslab.model.Donation;
import pl.coderslab.model.Role;
import pl.coderslab.model.User;
import pl.coderslab.service.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;


@Controller
@RequestMapping(path = "/", produces = "text/html; charset=UTF-8")
@SessionAttributes({"donationTemp"})
public class HomeController {

    @Autowired
    private DonatedItemService donatedItemService;

    @Autowired
    private DonationService donationService;

    @Autowired
    private InstitutionService institutionService;

    @ModelAttribute("donatedItems")
    public List<DonatedItem> findAll() {
        return donatedItemService.findAll();
    }

    @RequestMapping("/")
    public String home(Model model) {
        model.addAttribute("qty", donationService.donatedBags());
        model.addAttribute("institutionsQty", donationService.donatedInstitutions());
        model.addAttribute("foundations", institutionService.findFirst3(1L));
        model.addAttribute("ngos", institutionService.findFirst3(2L));
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
    public String createUser() throws UserServiceImpl.DuplicatedEmailException {
        User user = new User();
        user.setEmail("user@user.com");
        user.setPassword("1");
        user.setName("User1");
        userServiceImpl.saveUser(user);
        User user2 = new User();
        user2.setEmail("admin@admin.com");
        user2.setPassword("1");
        user2.setName("Admin1");
        user2.setActivated(true);
        userServiceImpl.saveAdmin(user2);
        return "users created";
    }

    @GetMapping("/create-admin")
    @ResponseBody
    public String createAdmin() {
        User user = new User();
        user.setEmail("admin@admin.com");
        user.setPassword("1");
        user.setName("Admin1");
        user.setActivated(true);
        userServiceImpl.saveAdmin(user);
        return "admin created";
    }


}
