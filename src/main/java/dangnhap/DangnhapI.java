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
    @Resource(name = "dataSourceMysql")
    DataSource dataSourceMysql;

    @Override
    public Map dangnhap(String taikhoan, String matkhau, String scode) throws Exception {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSourceMysql);
        String query = "call DANG_NHAP(?,?,?)";
        Map nhanvien = jdbcTemplate.queryForMap(query, taikhoan, matkhau, scode);
        return nhanvien;
    }

    @Override
    public String dangky(String scode, String ho, String ten, String taikhoan, String matkhau) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSourceMysql);
        String query = "call DANG_KY(?,?,?,?,?)";
        String result = jdbcTemplate.queryForObject(query, new Object[]{scode, ho, ten, taikhoan, matkhau}, String.class);
        return result;
    }
}
