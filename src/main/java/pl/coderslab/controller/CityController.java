package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.City;
import pl.coderslab.service.CityService;

import javax.validation.Valid;

@Controller
@RequestMapping(path = "/cities", produces = "text/html; charset=UTF-8")
public class CityController {

    @Autowired
    private CityService cityService;

    @RequestMapping("/all")
    public String all(Model model) {
        model.addAttribute("cities", cityService.findAll());
        return "app/cities/all";
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("city", new City());
        return "app/cities/add";
    }


    @PostMapping("/add")
    public String save(@Valid City city, BindingResult result) {
        if (result.hasErrors()) {
            return "/cities/add";
        }
        cityService.save(city);
        return "redirect:/cities/all";
    }

    @GetMapping("/edit/{id}")
    public String update(@PathVariable Long id, Model model) {
        model.addAttribute("city", cityService.findById(id));
        return "app/cities/edit";
    }


    @PostMapping("/edit")
    public String update(@Valid City city, BindingResult result) {
        if (result.hasErrors()) {
            return "/cities/edit";
        }
        cityService.save(city);
        return "redirect:/cities/all";
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        try {
            cityService.delete(id);
            return "redirect:/cities/all?deleted=true";
        } catch (Exception ConstraintViolationException) {
            return "redirect:/cities/all?error=true";
        }
    }
}
