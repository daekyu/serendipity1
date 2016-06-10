package kr.co.serendipity.social_login;

import javax.persistence.*;

@Entity
@Table(name = "user_accounts")
public class User extends BaseEntity<Long> {
 
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
 
    @Column(name = "email", length = 100, nullable = false, unique = true)
    private String email;
 
    @Column(name = "first_name", length = 100,nullable = false)
    private String firstName;
 
    @Column(name = "last_name", length = 100, nullable = false)
    private String lastName;
 
    @Column(name = "password", length = 255)
    private String password;
 
    @Enumerated(EnumType.STRING)
    @Column(name = "role", length = 20, nullable = false)
    private Role role;
 
    @Enumerated(EnumType.STRING)
    @Column(name = "sign_in_provider", length = 20)
    private SocialMediaService signInProvider;
 
    public User() {
 
    }
 
  //Getters and other methods are omitted for the sake of clarity.
}
