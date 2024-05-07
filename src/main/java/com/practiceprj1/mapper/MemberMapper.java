package com.practiceprj1.mapper;

import com.practiceprj1.domain.Member;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface MemberMapper {

@Insert("""
        INSERT INTO member
        (email, password, nick_name)
        VALUES (#{email}, #{password}, #{nickName})
        """)
    int insert(Member member);

@Select("""
        SELECT *
        FROM member
        ORDER BY id DESC;
        """)
    List<Member> memberList();

@Select("""
        SELECT *
        FROM member
        WHERE id = #{id}
        """)
    Member selectById(Integer id);


@Update("""
        UPDATE member
        SET email = #{email},
            password = #{password},
            nick_name = #{nickName}
        WHERE id = #{id}
        """)
    int update(Member member);


@Delete("""
        DELETE
        FROM member
        WHERE id = #{id}
        """)
    int delete(Integer id);
}
