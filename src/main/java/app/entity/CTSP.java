package app.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "ctsp")
public class CTSP {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_sp")
    @NotNull(message = "* Vui lòng chọn sản phẩm!")
    private SanPham sanPham;

    @ManyToOne
    @JoinColumn(name = "id_mau_sac")
    @NotNull(message = "* Vui lòng chọn màu sắc!")
    private MauSac mauSac;

    @ManyToOne
    @JoinColumn(name = "id_size")
    @NotNull(message = "* Vui lòng chọn kích cỡ!")
    private Size size;

    @Column(name = "gia_ban")
    private BigDecimal giaBan;

    @Column(name = "so_luong_ton")
    private Integer soLuongTon;

    @Column(name = "trang_thai")
    private String trangThai;

    @Column(name = "ngay_tao")
    private Date ngayTao;

    @Column(name = "ngay_sua")
    private Date ngaySua;
}
