package app.controller;

import app.entity.SanPham;
import app.respository.sanPhamRespository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@Controller
public class controller {
    @Autowired
    sanPhamRespository repo;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    public List<SanPham> search(String key) {
        if (key == null || key.isEmpty()) {
            return repo.findAll();
        }
        String lowercaseKey = key.toLowerCase(Locale.ROOT);
        return repo.findAll().stream()
                .filter(sp -> sp.getTenSP().toLowerCase(Locale.ROOT).contains(lowercaseKey)
                        || sp.getMaSP().toLowerCase(Locale.ROOT).contains(lowercaseKey)
                        || sp.getDanhMuc().getMaDanhMuc().toLowerCase(Locale.ROOT).contains(lowercaseKey)
                        || sp.getTrangThaiSP().toLowerCase(Locale.ROOT).contains(lowercaseKey))
                .collect(Collectors.toList());
    }

    @GetMapping("/home")
    public String home(Model model, HttpServletRequest req) {
        String key = req.getParameter("key");
        List<SanPham> sanPhamList;
        if (key == null || key.isEmpty()) {
            sanPhamList = repo.findAll();
        } else {
            sanPhamList = search(key);
        }
        model.addAttribute("sanPhamList", sanPhamList);
        return "index";
    }
}
