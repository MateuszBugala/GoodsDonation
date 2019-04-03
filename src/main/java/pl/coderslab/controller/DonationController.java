package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("donation", new Donation());
        return "app/donations/add";
    }


}
