package org.kangogo.controller;

import org.kangogo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("error", false); // Default no error
        model.addAttribute("successMessage", null);
        return "login";
    }

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("error", false); // Default no error
        model.addAttribute("successMessage", null);
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@RequestParam String username, @RequestParam String password, Model model) {
        try {
            if (userService.findByUsername(username).isPresent()) {
                model.addAttribute("error", true);
                model.addAttribute("errorMessage", "Username already exists. Please choose a different one.");
                return "register";
            }
            userService.registerUser(username, password);
            model.addAttribute("error", false);
            model.addAttribute("successMessage", "Registration successful! Please log in.");
            return "login";
        } catch (Exception e) {
            model.addAttribute("error", true);
            model.addAttribute("errorMessage", "An error occurred during registration. Please try again.");
            return "register";
        }
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String username, @RequestParam String password, Model model) {
        // Note: Actual authentication is handled by Spring Security
        model.addAttribute("error", false);
        model.addAttribute("successMessage", null);
        return "redirect:/"; // Redirect to home page (handled by Spring Security)
    }
}