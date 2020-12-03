package by.itacademy.project.controller;

import java.time.LocalDate;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import by.itacademy.project.entity.News;
import by.itacademy.project.service.NewsService;

@Controller
@RequestMapping("/news")
public class NewsController {
	
	@Autowired
	private NewsService newsService;
	
	@RequestMapping("/list")
	public String listNews(Model theModel) {
		
		List<News> theNews = newsService.getAllNews();

		theModel.addAttribute("news", theNews);
		
		return "news-list";
	}
	
	@GetMapping("/create")
	public String showFormForSave(Model theModel) {
		
		News theNews = new News();
		
		theModel.addAttribute("news", theNews);
		
		return "news-save";
	}
	
	@RequestMapping("/update")
	public String showFormForUpdate(@RequestParam("newsId") int theId, Model theModel) {
	
		News theNews = newsService.getNews(theId);
		
		theModel.addAttribute("news", theNews);
		
		return "news-edit";
	}
		
	@GetMapping("/show")
	public String showNews(@RequestParam("newsId") int theId, Model theModel) {
		
		News theNews = newsService.getNews(theId);
		
		theModel.addAttribute("news", theNews);
		return "news-show";
	}
	
	@PostMapping("/save")
	public String saveNews(@ModelAttribute("news") @Valid News theNews, BindingResult bindingResult) {
		
		if(bindingResult.hasErrors()) {
			return "news-save";
		}
		
		theNews.setDate(LocalDate.now());
		newsService.saveNews(theNews);
		
		
		
		return "redirect:/news/list";
	}
	
	@PostMapping("/edit")
	public String editNews(@ModelAttribute("news") @Valid News theNews, BindingResult bindingResult) {
		
		if(bindingResult.hasErrors()) {
			return "news-edit";
		}
		
		theNews.setDate(LocalDate.now());
		newsService.saveNews(theNews);
		
		return "redirect:/news/list";
	}
	
	@RequestMapping("/delete")
	public String deleteNews(@RequestParam("newsId") int[] theId) {
		
		for (int id : theId) {
			newsService.deleteNews(id);
		}
				
		return "redirect:/news/list";
	}
}
