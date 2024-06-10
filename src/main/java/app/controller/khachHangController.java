package app.controller;

import app.entity.KhachHang;
import app.entity.SanPham;
import app.entity.User;
import app.respository.khachHangRespository;
import app.respository.userRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.Objects;
import java.util.Optional;

@Controller
public class khachHangController {
    @Autowired
    khachHangRespository repo;
    @Autowired
    userRepository usRepo;

    @GetMapping("/khach-hang/delete/{id}")
    public String delete(@PathVariable String id, RedirectAttributes redirectAttributes) {
        int khachHangId = Integer.parseInt(id);
        Optional<KhachHang> optionalKhachHang = repo.findById(khachHangId);

        if (optionalKhachHang.isPresent()) {
            KhachHang khachHang = optionalKhachHang.get();
            User user = usRepo.findByKhachHang(khachHang);
            if (user != null) {
                if(!user.getRole().equals("admin")){
                    usRepo.deleteById(user.getId());
                    repo.deleteById(khachHangId);
                    redirectAttributes.addFlashAttribute("delFail", "Xóa thành công!");
                    return "redirect:/admin?section=khachHang";
                } else {
                    redirectAttributes.addFlashAttribute("delFail", "Không thể xóa role admin!");
                }
            } else {
                redirectAttributes.addFlashAttribute("delFail", "Không tìm thấy người dùng!");
            }
        } else {
            redirectAttributes.addFlashAttribute("delFail", "Không tìm thấy khách hàng!");
        }
        return "redirect:/admin?section=khachHang";
    }


    @GetMapping("/khach-hang/formUpdate/{id}")
    String update(@PathVariable String id, Model model, HttpSession session) {
        Optional<KhachHang> khachHang = repo.findById(Integer.parseInt(id));
        session.setAttribute("idUpdateKhachHang", id);
        if (khachHang.isPresent()) {
            KhachHang khachHang1 = khachHang.get();
            User user = usRepo.findByKhachHang(khachHang1);
            if(user.getKhachHang().getId().equals(khachHang1.getId())){
                model.addAttribute("khachHangs", user);
            }
            return "khachHangs/formUpdate";
        } else {
            return "redirect:/admin?section=khachHang";
        }
    }
    @PostMapping("/khach-hang/update")
    public String processUpdate(@ModelAttribute("khachHang") User user, RedirectAttributes redirectAttributes, HttpSession session) {
            Optional<KhachHang> optionalKhachHang = repo.findById(Integer.valueOf((String) session.getAttribute("idUpdateKhachHang")));
            if (optionalKhachHang.isPresent()) {
                KhachHang khachHang = optionalKhachHang.get();
                User users = usRepo.findByKhachHang(khachHang);
                khachHang.setHoTen(user.getKhachHang().getHoTen());
                khachHang.setDiaChi(user.getKhachHang().getDiaChi());
                khachHang.setSdt(user.getKhachHang().getSdt());
                khachHang.setTrangThai(user.getKhachHang().getTrangThai());
                khachHang.setNgaySua(new Date());
                if(users.getKhachHang().getId().equals(khachHang.getId())){
                    users.setRole(user.getRole());
                    repo.save(khachHang);
                    usRepo.save(users);
                    session.removeAttribute("idUpdateKhachHang");
                    redirectAttributes.addFlashAttribute("errorMessage", "Cập nhật thông tin khách hàng thành công!");

                }
            } else {
                redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy khách hàng cần cập nhật!");
            }
        return "redirect:/admin?section=khachHang";
    }

    @GetMapping("/khach-hang/detail/{id}")
    String deatail(@PathVariable String id, Model model, HttpSession session) {
        Optional<KhachHang> khachHang = repo.findById(Integer.parseInt(id));
        session.setAttribute("idUpdateKhachHang", id);
        if (khachHang.isPresent()) {
            KhachHang khachHang1 = khachHang.get();
            User user = usRepo.findByKhachHang(khachHang1);
            if(user.getKhachHang().getId().equals(khachHang1.getId())){
                model.addAttribute("khachHangs", user);
            }
            return "khachHangs/formDetail";
        } else {
            return "redirect:/admin?section=khachHang";
        }
    }
}
