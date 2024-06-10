package app.respository;

import app.entity.DanhMuc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface danhMucRespository extends JpaRepository<DanhMuc,Integer> {
    List<DanhMuc> findAll();

    @Query("select dm from DanhMuc dm where dm.id = :id")
    DanhMuc getById(@Param("id") Integer id);
}
