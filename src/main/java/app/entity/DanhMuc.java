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
@Table(name = "danh_muc")
public class DanhMuc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ma_danh_muc")
    @NotBlank(message = "* Vui lòng nhập mã danh mục!")
    private String maDanhMuc;

    @Column(name = "ten_danh_muc")
    @NotBlank(message = "* Vui lòng nhập tên sản phẩm!")
    private String tenDanhMuc;

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
