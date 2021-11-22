package dangnhap;

import java.util.Map;

public interface DangnhapD {
    Map dangnhap(String taikhoan, String matkhau, String scode) throws Exception;

    String dangky(String scode, String ho, String ten, String taikhoan, String matkhau);
}
