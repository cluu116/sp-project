package app.controller;

import app.entity.DanhMuc;
import app.entity.KhachHang;
import app.entity.SanPham;
import app.entity.User;
import app.respository.danhMucRespository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.Objects;
import java.util.Optional;

@Controller
public class danhMucController {
    @Autowired
    danhMucRespository repo;

    @GetMapping("/danh-muc/form-add")
    public String formAdd() {
        return "danhMucs/formAdd";
    }

    @PostMapping("/danh-muc/add")
    public String add(@ModelAttribute("dm") DanhMuc danhMuc, RedirectAttributes redirectAttributes) {
        danhMuc.setNgayTao(new Date());
        danhMuc.setNgaySua(new Date());
        if (danhMuc.getTrangThai() == null) {
            danhMuc.setTrangThai("Hoạt động");
        }
        repo.save(danhMuc);
        redirectAttributes.addFlashAttribute("addDanhMuc", "Thêm mới thành công!");
        return "redirect:/admin?section=danhMuc";
    }

    @GetMapping("/danh-muc/delete/{id}")
    public String delete(@PathVariable String id, RedirectAttributes redirectAttributes) {
        repo.deleteById(Integer.valueOf(id));
        redirectAttributes.addFlashAttribute("addDanhMuc", "Xóa thành công!");
        return "redirect:/admin?section=danhMuc";
    }

    @GetMapping("/danh-muc/formUpdate/{id}")
    public String formUpdate(@PathVariable String id, Model model, HttpSession session) {
        DanhMuc dm = repo.getById(Integer.parseInt(id));
        session.setAttribute("idUpdateDM", id);
        model.addAttribute("danhMuc", dm);
        return "danhMucs/formUpdate";
    }

    @PostMapping("/danh-muc/update")
    public String processUpdate(@ModelAttribute("dm") DanhMuc danhMuc, RedirectAttributes redirectAttributes, HttpSession session) {
        Optional<DanhMuc> optionalKhachHang = repo.findById(Integer.valueOf((String) session.getAttribute("idUpdateDM")));
        if (optionalKhachHang.isPresent()) {
            DanhMuc danhMuc1 = optionalKhachHang.get();
            danhMuc1.setMaDanhMuc(danhMuc.getMaDanhMuc());
            danhMuc1.setTenDanhMuc(danhMuc.getTenDanhMuc());
            danhMuc1.setTrangThai(danhMuc.getTrangThai());
            danhMuc1.setNgaySua(new Date());
            repo.save(danhMuc1);
            session.removeAttribute("idUpdateDM");
            redirectAttributes.addFlashAttribute("addDanhMuc", "Cập nhật thông tin danh mục thành công!");
            return"redirect:/admin?section=danhMuc";
        }else{
            redirectAttributes.addFlashAttribute("addDanhMuc", "Không tìm thấy danh mục!");
            return"redirect:/admin?section=danhMuc";
        }
    }

    @GetMapping("/danh-muc/detail/{id}")
    public String detail(@PathVariable String id, Model model, HttpSession session) {
        DanhMuc dm = repo.getById(Integer.parseInt(id));
        session.setAttribute("idUpdateDM", id);
        model.addAttribute("danhMuc", dm);
        return "danhMucs/formDetail";
    }
}
