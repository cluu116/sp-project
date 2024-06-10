package app.respository;

import app.entity.SanPham;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface sanPhamRespository extends JpaRepository<SanPham, Integer> {
    Page<SanPham> findAllByOrderByNgayTaoSPDesc(Pageable pageable);

    SanPham findById(int id);

    @Query("SELECT sp FROM SanPham sp WHERE LOWER(sp.tenSP) LIKE LOWER(CONCAT('%', :key, '%')) " +
            "OR LOWER(sp.maSP) LIKE LOWER(CONCAT('%', :key, '%')) " +
            "OR LOWER(sp.danhMuc.maDanhMuc) LIKE LOWER(CONCAT('%', :key, '%')) " +
            "OR LOWER(sp.trangThaiSP) LIKE LOWER(CONCAT('%', :key, '%'))")
    Page<SanPham> findByTenSPOrMaSP(@Param("key") String key, Pageable pageable);
}
