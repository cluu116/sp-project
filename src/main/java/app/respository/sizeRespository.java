package app.respository;

import app.entity.Size;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface sizeRespository extends JpaRepository<Size, Integer> {
    @Query("select s from Size s where s.id = :id")
    Size getById(@Param("id") Integer id);

    Size findById(int id);
}
