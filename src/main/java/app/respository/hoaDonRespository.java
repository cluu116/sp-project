package app.respository;

import app.entity.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;

public interface hoaDonRespository extends JpaRepository<HoaDon, Integer> {
}
