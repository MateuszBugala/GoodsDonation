package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import pl.coderslab.config.security.CurrentUser;
import pl.coderslab.model.DonatedItem;
import pl.coderslab.model.Donation;
import pl.coderslab.model.Institution;
import pl.coderslab.service.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(path = "/donations", produces = "text/html; charset=UTF-8")
@SessionAttributes({"donationTemp", "selCity"})
public class DonationController {

    @Autowired
    private DonationService donationService;

    @Autowired
    private DonatedItemService donatedItemService;

    @Autowired
    private CityService cityService;

    @Autowired
    private InstitutionService institutionService;

    @RequestMapping("/all")
    public String all(Model model, String pickedUp) {
        if (pickedUp != null) {
            model.addAttribute("donations", donationService.findAllOrderByPickedUp(true));
            return "app/donations/all";
        } else {
            model.addAttribute("donations", donationService.findAll());
            return "app/donations/all";
        }
    }

    @RequestMapping("/my-donations")
    public String myDonations(@AuthenticationPrincipal CurrentUser currentUser, Model model) {
        Long userId = currentUser.getUser().getId();
        model.addAttribute("donations", donationService.findAllByUserId(userId));
        return "app/donations/all";
    }

    @PostMapping("/step-1")
    public String step1b(Model model, @RequestParam(name = "donatedItems[]") String[] selectedItems, HttpSession session) {
        Donation donation = (Donation) session.getAttribute("donationTemp");

        List<DonatedItem> donatedItems = new ArrayList<>();
        for (int i = 0; i < selectedItems.length ; i++) {
            System.out.println(selectedItems[i]);
            DonatedItem item = donatedItemService.findById(Long.parseLong(selectedItems[i]));
            donatedItems.add(item);
        }
        donation.setDonatedItems(donatedItems);

        model.addAttribute("donationTemp", donation);
        return "redirect:/donations/step-2";
    }

    @GetMapping("/step-2")
    public String step2a(Model model) {
        return "app/donations/form2";
    }

    @PostMapping("/step-2")
    public String step2b(Model model, @RequestParam int bagsQty, HttpSession session ) {
        Donation donation = (Donation) session.getAttribute("donationTemp");
        donation.setQty(bagsQty);
        model.addAttribute("donationTemp", donation);
        return "redirect:/donations/step-3";
    }

    @GetMapping("/step-3")
    public String step3a(Model model) {
        model.addAttribute("cities", cityService.findAll());
        return "app/donations/form3";
    }

    @PostMapping("/step-3")
    public String step3b(Model model, @RequestParam Long selCity) {
        model.addAttribute("selCity", selCity);
        return "redirect:/donations/step-4";
    }

    @GetMapping("/step-4")
    public String step4a(Model model, HttpSession session) {
        Long selCityId = (Long) session.getAttribute("selCity");
        List<Institution> chosenInstitutions;
        if (selCityId == 0) {
            chosenInstitutions =  institutionService.findAll();
        } else {
            chosenInstitutions =  institutionService.findAllByCityId(selCityId);
        }
        model.addAttribute("chosenInstitutions", chosenInstitutions);
        return "app/donations/form4";
    }

    @PostMapping("/step-4")
    public String step4b(Model model, @RequestParam Long selIntitution, HttpSession session) {
        Donation donation = (Donation) session.getAttribute("donationTemp");
        donation.setInstitution(institutionService.findById(selIntitution));
        model.addAttribute("donationTemp", donation);
        return "redirect:/donations/step-5";
    }

    @GetMapping("/step-5")
    public String step5a(Model model) {
        return "app/donations/form5";
    }

    @PostMapping("/step-5")
    public String step5b(Model model, @RequestParam String address,
                         @RequestParam String city,
                         @RequestParam String postcode,
                         @RequestParam String phone,
                         @RequestParam String data,
                         @RequestParam String time,
                         @RequestParam String remarks,
                         HttpSession session) {
        Donation donation = (Donation) session.getAttribute("donationTemp");
        donation.setPickUpstreet(address);
        donation.setPickUpcity(city);
        donation.setPickUpzip(postcode);
        donation.setPickUpphoneNumber(phone);
        donation.setPickUpDate(LocalDate.parse(data));
        donation.setPickUpTime(LocalTime.parse(time));
        donation.setPickUpRemarks(remarks);
        model.addAttribute("donationTemp", donation);
        return "redirect:/donations/step-6";
    }

    @GetMapping("/step-6")
    public String step6a(Model model) {
        return "app/donations/form6";
    }

    @PostMapping("/step-6")
    public String step6b(Model model,HttpSession session, SessionStatus status) {
        Donation donation = (Donation) session.getAttribute("donationTemp");
        donationService.save(donation);
        status.setComplete();
        return "redirect:/donations/step-7";
    }

    @RequestMapping("/step-7")
    public String step7(Model model) {
        return "app/donations/form7";
    }

    @RequestMapping("/details/{id}")
    public String details(@PathVariable Long id, Model model) {
        model.addAttribute("donation", donationService.findById(id));
        return "app/donations/details";
    }

    @GetMapping("/edit/{id}")
    public String update(@PathVariable Long id, Model model) {
        model.addAttribute("donation", donationService.findById(id));
        return "app/donations/edit";
    }


    @PostMapping("/edit")
    public String update(@Valid Donation donation, BindingResult result) {
        if (result.hasErrors()) {
            return "/donations/edit";
        }
        donationService.save(donation);
        return "redirect:/donations/all";
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        try {
            donationService.delete(id);
            return "redirect:/donations/all?deleted=true";
        } catch (Exception ConstraintViolationException) {
            return "redirect:/donations/all?error=true";
        }
    }

    @PostMapping("/picked-up")
    public String pickedUp(@RequestParam Long donationId,@RequestParam String data, Model model) {
        Donation donation = donationService.findById(donationId);
        donation.setPickedUp(true);
        donation.setActualPickUpDate(LocalDate.parse(data));
        donationService.update(donation);
        return "redirect:/donations/details/"+donationId;
    }

    @PostMapping("/received")
    public String received(@RequestParam Long donationId,@RequestParam String data, Model model) {
        Donation donation = donationService.findById(donationId);
        donation.setDonated(true);
        donation.setDonationDate(LocalDate.parse(data));
        donationService.update(donation);
        return "redirect:/donations/details/"+donationId;
    }



}
