package com.codingdojo.vape3one.repositories;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.vape3one.models.User;

public interface UserRepository extends CrudRepository<User, Long> {
    User findByEmail(String email);
}
