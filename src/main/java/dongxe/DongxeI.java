package dongxe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.List;
import java.util.Map;

@Component
public class DongxeI implements DongxeD{


    @Autowired
    @Resource(name = "dataSourceMysql")
    DataSource dataSourceMysql;

    @Override
    public List danhSachDongXe(String scode) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSourceMysql);
        String query = "call DANH_SACH_DONG_XE(?)";
        List list = jdbcTemplate.queryForList(query, scode);
        return list;
    }
}
