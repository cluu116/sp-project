package app.controller;

import app.entity.*;
import app.respository.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Optional;

@Controller
public class gioHangController {
    @Autowired
    khachHangRespository khRespo;
    @Autowired
    sanPhamRespository spRespo;
    @Autowired
    mauSacRespository msRespo;
    @Autowired
    sizeRespository sRespo;
    @Autowired
    HDCTRespository hdctRespo;
    @Autowired
    hoaDonRespository hdRespo;
    @Autowired
    CTSPRespository ctspRespo;

    @PostMapping("/add-to-cart")
    public String addToCart(@RequestParam("productId") Integer productId,
                            @RequestParam("idMau") Integer colorId,
                            @RequestParam("idSize") Integer sizeId,
                            @RequestParam("soLuong") int soLuong,
                            HttpSession session,
                            @ModelAttribute("hdct") HDCT hdct,
                            RedirectAttributes redirectAttributes) {
        Optional<KhachHang> khachHang = khRespo.findById((Integer) session.getAttribute("idLogin"));
        HoaDon hoaDon = new HoaDon();
        CTSP ctsp = new CTSP();
        if (khachHang.isPresent()) {
            hoaDon.setKhachHang(khachHang.get());
            hoaDon.setNgayTao(new Date());
            hoaDon.setNgaySua(new Date());
            hoaDon.setTrangThai("Chưa giao");
            hoaDon.setDiaChi(khachHang.get().getDiaChi());
            hoaDon.setSoDienThoai(khachHang.get().getSdt());
        }
        SanPham product = spRespo.findById(Integer.parseInt(String.valueOf(productId)));
        ctsp.setSanPham(product);
        ctsp.setMauSac(msRespo.findById(Integer.parseInt(String.valueOf(colorId))));
        ctsp.setSize(sRespo.findById(Integer.parseInt(String.valueOf(sizeId))));
        ctsp.setGiaBan(product.getGiaSP());
        ctsp.setSoLuongTon(null);
        ctsp.setTrangThai("Hoạt động");
        ctsp.setNgayTao(new Date());
        ctsp.setNgaySua(new Date());

        hdct.setHoaDon(hoaDon);
        hdct.setCtsp(ctsp);
        hdct.setSoLuongMua(soLuong);
        hdct.setGiaBan(product.getGiaSP());
        hdct.setTongTien(product.getGiaSP().multiply(BigDecimal.valueOf(soLuong)));
        hdct.setTrangThai("Chưa thanh toán");
        hdct.setNgayTao(new Date());
        hdct.setNgaySua(new Date());

        hdRespo.save(hoaDon);
        ctspRespo.save(ctsp);
        hdctRespo.save(hdct);
        redirectAttributes.addFlashAttribute("tb", "Thêm sản phẩm vào giỏ hàng thành công!");
        return "redirect:/home";
    }

    @GetMapping("/remove-from-cart/{id}")
    public String removeFromCart(@PathVariable("id") Integer id,
                                 RedirectAttributes redirectAttributes) {
        Optional<HDCT> optionalHDCT = hdctRespo.findById(id);
        if (optionalHDCT.isPresent()) {
            HDCT hdct = optionalHDCT.get();
            HoaDon hoaDon = hdct.getHoaDon();
            CTSP ctsp = hdct.getCtsp();
            hdctRespo.delete(hdct);
            hdRespo.delete(hoaDon);
            ctspRespo.delete(ctsp);
            redirectAttributes.addFlashAttribute("tb", "Xóa sản phẩm khỏi giỏ hàng thành công!");
        } else {
            redirectAttributes.addFlashAttribute("tb", "Không tìm thấy sản phẩm trong giỏ hàng!");
        }
        return "redirect:/home";
    }

}
