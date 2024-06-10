package app.controller;

import app.entity.Size;
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
public class kichCoController {
    @Autowired
    sizeRespository repo;

    @GetMapping("/size/form-add")
    public String formAdd() {
        return "kichCos/formAdd";
    }

    @PostMapping("/size/add")
    public String add(@ModelAttribute("s") Size size, RedirectAttributes redirectAttributes) {
        size.setNgayTao(new Date());
        size.setNgaySua(new Date());
        if (size.getTrangThai() == null) {
            size.setTrangThai("Hoạt động");
        }
        repo.save(size);
        redirectAttributes.addFlashAttribute("addSize", "Thêm mới thành công!");
        return "redirect:/admin?section=kichCo";
    }

    @GetMapping("/size/delete/{id}")
    public String delete(@PathVariable String id, RedirectAttributes redirectAttributes) {
        repo.deleteById(Integer.valueOf(id));
        redirectAttributes.addFlashAttribute("addSize", "Xóa thành công!");
        return "redirect:/admin?section=kichCo";
    }

    @GetMapping("/size/formUpdate/{id}")
    public String formUpdate(@PathVariable String id, Model model, HttpSession session) {
        Size s = repo.getById(Integer.parseInt(id));
        session.setAttribute("idUpdateSize", id);
        model.addAttribute("Size", s);
        return "kichCos/formUpdate";
    }

    @PostMapping("/size/update")
    public String processUpdate(@ModelAttribute("s") Size size, RedirectAttributes redirectAttributes, HttpSession session) {
        Optional<Size> optionalSize = repo.findById(Integer.valueOf((String) session.getAttribute("idUpdateSize")));
        if (optionalSize.isPresent()) {
            Size size1 = optionalSize.get();
            size1.setMaSize(size.getMaSize());
            size1.setTenSize(size.getTenSize());
            size1.setTrangThai(size.getTrangThai());
            size1.setNgaySua(new Date());
            repo.save(size1);
            session.removeAttribute("idUpdateSize");
            redirectAttributes.addFlashAttribute("addSize", "Cập nhật thông tin kích cỡ thành công!");
            return"redirect:/admin?section=kichCo";
        }else{
            redirectAttributes.addFlashAttribute("addSize", "Không tìm thấy id kích cỡ!");
            return"redirect:/admin?section=kichCo";
        }
    }

    @GetMapping("/size/detail/{id}")
    public String detail(@PathVariable String id, Model model, HttpSession session) {
        Size s = repo.getById(Integer.parseInt(id));
        model.addAttribute("size", s);
        return "kichCos/formDetail";
    }
}
