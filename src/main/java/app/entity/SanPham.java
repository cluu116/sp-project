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

    @Column(name = "trang_thai")
    @NotBlank(message = "* Vui lòng nhập trạng thái sản phẩm!")
    private String trangThaiSP;

    @Column(name = "ngay_tao")
    @NotNull(message = "* Vui lòng nhập ngày tạo!")
    private Date ngayTaoSP;

    @Column(name = "ngay_sua")
    @NotNull(message = "* Vui lòng nhập ngày sửa!")
    private Date ngaySuaSP;

    @ManyToOne
    @JoinColumn(name = "id_danh_muc", nullable = false)
    private DanhMuc danhMuc;
}

