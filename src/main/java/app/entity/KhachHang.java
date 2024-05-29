package app.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "khach_hang")
public class KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ho_ten")
    @NotBlank(message = "* Vui lòng nhập họ tên!")
    private String hoTen;

    @Column(name = "dia_chi")
    @NotBlank(message = "* Vui lòng nhập địa chỉ!")
    private String diaChi;

    @Column(name = "sdt")
    @NotBlank(message = "* Vui lòng nhập SDT!")
    private String sdt;

    @Column(name = "trang_thai")
    @NotBlank(message = "* Vui lòng nhập trạng thái!")
    private String trangThai;

    @Column(name = "ngay_tao")
    @NotNull(message = "* Vui lòng nhập ngày tạo!")
    private Date ngayTao;

    @Column(name = "ngay_sua")
    @NotNull(message = "* Vui lòng nhập ngày sửa!")
    private Date ngaySua;
}