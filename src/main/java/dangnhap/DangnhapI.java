package dangnhap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.Map;

@Component
public class DangnhapI implements DangnhapD {

    @Autowired
    @Resource(name = "dataSource")
    DataSource dataSource;

    @Override
    public Map dangnhap(String taikhoan, String matkhau, String scode) throws Exception {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        String query = "call DANG_NHAP(?,?,?)";
        Map nhanvien = jdbcTemplate.queryForMap(query, taikhoan, matkhau, scode);
        return nhanvien;
    }
}
