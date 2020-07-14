package kr.co.softcampus.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softcampus.beans.HospitalData;
import kr.co.softcampus.beans.ManagerBean;
import kr.co.softcampus.service.Hospitalservice;

@Controller
public class HomeController {
	@Autowired
	private Hospitalservice hospitalservice;
	
	@Resource(name = "loginUserBean")
	private ManagerBean loginUserBean;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:/index";
	}
	@GetMapping("/index")
	public String index(@RequestParam(value = "fail", defaultValue = "false") boolean fail,
						@ModelAttribute("LoginManagerBean") ManagerBean LoginManagerBean,
						@ModelAttribute("writeHospitalData") HospitalData writeHospitalData,
						Model model) {	
		List<HospitalData> hospitaldata = hospitalservice.getallList();
		model.addAttribute("hospitaldata",hospitaldata);
		model.addAttribute("fail",fail);
		model.addAttribute("loginUserBean", loginUserBean);
		return "index";
	}
	@GetMapping("/login")
	public String login() {	
		
		return "/login";
	}
}

