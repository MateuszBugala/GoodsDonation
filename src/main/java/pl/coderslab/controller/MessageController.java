package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.model.Message;
import pl.coderslab.service.MessageService;

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

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("message", new Message());
        return "app/messages/add";
    }


    @PostMapping("/add")
    public String save(@Valid Message message, BindingResult result) {
        if (result.hasErrors()) {
            return "/messages/add";
        }
        messageService.save(message);
        return "redirect:/messages/all";
    }

    @GetMapping("/edit/{id}")
    public String update(@PathVariable Long id, Model model) {
        model.addAttribute("message", messageService.findById(id));
        return "app/messages/edit";
    }


    @PostMapping("/edit")
    public String update(@Valid Message message, BindingResult result) {
        if (result.hasErrors()) {
            return "/messages/edit";
        }
        messageService.save(message);
        return "redirect:/messages/all";
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
