package by.itacademy.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import by.itacademy.project.dao.NewsDao;
import by.itacademy.project.entity.News;

@Service
public class NewsServiceImpl implements NewsService{
	
	@Autowired
	private NewsDao newsDao;

	@Override
	@Transactional
	public List<News> getAllNews() {
		
		return newsDao.getAllNews();
	}

	@Override
	@Transactional
	public void saveNews(News theNews) {
		
		newsDao.saveNews(theNews);
	}

	@Override
	@Transactional
	public News getNews(int theId) {
		
		return newsDao.getNews(theId);
	}

	@Override
	@Transactional
	public void deleteNews(int theId) {
		newsDao.deleteNews(theId);
		
	}

}
