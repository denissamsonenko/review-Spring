package by.itacademy.project.controller;

import java.security.Principal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RegistrationController {
	
	@GetMapping("/")
	public String index (Model model, Principal principal) {

		model.addAttribute("message" ,"You are welcome " + principal.getName());
		
		return "index";
	}
	
	@GetMapping("/access-denied")
	public String showAccessDenied() {
		
		return "access-denied";
	}
}
