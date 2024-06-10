package app.controller;

import app.entity.*;
import app.respository.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;
import java.util.stream.Collectors;

@Controller
public class controller {
    @Autowired
    sanPhamRespository repo;
    @Autowired
    userRepository res;
    @Autowired
    danhMucRespository dmRes;
    @Autowired
    mauSacRespository msRes;
    @Autowired
    sizeRespository sizeRes;
    @Autowired
    khachHangRespository khRes;
    @Autowired
    HDCTRespository hdctRes;
    @Autowired
    CTSPRespository ctspRes;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/signup")
    public String signup() {
        return "signUp";
    }

    @PostMapping("/login")
    public String checklogin(HttpServletRequest req, HttpSession session, RedirectAttributes attributes) {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = res.findByUsernameAndPassword(username, password);

        if (user != null && user.getUsername().equals(username) && user.getPassword().equals(password)) {
            session.setAttribute("username", user.getKhachHang().getHoTen());
            session.setAttribute("idLogin", user.getKhachHang().getId());
            if (user.getRole().equals("admin")) {
                session.setAttribute("role", user.getRole());
                return "redirect:/admin";
            }
            return "redirect:/home";
        } else {
            attributes.addFlashAttribute("error", "Tài khoản hoặc mật khẩu không đúng");
            return "redirect:/login";
        }
    }

    @GetMapping("/admin")
    String PageAdmin(Model model, @RequestParam(name = "page", required = false, defaultValue = "0") Integer page) {
        Pageable pageable = PageRequest.of(page, 5);
        model.addAttribute("sanPhamList", repo.findAllByOrderByNgayTaoSPDesc(pageable));
        model.addAttribute("danhMucList", dmRes.findAll(pageable));
        model.addAttribute("khachHangList", khRes.findAll(pageable));
        model.addAttribute("userList", res.findAll());
        model.addAttribute("mauSacList", msRes.findAll(pageable));
        model.addAttribute("sizeList", sizeRes.findAll(pageable));
        return "admin";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest req, HttpSession session) {
        session = req.getSession(false);
        if (session != null) {
            session.removeAttribute("username");
            session.removeAttribute("idLogin");
            session.invalidate();
        }
        return "login";
    }

    public Page<SanPham> search(String key, Pageable pageable) {
        return repo.findByTenSPOrMaSP(key.toLowerCase(Locale.ROOT), pageable);
    }

    @GetMapping(value = {"/", "/home"})
    public String home(Model model,
                       @RequestParam(name = "key", required = false, defaultValue = "") String key,
                       @RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
                       @RequestParam(name = "sp", required = false) Integer sp,
                       RedirectAttributes redirectAttributes,
                       HttpSession session) {
        Pageable pageable = PageRequest.of(page, 8);
        Page<SanPham> sanPhamList;
        if (key.isEmpty()) {
            sanPhamList = repo.findAllByOrderByNgayTaoSPDesc(pageable);
        } else {
            sanPhamList = search(key, pageable);
        }
        model.addAttribute("sanPhamList", sanPhamList);
        model.addAttribute("MauSac", msRes.findAll());
        model.addAttribute("Size", sizeRes.findAll());
        List<HDCT> hdcts = new ArrayList<>();
        for (HDCT ct : hdctRes.findAll()) {
            if (ct.getHoaDon().getKhachHang().getId().equals(session.getAttribute("idLogin"))) {
                hdcts.add(ct);
                session.setAttribute("count", hdcts);
            }
        }
        if (sp != null) {
            Optional<SanPham> sanPhamOpt = repo.findById(sp);
            if (sanPhamOpt.isPresent()) {
                model.addAttribute("getOneSP", sanPhamOpt.get());
            } else {
                redirectAttributes.addFlashAttribute("error", "Lỗi!");
            }
        }
        return "index";
    }

    @GetMapping("/san-pham/delete/{id}")
    public String delete(@PathVariable String id, RedirectAttributes redirectAttributes) {
        repo.deleteById(Integer.valueOf(id));
        redirectAttributes.addFlashAttribute("themSuc", "Xóa thành công!");
        return "redirect:/admin?section=sanPham";
    }

    @GetMapping("/san-pham/form-add")
    public String formAdd(Model model) {
        model.addAttribute("listDanhMuc", dmRes.findAll());
        return "formAdd";
    }

    @PostMapping("/san-pham/add")
    public String add(@ModelAttribute("sp") SanPham sanPham, @RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {
        sanPham.setNgayTaoSP(new Date());
        sanPham.setNgaySuaSP(new Date());
        if (sanPham.getTrangThaiSP() == null) {
            sanPham.setTrangThaiSP("Còn hàng");
        }
        String fileName = StringUtils.cleanPath(Objects.requireNonNull(file.getOriginalFilename()));
        sanPham.setHinhAnh(fileName);
        repo.save(sanPham);
        redirectAttributes.addFlashAttribute("themSuc", "Thêm mới thành công!");
        return "redirect:/admin?section=sanPham";
    }

    @GetMapping("/san-pham/formUpdate/{id}")
    public String formUpdate(@PathVariable String id, Model model, HttpSession session) {
        SanPham sp = repo.findById(Integer.parseInt(id));
        session.setAttribute("idUpdate", id);
        model.addAttribute("sanPham", sp);
        model.addAttribute("listDanhMuc", dmRes.findAll());
        return "formUpdate";
    }

    @PostMapping("/san-pham/update")
    public String update(@ModelAttribute SanPham sanPham, HttpSession session, @RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {
        sanPham.setId(Integer.valueOf((String) session.getAttribute("idUpdate")));
        for (int i = 0; i < repo.count(); i++) {
            SanPham sp = repo.findAll().get(i);
            if (sp.getId().equals(sanPham.getId())) {
                sanPham.setNgayTaoSP(sp.getNgayTaoSP());
                sanPham.setNgaySuaSP(new Date());
                if (!file.isEmpty()) {
                    String fileName = StringUtils.cleanPath(Objects.requireNonNull(file.getOriginalFilename()));
                    sanPham.setHinhAnh(fileName);
                } else {
                    sanPham.setHinhAnh(sp.getHinhAnh());
                }
                repo.save(sanPham);
                session.removeAttribute("idUpdate");
                redirectAttributes.addFlashAttribute("themSuc", "Sửa thành công!");
                return "redirect:/admin?section=sanPham";
            }
        }
        return "redirect:/admin";
    }


    @GetMapping("/signUp")
    public String showSignUpForm(Model model) {
        model.addAttribute("ur", new User());
        return "signUp";
    }

    @PostMapping("/signUp")
    public String signUp(@ModelAttribute("ur") User user, RedirectAttributes redirectAttributes) {
        for (User existingUser : res.findAll()) {
            if (existingUser.getUsername().equals(user.getUsername())) {
                redirectAttributes.addFlashAttribute("error1", "Tên đăng nhập đã tồn tại!");
                return "redirect:/signUp";
            }
        }
        KhachHang khachHang = new KhachHang();
        khachHang.setNgayTao(new Date());
        khachHang.setNgaySua(new Date());
        khachHang.setTrangThai("Kích hoạt");
        khachHang.setHoTen(user.getKhachHang().getHoTen());
        khachHang.setDiaChi(user.getKhachHang().getDiaChi());
        khachHang.setSdt(user.getKhachHang().getSdt());
        khRes.save(khachHang);
        user.setKhachHang(khachHang);
        user.setRole("user");
        res.save(user);
        redirectAttributes.addFlashAttribute("UserSuccess", "Tạo tài khoản thành công, đăng nhập để tiếp tục!");

        return "redirect:/login";
    }

    @GetMapping("/gio-hang")
    String gioHang(Model model, HttpSession session) {
        List<HDCT> hdcts = new ArrayList<>();
        for (HDCT ct : hdctRes.findAll()) {
            if (ct.getHoaDon().getKhachHang().getId().equals(session.getAttribute("idLogin"))) {
                hdcts.add(ct);
                session.setAttribute("count", hdcts);
                model.addAttribute("products", hdcts);
            }
        }
        return "gioHang";
    }

    @GetMapping("/san-pham/detail/{id}")
    public String detail(@PathVariable String id, Model model, HttpSession session) {
        SanPham sp = repo.findById(Integer.parseInt(id));
        session.setAttribute("idUpdate", id);
        model.addAttribute("sanPham", sp);
        model.addAttribute("listDanhMuc", dmRes.findAll());
        return "formDetail";
    }
}
