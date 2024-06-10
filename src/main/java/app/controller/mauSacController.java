package app.controller;

import app.entity.MauSac;
import app.entity.Size;
import app.respository.mauSacRespository;
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
public class mauSacController {
    @Autowired
    mauSacRespository repo;

    @GetMapping("/mau-sac/form-add")
    public String formAdd() {
        return "mauSacs/formAdd";
    }

    @PostMapping("/mau-sac/add")
    public String add(@ModelAttribute("ms") MauSac mauSac, RedirectAttributes redirectAttributes) {
        mauSac.setNgayTao(new Date());
        mauSac.setNgaySua(new Date());
        if (mauSac.getTrangThai() == null) {
            mauSac.setTrangThai("Hoạt động");
        }
        repo.save(mauSac);
        redirectAttributes.addFlashAttribute("addMauSac", "Thêm mới thành công!");
        return "redirect:/admin?section=mauSac";
    }

    @GetMapping("/mau-sac/delete/{id}")
    public String delete(@PathVariable String id, RedirectAttributes redirectAttributes) {
        repo.deleteById(Integer.valueOf(id));
        redirectAttributes.addFlashAttribute("addMauSac", "Xóa thành công!");
        return "redirect:/admin?section=mauSac";
    }

    @GetMapping("/mau-sac/formUpdate/{id}")
    public String formUpdate(@PathVariable String id, Model model, HttpSession session) {
        MauSac ms = repo.getById(Integer.parseInt(id));
        session.setAttribute("idUpdateMauSac", id);
        model.addAttribute("MauSac", ms);
        return "mauSacs/formUpdate";
    }

    @PostMapping("/mau-sac/update")
    public String processUpdate(@ModelAttribute("ms") MauSac mauSac, RedirectAttributes redirectAttributes, HttpSession session) {
        Optional<MauSac> optionalSize = repo.findById(Integer.valueOf((String) session.getAttribute("idUpdateMauSac")));
        if (optionalSize.isPresent()) {
            MauSac mauSac1 = optionalSize.get();
            mauSac1.setMaMau(mauSac.getMaMau());
            mauSac1.setTenMau(mauSac.getTenMau());
            mauSac1.setTrangThai(mauSac.getTrangThai());
            mauSac1.setNgaySua(new Date());
            repo.save(mauSac1);
            session.removeAttribute("idUpdateMauSac");
            redirectAttributes.addFlashAttribute("addMauSac", "Cập nhật thông tin màu sắc thành công!");
            return"redirect:/admin?section=mauSac";
        }else{
            redirectAttributes.addFlashAttribute("addMauSac", "Không tìm thấy id màu sắc!");
            return"redirect:/admin?section=mauSac";
        }
    }

    @GetMapping("/mau-sac/detail/{id}")
    public String detail(@PathVariable String id, Model model, HttpSession session) {
        MauSac ms = repo.getById(Integer.parseInt(id));
        model.addAttribute("mauSac", ms);
        return "mauSacs/formDetail";
    }
}
