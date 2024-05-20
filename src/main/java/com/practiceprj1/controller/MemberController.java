package com.practiceprj1.controller;

import com.practiceprj1.domain.Member;
import com.practiceprj1.service.MemberService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("member")
public class MemberController {
    private final MemberService service;

    @GetMapping("signup")
    public String signup() {

        return "member/signup";
    }

    @PostMapping("signup")
    public String signup(Member member) {

        System.out.println("member = " + member);
        service.signup(member);

        return "redirect:/member/signup";
    }

    @GetMapping("list")
    @PreAuthorize("hasAuthority('admin')")
    public String list(Model model) {
        List<Member> list = service.memberList();
        model.addAttribute("memberList", list);

        return "member/list";
    }

    @GetMapping("info")
    public String info(Integer id, Authentication authentication, Model model) {
        if (service.hasAccess(id, authentication) || service.isAdmin(authentication)) {
            Member member = service.selectById(id);
            model.addAttribute("member", member);
            return "member/info";
        }

        return "redirect:/";
    }

    @GetMapping("modify")
    public String modify(Integer id, Model model) {
        Member member = service.selectById(id);
        model.addAttribute("member", member);

        return "member/modify";
    }

    @PostMapping("modify")
    public String modify(Member member, Authentication authentication, RedirectAttributes rttr) {
        if (service.hasAccess(member.getId(), authentication)) {
            service.update(member);
            rttr.addAttribute("id", member.getId());
            return "redirect:/member/info";
        }

        return "redirect:/";

    }

    @GetMapping("delete")
    public String delete(Integer id, Authentication authentication) {
        if(service.hasAccess(id, authentication)) {
            service.delete(id);
        }
        return "redirect:/";
    }

    @GetMapping("login")
    public String login() {
        return "member/login";
    }

    @GetMapping("logout")
    public String logout(HttpServletRequest request) throws ServletException {
        request.logout();
        return "redirect:/";
    }
}
