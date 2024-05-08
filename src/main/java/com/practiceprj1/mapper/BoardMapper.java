package com.practiceprj1.mapper;

import com.practiceprj1.domain.Board;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BoardMapper {

    @Insert("""
            INSERT INTO board
            (title, content, member_Id)
            VALUES (#{title}, #{content}, #{memberId})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(Board board);


    @Select("""
            SELECT *
            FROM board
            ORDER BY id DESC;
            """)
    List<Board> boardList();


    @Select("""
            SELECT b.id,
                   b.title,
                   b.content,
                   b.inserted,
                   m.nick_name writer,
                   m.id member_id
            FROM board b JOIN member m ON b.member_id = m.id
            WHERE b.id = #{id}
            """)
    Board selectById(Integer id);


    @Update("""
            UPDATE board
            SET title = #{title},
                content = #{content},
                inserted = NOW()
            WHERE id = #{id}
            """)
    int update(Board board);


    @Delete("""
            DELETE
            FROM board
            WHERE id = #{id}
            """)
    int delete(Integer id);


    @Select("""
            SELECT COUNT(*)
            FROM board
            """)
    int countAll();


    @Select("""
            SELECT b.id,
                   b.title,
                   m.nick_name writer,
                   b.inserted
            FROM board b JOIN member m ON b.member_id = m.id
            ORDER BY id DESC
            LIMIT #{offset}, 10
            """)
    List<Board> selectAllByPage(int offset);

    @Delete("""
            DELETE
            FROM board
            WHERE member_id = #{id}
            """)
    int deleteBoardByMemberId(Integer id);
}
