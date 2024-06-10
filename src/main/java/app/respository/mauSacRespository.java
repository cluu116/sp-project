package app.respository;

import app.entity.MauSac;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface mauSacRespository extends JpaRepository<MauSac, Integer> {
    @Query("select ms from MauSac ms where ms.id = :id")
    MauSac getById(@Param("id") Integer id);

    MauSac findById(int id);
}
