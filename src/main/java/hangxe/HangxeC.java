package hangxe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HangxeC {

    @Autowired
    HangxeD hangxe;

    @RequestMapping(value = "/hang-xe", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView hangXe(HttpSession session, ModelMap map) {
        if (session.getAttribute("SUCCESS") == null) {
            return new ModelAndView("dangnhap");
        } else {
            return new ModelAndView("hangxe/hangxe");
        }

    }

    @RequestMapping(value = "/danh-sach-hang-xe", produces = "application/json; charset=utf-8")
    public @ResponseBody
    List danhSachHangXe(HttpSession session) {
        String scode = session.getAttribute("SCODE").toString();
        List listHangXe = hangxe.danhSachHangXe(scode);
        return listHangXe;
    }

}
