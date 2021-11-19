package hangxe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.List;

@Component
public class HangxeI implements HangxeD {


    @Autowired
    @Resource(name = "dataSourceMysql")
    DataSource dataSourceMysql;

    @Override
    public List danhSachHangXe(String scode) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSourceMysql);
        String query = "call DANH_SACH_HANG_XE(?)";
        List list = jdbcTemplate.queryForList(query, scode);
        return list;
    }
}
