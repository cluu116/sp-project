package app.respository;

import app.entity.KhachHang;
import app.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface userRepository extends JpaRepository<User,Integer> {
    User findByUsername(String username);

    User findByUsernameAndPassword(String username, String password);

    User findByKhachHang(KhachHang khachHang);
}
