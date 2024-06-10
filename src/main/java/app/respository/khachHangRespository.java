package app.respository;

import app.entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface khachHangRespository extends JpaRepository<KhachHang, Integer> {
    Optional<KhachHang> findById(Integer id);
}
