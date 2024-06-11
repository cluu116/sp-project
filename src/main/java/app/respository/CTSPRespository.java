package app.respository;

import app.entity.CTSP;
import app.entity.Size;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CTSPRespository extends JpaRepository<CTSP, Integer> {
    @Query("select s from CTSP s where s.id = :id")
    CTSP getById(@Param("id") Integer id);
}
