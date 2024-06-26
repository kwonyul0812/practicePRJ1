package com.practiceprj1.controller;

import com.practiceprj1.domain.Board;
import com.practiceprj1.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    public String add(Board board, Authentication authentication, RedirectAttributes rttr) {
        service.add(board, authentication);

        rttr.addAttribute("id", board.getId());
        return "redirect:/board";
    }

    @GetMapping("")
    public String home(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model) {
        model.addAllAttributes(service.list(page));

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
    public String modify(Board board, Authentication authentication, RedirectAttributes rttr) {
        if (service.hasAccess(board.getId(), authentication)) {
            service.update(board);
        }
        rttr.addAttribute("id", board.getId());

        return "redirect:/board";
    }

    @PostMapping("delete")
    public String delete(Integer id, Authentication authentication) {
        if (service.hasAccess(id, authentication)) {
            service.delete(id);
        }
        return "redirect:/";
    }
}
