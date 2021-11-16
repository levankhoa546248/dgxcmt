package dongxe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class DongxeC {

    @Autowired
    DongxeD dongxe;

    @RequestMapping(value = "/dong-xe", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView trangChu(HttpSession session, ModelMap map) {
        if (session.getAttribute("SUCCESS") == null) {
            return new ModelAndView("dangnhap");
        } else {
            return new ModelAndView("dongxe/dongxe");
        }

    }

    @RequestMapping(value = "/danh-sach-dong-xe")
    public @ResponseBody
    List danhSachDongXe(HttpSession session) {
        String scode = session.getAttribute("SCODE").toString();
        List listDongXe = dongxe.danhSachDongXe(scode);
        return listDongXe;
    }
}
