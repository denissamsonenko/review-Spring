package by.itacademy.project.dao;

import by.itacademy.project.entity.User;

public interface UserDetailsDao {
	User findUserByUsername(String username);
}
