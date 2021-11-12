create
    definer = sql6450517@`%` procedure DANG_NHAP(IN v_taikhoan varchar(50), IN v_matkhau varchar(50),
                                                 IN scode varchar(5))
BEGIN
    SELECT * FROM nhanvien WHERE taikhoan = v_taikhoan AND matkhau = v_matkhau AND scode = 1;
END;

