package com.beskilled.util;

import com.beskilled.entity.User;
import com.beskilled.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;

@ControllerAdvice
public class MyGlobalControllerAdvice {
    @Autowired
    private UserRepository userRepo;

    @GetMapping(value = "user")
    public User getUserDetails(){
        Authentication auth= SecurityContextHolder.getContext().getAuthentication();
        User user=this.userRepo.findByUserName(auth.getName());
        return user;
    }
}
