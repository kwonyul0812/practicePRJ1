package com.practiceprj1.service;

import com.practiceprj1.domain.Member;
import com.practiceprj1.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberMapper mapper;

    public void signup(Member member) {
        mapper.insert(member);
    }

    public List<Member> memberList() {
        return mapper.memberList();
    }

    public Member selectById(Integer id) {
        return mapper.selectById(id);
    }

    public void update(Member member) {
        mapper.update(member);
    }

    public void delete(Integer id) {
        mapper.delete(id);
    }
}
