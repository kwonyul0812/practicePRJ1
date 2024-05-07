package com.practiceprj1.service;

import com.practiceprj1.domain.Board;
import com.practiceprj1.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BoardService {
    private final BoardMapper mapper;

    public void add(Board board) {
        mapper.insert(board);
    }

    public List<Board> boardList() {
        return mapper.boardList();
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

    public Map<String, Object> list(Integer page) {
        int offset = (page-1) * 10;
        int numberOfBoard = mapper.countAll();
        int lastPageNumber = (numberOfBoard - 1) / 10 + 1;
        int endPageNumber = ((page - 1) / 10 + 1) * 10;
        int beginPageNumber = endPageNumber - 9;

        endPageNumber = Math.min(endPageNumber, lastPageNumber);

        int prevPageNumber = beginPageNumber - 10;
        int nextPageNumber = beginPageNumber + 10;

        return null;
    }
}
