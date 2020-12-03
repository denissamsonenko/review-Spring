package by.itacademy.project.dao;

import java.util.List;

import by.itacademy.project.entity.News;

public interface NewsDao {
	
	public List<News> getAllNews();
	
	public void saveNews(News theNews);
	
	public News getNews(int theId);
	
	public void deleteNews(int theId);
}
