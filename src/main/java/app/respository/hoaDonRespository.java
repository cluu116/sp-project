package app.respository;

import app.entity.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface hoaDonRespository extends JpaRepository<HoaDon, Integer> {
    @Query("select hd from HoaDon hd where hd.id = :id")
    HoaDon getById(@Param("id") Integer id);
}
