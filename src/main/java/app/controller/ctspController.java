package app.controller;

import app.entity.CTSP;
import app.entity.Size;
import app.respository.CTSPRespository;
import app.respository.sizeRespository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.Optional;

@Controller
public class ctspController {
    @Autowired
    CTSPRespository repo;

    @GetMapping("/ctsp/delete/{id}")
    public String delete(@PathVariable String id, RedirectAttributes redirectAttributes) {
        repo.deleteById(Integer.valueOf(id));
        redirectAttributes.addFlashAttribute("addCTSP", "Xóa thành công!");
        return "redirect:/admin?section=ctsp";
    }

    @GetMapping("/ctsp/detail/{id}")
    public String detail(@PathVariable String id, Model model) {
        CTSP s = repo.getById(Integer.parseInt(id));
        model.addAttribute("ctsp", s);
        return "ctsp/formDetail";
    }
}
