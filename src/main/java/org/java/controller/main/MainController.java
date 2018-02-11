package org.java.controller.main;

import java.util.List;

import org.java.pojo.SongInfo;
import org.java.service.SongInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	private SongInfoService songInfoService;
	
	@RequestMapping(value="index",method=RequestMethod.GET)
	public String index(Model model) throws Exception{
		List<SongInfo> slist = songInfoService.getSongList();
		model.addAttribute("slist", slist);
		return "/jsp/main/index";
	}
	
}
