package dangnhap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class DangnhapC {

    @Autowired
    DangnhapD dangnhapD;

    @RequestMapping(value = {"/", "/trang-chu"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView trangChu(HttpSession session, ModelMap map) {
        if (session.getAttribute("SUCCESS") == null) {
            return new ModelAndView("dangnhap");
        } else {
            return new ModelAndView("trangchu/trangchu");
        }

    }

    @RequestMapping(value = "/dang-nhap")
    public @ResponseBody
    String dangnhap(@RequestParam(value = "taikhoan") String taikhoan,
                    @RequestParam(value = "matkhau") String matkhau,
                    HttpSession session) {
        try {
            Map nhanvien = dangnhapD.dangnhap(taikhoan, matkhau, "1");
            session.setAttribute("SUCCESS", nhanvien.getOrDefault("success", ""));
            session.setAttribute("SCODE", nhanvien.getOrDefault("scode", ""));
            session.setAttribute("TAIKHOAN", nhanvien.getOrDefault("taikhoan", ""));
            session.setAttribute("HO", nhanvien.getOrDefault("ho", ""));
            session.setAttribute("TEN", nhanvien.getOrDefault("ten", ""));
            return "SUCCESS";
        } catch (Exception ex) {
            return "FAIL";
        }
    }

    @RequestMapping(value = {"/dang-xuat"}, method = RequestMethod.GET)
    public ModelAndView dangxuat(HttpSession session) {
        session.invalidate();
        return new ModelAndView("dangnhap");
    }

    @RequestMapping(value = {"/error-page"}, method = RequestMethod.GET)
    public ModelAndView errorpage(HttpSession session) {
        if (session.getAttribute("SUCCESS") == null) {
            return new ModelAndView("dangnhap");
        } else {
            return new ModelAndView("404");
        }
    }

}
