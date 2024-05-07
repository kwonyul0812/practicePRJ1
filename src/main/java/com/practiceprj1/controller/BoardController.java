package com.practiceprj1.controller;

import com.practiceprj1.domain.Board;
import com.practiceprj1.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class BoardController {
    private final BoardService service;

    @GetMapping("add")
    public String add() {

        return "board/add";
    }

    @PostMapping("add")
    public String add(Board board) {
        service.add(board);

        return "redirect:/board/add";
    }

    @GetMapping("")
    public String home(Model model) {
        List<Board> list = service.boardList();
        model.addAttribute("boardList", list);

        return "board/home";
    }

    @GetMapping("board")
    public String view(Integer id, Model model) {
        Board board = service.selectById(id);
        model.addAttribute("board", board);

        return "board/view";
    }

    @GetMapping("modify")
    public String modify(Integer id, Model model) {
        Board board = service.selectById(id);
        model.addAttribute("board", board);

        return "board/modify";
    }

    @PostMapping("modify")
    public String modify(Board board, RedirectAttributes rttr) {
        service.update(board);
        rttr.addAttribute("id", board.getId());

        return "redirect:/board";
    }

    @PostMapping("delete")
    public String delete(Integer id) {
        service.delete(id);

        return "redirect:/";
    }
}
