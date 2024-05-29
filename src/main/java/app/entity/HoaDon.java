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
@Table(name = "hoa_don")
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_khach_hang")
    @NotNull(message = "* Vui lòng chọn khách hàng!")
    private KhachHang khachHang;

    @Column(name = "trang_thai")
    @NotBlank(message = "* Vui lòng nhập trạng thái!")
    private String trangThai;

    @Column(name = "ngay_tao")
    @NotNull(message = "* Vui lòng nhập ngày tạo!")
    private Date ngayTao;

    @Column(name = "ngay_sua")
    @NotNull(message = "* Vui lòng nhập ngày sửa!")
    private Date ngaySua;

    @Column(name = "dia_chi")
    @NotBlank(message = "* Vui lòng nhập địa chỉ!")
    private String diaChi;

    @Column(name = "so_dien_thoai")
    @NotBlank(message = "* Vui lòng nhập số điện thoại!")
    private String soDienThoai;
}
