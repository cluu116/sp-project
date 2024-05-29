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
@Table(name = "hdct")
public class HDCT {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_hoa_don")
    @NotNull(message = "* Vui lòng chọn hóa đơn!")
    private HoaDon hoaDon;

    @ManyToOne
    @JoinColumn(name = "id_ctsp")
    @NotNull(message = "* Vui lòng chọn chi tiết sản phẩm!")
    private CTSP ctsp;

    @Column(name = "so_luong_mua")
    private Integer soLuongMua;

    @Column(name = "gia_ban")
    private BigDecimal giaBan;

    @Column(name = "tong_tien")
    private BigDecimal tongTien;

    @Column(name = "trang_thai")
    private String trangThai;

    @Column(name = "ngay_tao")
    private Date ngayTao;

    @Column(name = "ngay_sua")
    private Date ngaySua;
}
