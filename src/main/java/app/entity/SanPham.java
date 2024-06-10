package app.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "san_pham")
public class SanPham {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ma_san_pham")
    @NotBlank(message = "* Vui lòng nhập mã sản phẩm!")
    private String maSP;

    @Column(name = "ten_san_pham")
    @NotBlank(message = "* Vui lòng nhập tên sản phẩm!")
    private String tenSP;

    @Column(name = "gia_san_pham")
    @DecimalMin(value = "100.0", inclusive = false, message = "* Giá phải lớn hơn 100!")
    @DecimalMax(value = "1000000000.0", message = "* Giá không hợp lệ!")
    private BigDecimal giaSP;

    @Column(name = "trang_thai")
    @NotBlank(message = "* Vui lòng nhập trạng thái sản phẩm!")
    private String trangThaiSP;

    @Column(name = "ngay_tao")
    private Date ngayTaoSP;

    @Column(name = "ngay_sua")
    private Date ngaySuaSP;

    @Column(name = "hinh_anh")
    private String hinhAnh;

    @ManyToOne
    @JoinColumn(name = "id_danh_muc", nullable = false)
    private DanhMuc danhMuc;
}

