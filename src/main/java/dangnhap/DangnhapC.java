package dangnhap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class DangnhapC {

    @Autowired
    DangnhapD dangnhapD;

    @RequestMapping(value = "/dangnhap")
    public @ResponseBody
    String dangnhap(@RequestParam(value = "taikhoan") String taikhoan,
                    @RequestParam(value = "matkhau") String matkhau,
                    HttpSession session) {
        Map nhanvien = dangnhapD.dangnhap(taikhoan, matkhau, "1");
        session.setAttribute("name","value");

        return "SUCCESS";
    }

    @RequestMapping(value = "/trangchu")
    public ModelAndView trangchu(HttpSession session) {
        return new ModelAndView("trangchu/trangchu");
    }
}
