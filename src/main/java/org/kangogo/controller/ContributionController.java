package org.kangogo.controller;

import org.kangogo.model.Contribution;
import org.kangogo.service.ContributionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ContributionController {
    @Autowired
    private ContributionService contributionService;

    @GetMapping("/")
    public String viewHomePage(Model model) {
        model.addAttribute("contributions", contributionService.getAllContributions());
        return "index";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("contribution", new Contribution());
        return "add-contribution";
    }

    @PostMapping("/save")
    public String saveContribution(@ModelAttribute("contribution") Contribution contribution) {
        contributionService.saveContribution(contribution);
        return "redirect:/";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("contribution", contributionService.getContributionById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid contribution ID: " + id)));
        return "edit-contribution";
    }

    @PostMapping("/update")
    public String updateContribution(@ModelAttribute("contribution") Contribution contribution) {
        contributionService.saveContribution(contribution);
        return "redirect:/";
    }

    @GetMapping("/delete/{id}")
    public String deleteContribution(@PathVariable Long id) {
        contributionService.deleteContribution(id);
        return "redirect:/";
    }
}