package app.controller;

import app.entity.CTSP;
import app.entity.HoaDon;
import app.respository.hoaDonRespository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
@Controller
public class hoaDonController {
    @Autowired
    hoaDonRespository repo;

    @GetMapping("/hd/delete/{id}")
    public String delete(@PathVariable String id, RedirectAttributes redirectAttributes) {
        repo.deleteById(Integer.valueOf(id));
        redirectAttributes.addFlashAttribute("addHD", "Xóa thành công!");
        return "redirect:/admin?section=hd";
    }

    @GetMapping("/hd/detail/{id}")
    public String detail(@PathVariable String id, Model model) {
        HoaDon s = repo.getById(Integer.parseInt(id));
        model.addAttribute("hd", s);
        return "hoaDon/formDetail";
    }
}
