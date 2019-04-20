package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.Message;
import pl.coderslab.service.MessageService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping(path = "/messages", produces = "text/html; charset=UTF-8")
public class MessageController {

    @Autowired
    private MessageService messageService;

    @RequestMapping("/all")
    public String all(Model model) {
        model.addAttribute("messages", messageService.findAll());
        return "app/messages/all";
    }

    @PostMapping("/add")
    public String save(@RequestParam String name, @RequestParam String email, @RequestParam String messageText, HttpServletRequest request) {
        Message message = new Message(name, email, messageText);
        messageService.save(message);
        messageService.sendNewMessageNotification(3L); /*todo*/
        String referer = request.getHeader("referer");
        return "redirect:"+referer;
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        try {
            messageService.delete(id);
            return "redirect:/messages/all?deleted=true";
        } catch (Exception ConstraintViolationException) {
            return "redirect:/messages/all?error=true";
        }
    }


}
