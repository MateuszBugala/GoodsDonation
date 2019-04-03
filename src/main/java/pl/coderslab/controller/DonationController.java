package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import pl.coderslab.model.Donation;
import pl.coderslab.service.CityService;
import pl.coderslab.service.DonationService;
import pl.coderslab.service.InstitutionService;

@Controller
@RequestMapping(path = "/donations", produces = "text/html; charset=UTF-8")
public class DonationController {

    @Autowired
    private DonationService donationService;

    @Autowired
    private CityService cityService;

    @Autowired
    private InstitutionService institutionService;

    @RequestMapping("/all")
    public String all(Model model) {
        model.addAttribute("donations", donationService.findAll());
        return "app/donations/all";
    }

    @PostMapping("/step-1")
    public String step1b(Model model) {
        return "redirect:/donations/step-2";
    }

    @GetMapping("/step-2")
    public String step2a(Model model) {
        return "app/donations/form2";
    }

    @PostMapping("/step-2")
    public String step2b(Model model) {
        return "redirect:/donations/step-3";
    }

    @GetMapping("/step-3")
    public String step3a(Model model) {
        return "app/donations/form3";
    }

    @PostMapping("/step-3")
    public String step3b(Model model) {
        return "redirect:/donations/step-4";
    }


}
