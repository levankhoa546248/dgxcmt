/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangnhap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
@Controller
public class UserController {

    @Autowired
    UserDAO userDAO;
    @Autowired
    SessionFilter SessionFilter;

    @RequestMapping(value = "/dangnhap")
    public String dangnhap(ModelMap mm, HttpSession session) {
        if (SessionFilter.checkSession(session)) {
            //QTI 06/04/2018 them tham so don vi redirect ve trang thong bao start
            String dvtt = session.getAttribute("Sess_DVTT").toString();
            if(dvtt.substring(0,2).equals("45")){
                return "redirect:/qti_thongbao";
            }
            //QTI 06/04/2018 them tham so don vi redirect ve trang thong bao end
            return "redirect:/thongtinnhanvien";
        }
        mm.put("khanCap", userDAO.lay_thamsohethong_theoma("114114","114114"));
        return "dangnhap";
    }

    @RequestMapping(value = "/login_new")
    public ModelAndView login_new(ModelMap mm) {
        return new ModelAndView("login");
    }

    @RequestMapping(value = "/error")
    public ModelAndView error(ModelMap mm) {
        return new ModelAndView("error_page");
    }

    @RequestMapping(value = "/webcam")
    public ModelAndView webcam(ModelMap mm) {
        return new ModelAndView("webcam");
    }

}
