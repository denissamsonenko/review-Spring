package by.itacademy.project.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import by.itacademy.project.entity.News;

@Repository
public class NewsDaoImpl implements NewsDao{
	
	private static final String GET_ALL_NEWS = "from News order by date";
	private static final String DELETE_NEWS = "delete from News where id=:newsId";
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<News> getAllNews() {
		
		Session currenSession = sessionFactory.getCurrentSession();
		
		Query<News> theQuery = currenSession.createQuery(GET_ALL_NEWS, News.class );
		
		List<News> news = theQuery.getResultList();
		
		return news;
	}

	@Override
	public void saveNews(News theNews) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(theNews);
	}

	@Override
	public News getNews(int theId) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		News theNews = currentSession.get(News.class, theId);
		
		return theNews;
		
	}

	@Override
	public void deleteNews(int theId) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery(DELETE_NEWS);
		
		theQuery.setParameter("newsId", theId);
		
		theQuery.executeUpdate();
	}

}
