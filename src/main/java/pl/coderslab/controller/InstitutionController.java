package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import pl.coderslab.model.City;
import pl.coderslab.model.Institution;
import pl.coderslab.model.InstitutionType;
import pl.coderslab.service.CityService;
import pl.coderslab.service.InstitutionService;
import pl.coderslab.service.InstitutionTypeService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping(path = "/institutions", produces = "text/html; charset=UTF-8")
@SessionAttributes({"institutionTemp"})
public class InstitutionController {

    @Autowired
    private InstitutionService institutionService;

    @Autowired
    private InstitutionTypeService institutionTypeService;

    @Autowired
    private CityService cityService;

    @ModelAttribute("institutionTypes")
    public List<InstitutionType> getInstitutionTypes() {
        return institutionTypeService.findAll();
    }

    @ModelAttribute("cities")
    public List<City> getCities() {
        return cityService.findAll();
    }

    @RequestMapping("/all")
    public String all(Model model) {
        model.addAttribute("institutions", institutionService.findAll());
        return "app/institutions/all";
    }

    @GetMapping("/add")
    public String add(Model model, HttpSession session, SessionStatus status) {
        if (session.getAttribute("institutionTemp") == null) {
            model.addAttribute("institution", new Institution());
        } else {
            Institution institutionTemp = (Institution) session.getAttribute("institutionTemp");
            model.addAttribute("institution", institutionTemp);
            status.setComplete();
        }
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

    @GetMapping("/city")
    public String addCity(Model model, @RequestParam String name,
                          @RequestParam String mission,
                          @RequestParam Long type) {
        Institution institutionTemp = new Institution();
        institutionTemp.setName(name);
        institutionTemp.setMission(mission);
        institutionTemp.setInstitutionType(institutionTypeService.findOne(type));
        model.addAttribute("institutionTemp", institutionTemp);
        return "redirect:/institutions/add-city";
    }

    @GetMapping("/add-city")
    public String addCity(Model model) {
        model.addAttribute("city", new City());
        return "app/cities/add";
    }


    @PostMapping("/add-city")
    public String saveCity(@Valid City city, BindingResult result) {
        if (result.hasErrors()) {
            return "app/institutions/add-city";
        }
        cityService.save(city);
        return "redirect:/institutions/add";
    }

}
