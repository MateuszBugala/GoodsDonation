package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.Role;
import pl.coderslab.model.Token;
import pl.coderslab.model.User;
import pl.coderslab.config.security.CurrentUser;
import pl.coderslab.service.UserServiceImpl;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.Set;

@Controller
@RequestMapping(path = "/users", produces = "text/html; charset=UTF-8")
@SessionAttributes({"currentUser"})
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    @RequestMapping("/all")
    public String all(Model model) {
        model.addAttribute("users", userService.findAll());
        return "app/users/all";
    }


    @GetMapping("/add")
    public String add(Model model, HttpSession session) {
        model.addAttribute("user", new User());
        return "register";
    }


    @PostMapping("/add")
    public String save(@Valid User user, BindingResult result, @AuthenticationPrincipal CurrentUser currentUser) {
        try {
            if (result.hasErrors()) {
                return "register";
            }
            userService.saveUser(user);
//different redirect if user created by admin:
            if (currentUser != null) {
                Set<Role> roles = currentUser.getUser().getRoles();
                for (Role el : roles) {
                    if (el.getName().equals("ROLE_ADMIN")) {
                        return "redirect:/users/all";
                    }
                }
            }
            return "redirect:/activation?sent=true";
        } catch (UserServiceImpl.DuplicatedEmailException e) {
            return "redirect:/users/add?duplicatedemail=true";
        } catch (MessagingException e) {
            System.err.println("Cannot send email" + "\n" +e);
            return "redirect:/activation?sent=false";
        }
    }

    @GetMapping("/add-admin")
    public String addAdmin(Model model, HttpSession session) {
        model.addAttribute("user", new User());
        return "register";
    }


    @PostMapping("/add-admin")
    public String saveAdmin(@Valid User user, BindingResult result) {
        try {
            if (result.hasErrors()) {
                return "users/add";
            }
            userService.saveAdmin(user);
            return "redirect:/users/all";
        } catch (Exception e) {
            return "redirect:/users/add?duplicatedemail=true";
        }
    }

    @GetMapping("/edit/{id}")
    public String update(@PathVariable Long id, Model model, HttpSession session) {
        model.addAttribute("user", userService.findById(id));
        return "app/users/edit";
    }

    @PostMapping("/edit")
    public String update(@RequestParam Long id, @RequestParam String name, @AuthenticationPrincipal CurrentUser currentUser) {
        if (currentUser.getUser().getId() == id) {
            userService.updateName(id, name);
            currentUser.getUser().setName(name);
            return "redirect:/users/profile/"+id;
        }
        userService.updateName(id, name);
        return "redirect:/users/all";
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id, @AuthenticationPrincipal CurrentUser currentUser) {
        Long currentUserId = currentUser.getUser().getId();
        if (currentUserId != id) {
            try {
                userService.delete(id);
                return "redirect:/users/all?deleted=true";
            } catch (Exception ConstraintViolationException) {
                return "redirect:/users/all?error=true";
            }
        }
        return "redirect:/users/all?error=true";
    }

    @RequestMapping("/profile")
    public String all(Model model,@AuthenticationPrincipal CurrentUser currentUser) {
            model.addAttribute("user", userService.findById(currentUser.getUser().getId()));
            return "app/users/myAccount";
    }

    @RequestMapping("/status/{id}")
    public String changeStatus(@PathVariable Long id) {
        userService.changeStatus(id);
        return "redirect:/users/all";
    }

    @RequestMapping("/activation")
    public String changeStatus(@RequestParam String token, @RequestParam String to) {
        User user = userService.getUser(token);
        Token tokenFromDb = userService.getVerificationToken(token);

        if ((user != null) && (user.getEmail().equals(to))) {
            if (LocalDateTime.now().isBefore(tokenFromDb.getExpiryDate())) {
                user.setActivated(true);
                userService.update(user);
                userService.deleteVerificationToken(tokenFromDb);
                return "redirect:/activation?active=true";
            } else {
                return "redirect:/403?expired=true";
            }
        } else {
            return "redirect:/403?invalid=true";
        }

    }

    @PostMapping("/resend")
    public String resendVerificationToken(@RequestParam String email) {
        try {
            userService.resendVerificationToken(email);
            return "redirect:/activation?resent=true";
        } catch (MessagingException e) {
            System.err.println("Cannot send email" + "\n" +e);
            return "redirect:/activation?resent=false";
        }
    }

    @GetMapping("/change-password")
    public String changePassword(){
        return "app/users/changePassword";
    }

    @PostMapping("/change-password")
    public String changePassword(@AuthenticationPrincipal CurrentUser currentUser, @RequestParam String oldPassword, @RequestParam String newPassword){
        if (userService.authorization(currentUser.getUser(),oldPassword)) {
            userService.updatePassword(userService.findById(currentUser.getUser().getId()), newPassword);
            return "redirect:/users/profile?changed=true";
        } else {
            return "redirect:/users/change-password?incorrect=true";
        }
    }

}

