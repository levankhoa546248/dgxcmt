/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangnhap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.List;
import java.util.Map;

/**
 * @author Tuan
 */
public class UserDAOImp implements UserDAO {

    @Autowired
    @Resource(name = "dataSourceFW")
    DataSource dataSourceFW;
    @Autowired
    @Resource(name = "dataSourceMNG")
    DataSource dataSourceMNG;

    //DataSource dataSourceFW_config=ConfigDataSource.setDataSourceFW();
    @Override
    public List dangnhap(UserObj user) {
        String sql = "call DANGNHAP_F(?,?)#c,s,s";
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSourceFW);
        return jdbcTemplate.queryForList(sql, new Object[]{user.getTendangnhap(), user.getMatkhau()});
    }

    @Override
    public String lay_thamsohethong_theoma(String dvtt, String ma) {
        try {
            String sql = "call DM_SELECT_TSHT_THEOMA(?,?)#s,s,l";
            JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSourceFW);
            return jdbcTemplate.queryForObject(sql, new Object[]{dvtt, ma}, String.class);
        } catch (DataAccessException e) {
            return "0";
        }
    }

}
