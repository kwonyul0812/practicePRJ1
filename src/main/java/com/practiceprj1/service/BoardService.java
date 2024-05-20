package com.practiceprj1.service;

import com.practiceprj1.domain.Board;
import com.practiceprj1.domain.CustomUser;
import com.practiceprj1.domain.Member;
import com.practiceprj1.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class BoardService {
    private final BoardMapper mapper;

    public void add(Board board, Authentication authentication) {
        Object principal = authentication.getPrincipal();
        if(principal instanceof CustomUser user) {
            board.setMemberId(user.getMember().getId());
            mapper.insert(board);
        }
    }

    public Map<String, Object> boardList(Integer page) {
        int numberOfBoard = mapper.countAll();
        int offset = (page - 1) * 10;
        int lastPageNumber = (numberOfBoard - 1) / 10 + 1;
        int endPageNumber = ((page - 1) / 10 + 1) * 10;
        int beginPageNumber = endPageNumber - 9;

        endPageNumber = Math.min(endPageNumber, lastPageNumber);

        int prevPageNumber = beginPageNumber - 10;
        int nextPageNumber = beginPageNumber + 10;

        return Map.of("boardList", mapper.boardList(offset),
                "pageInfo", Map.of(
                        "lastPageNumber", lastPageNumber,
                        "endPageNumber", endPageNumber,
                        "beginPageNumber", beginPageNumber,
                        "prevPageNumber", prevPageNumber,
                        "nextPageNumber", nextPageNumber,
                        "currentPage", page
                ));
    }

    public Board selectById(Integer id) {
        return mapper.selectById(id);
    }

    public void update(Board board) {
        mapper.update(board);
    }

    public void delete(Integer id) {
        mapper.delete(id);
    }

    public boolean hasAccess(Integer id, Authentication authentication) {
        if(authentication == null)  {
            return false;
        }

        Board board = mapper.selectById(id);

        Object principal = authentication.getPrincipal();
        if(principal instanceof CustomUser user) {
            Member member = user.getMember();
            return board.getMemberId().equals(member.getId());
        }

        return false;
    }
}
