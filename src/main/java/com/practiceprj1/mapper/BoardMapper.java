package com.practiceprj1.mapper;

import com.practiceprj1.domain.Board;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BoardMapper {

    @Insert("""
            INSERT INTO board
            (title, content, writer)
            VALUES (#{title}, #{content}, #{writer})
            """)
    void insert(Board board);


    @Select("""
            SELECT *
            FROM board
            ORDER BY id DESC
            LIMIT #{offset}, 10
            """)
    List<Board> boardList(int offset);


    @Select("""
            SELECT *
            FROM board
            WHERE id = #{id}
            """)
    Board selectById(Integer id);


    @Update("""
            UPDATE board
            SET title = #{title},
                content = #{content},
                writer = #{writer},
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
            FROM board;
            """)
    int countAll();
}
