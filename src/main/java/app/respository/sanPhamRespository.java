package app.respository;

import app.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface sanPhamRespository extends JpaRepository<SanPham, Integer> {
    List<SanPham> findAll();

    SanPham findById(int id);
}
