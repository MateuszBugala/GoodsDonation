package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.Institution;
import pl.coderslab.service.InstitutionService;

import javax.validation.Valid;

@Controller
@RequestMapping(path = "/institutions", produces = "text/html; charset=UTF-8")
public class InstitutionController {

    @Autowired
    private InstitutionService institutionService;

    @RequestMapping("/all")
    public String all(Model model) {
        model.addAttribute("institutions", institutionService.findAll());
        return "app/institutions/all";
    }


    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("institution", new Institution());
        return "app/institutions/add";
    }


    @PostMapping("/add")
    public String save(@Valid Institution institution, BindingResult result) {
        if (result.hasErrors()) {
            return "/institutions/add";
        }
        institutionService.save(institution);
        return "redirect:/institutions/all";
    }

    @GetMapping("/edit/{id}")
    public String update(@PathVariable Long id, Model model) {
        model.addAttribute("institution", institutionService.findById(id));
        return "app/institutions/edit";
    }


    @PostMapping("/edit")
    public String update(@Valid Institution institution, BindingResult result) {
        if (result.hasErrors()) {
            return "/institutions/edit";
        }
        institutionService.save(institution);
        return "redirect:/institutions/all";
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        try {
            institutionService.delete(id);
            return "redirect:/institutions/all?deleted=true";
        } catch (Exception ConstraintViolationException) {
            return "redirect:/institutions/all?error=true";
        }
    }

}
