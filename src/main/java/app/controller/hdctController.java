package app.controller;

import app.entity.HDCT;
import app.respository.CTSPRespository;
import app.respository.HDCTRespository;
import app.respository.hoaDonRespository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Controller
public class hdctController {
    @Autowired
    HDCTRespository repo;
    @Autowired
    CTSPRespository CTSPrepo;
    @Autowired
    hoaDonRespository hdRepo;

    @GetMapping("/hdct/delete/{id}")
    public String delete(@PathVariable String id, RedirectAttributes redirectAttributes) {
        Optional<HDCT> hdct = repo.findById(Integer.valueOf(id));
        if (hdct.isPresent()) {
            HDCT hdct1 = hdct.get();
        repo.delete(hdct1);
            hdRepo.delete(hdct1.getHoaDon());
            CTSPrepo.delete(hdct1.getCtsp());
            redirectAttributes.addFlashAttribute("addHDCT", "Xóa thành công!");
            return "redirect:/admin?section=hdct";
        }
        return "redirect:/admin?section=hdct";
    }

    @GetMapping("/hdct/detail/{id}")
    public String detail(@PathVariable String id, Model model) {
        HDCT s = repo.getById(Integer.parseInt(id));
        model.addAttribute("hdct", s);
        return "hdct/formDetail";
    }
}
