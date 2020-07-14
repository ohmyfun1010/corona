package kr.co.softcampus.controller;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softcampus.beans.HospitalData;
import kr.co.softcampus.beans.ManagerBean;
import kr.co.softcampus.mapper.Hospitalmapper;
import kr.co.softcampus.service.Hospitalservice;

@Controller
public class DataController {
	
	@Autowired
	private Hospitalservice hospitalservice;
	
	@Resource(name = "loginUserBean")
	private ManagerBean loginUserBean;
	
	@Autowired
	private Hospitalmapper hospitalmapper;
	  
	  @PostMapping("/write_pro") public String
	  write_pro(@ModelAttribute("writeHospitalData")HospitalData writeHospitalData,
	  Model model) {
	  
	  hospitalservice.HospitalData(writeHospitalData);
	  model.addAttribute("loginUserBean", loginUserBean);
	  return "redirect:/index";
	  }
	 
	
	@PostMapping("/login_pro")
	public String write_pro(@ModelAttribute("LoginManagerBean") ManagerBean LoginManagerBean,
							Model model) {

		
		  hospitalservice.getdata(LoginManagerBean);

		if (loginUserBean.isLogin_check() == true) {
			
			return "redirect:/index";
		} else {
			System.out.println("로그인 실패");
			return "login_fail";
		}	 
		
	}
	@GetMapping("/drop")
	public String drop()
	{
		loginUserBean.setLogin_check(false);
		return "redirect:/index";
	}
	@GetMapping("/mapview")
	public String mapview(@RequestParam("search") String search,
						@ModelAttribute("updateHospitalData")HospitalData updateHospitalData,						
							Model model) {
		model.addAttribute("loginUserBean", loginUserBean);
		model.addAttribute("updateHospitalData", updateHospitalData);
		model.addAttribute("search",search);
		
		
		return "mapview";
	}

	/*
	 * @GetMapping("/delete_pro") public String delete_pro(@RequestParam("search")
	 * String search) { System.out.println(search); return "forward:/delete_check";
	 * }
	 * 
	 * @GetMapping("/delete_check") public String
	 * delete_check(@RequestParam("search") String search) {
	 * System.out.println(search); return "delete_check"; }
	 */
	@GetMapping("/real_delete")
	public String real_delete(@RequestParam("search") String search) {
		hospitalservice.deletedata(search);
		System.out.println(search);
		return "redirect:/index";
	}
	@GetMapping("/update")
	public String uupdate(@RequestParam("search") String search,
							@ModelAttribute("updateHospitalData")HospitalData updateHospitalData,
			  				Model model)
	{
		
			
		 HospitalData temp = hospitalservice.gethospitaldata(search);
		
		  updateHospitalData.setDates(temp.getDates());
		  updateHospitalData.setPossible(temp.getPossible());
		  updateHospitalData.setCity(temp.getCity());
		  updateHospitalData.setTownship(temp.getTownship());
		  updateHospitalData.setHospitalname(temp.getHospitalname());
		  updateHospitalData.setAddress(temp.getAddress());
		  updateHospitalData.setTel(temp.getTel());
		 

		 model.addAttribute("updateHospitalData",updateHospitalData);
		model.addAttribute("search", search);
		return "update";
	}
	@PostMapping("/update_pro")
	public String update_pro(@RequestParam("search") String search,
			@ModelAttribute("updateHospitalData")HospitalData updateHospitalData) 
	{
		
		updateHospitalData.setNotchangehospitalname(search);
		hospitalmapper.updatedata(updateHospitalData);
		return "update_success";
	}
	@GetMapping("/update_success")
	public String update_success()
	{
		return "update_success";
	}
	@GetMapping("/citysearch")
	public String citysearch() 
	{
		return "citysearch";
	}
	@GetMapping("/citysearch_pro")
	public String citysearch_pro(@RequestParam("city") String city,
								Model model) 
	{
		List<HospitalData> h = hospitalservice.getList(city);
		model.addAttribute("h", h);
		model.addAttribute("city",city);
		return "citysearch";
	}
	@GetMapping("/search")
	public String search(@RequestParam("search") String search,
						@RequestParam("city") String city,
						Model model)
	{
		List<HospitalData> h = hospitalservice.getList(city);
		model.addAttribute("h", h);
		model.addAttribute("search", search);
		return "forward:/citysearch_pro";
	}
}
