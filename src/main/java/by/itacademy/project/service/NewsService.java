package by.itacademy.project.service;

import java.util.List;

import by.itacademy.project.entity.News;

public interface NewsService {

	public List<News> getAllNews();
	
	public void saveNews(News theNews);
	
	public News getNews(int theId);
	
	public void deleteNews(int theId);
}
