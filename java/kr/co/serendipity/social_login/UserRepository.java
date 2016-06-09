package kr.co.serendipity.social_login;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
 
    public User findByEmail(String email);
}