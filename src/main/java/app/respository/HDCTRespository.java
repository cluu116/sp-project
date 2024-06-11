package app.respository;

import app.entity.HDCT;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface HDCTRespository extends JpaRepository<HDCT, Integer> {
    @Query("select s from HDCT s where s.id = :id")
    HDCT getById(@Param("id") Integer id);
}
