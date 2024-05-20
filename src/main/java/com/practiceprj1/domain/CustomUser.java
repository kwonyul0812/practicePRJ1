package com.practiceprj1.domain;


import lombok.Getter;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.List;

@Getter
public class CustomUser extends User {
    private Member member;

    public CustomUser(Member member) {
        super(member.getEmail(),
                member.getPassword(),
                member.getAuthority().stream()
                        .map(SimpleGrantedAuthority::new)
                        .toList());

        this.member = member;
    }
}
