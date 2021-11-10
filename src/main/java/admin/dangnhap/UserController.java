package admin.dangnhap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
@Controller
public class UserController {

    @Autowired
    SessionFilter SessionFilter;

    @RequestMapping(value = "/dangnhap")
    public @ResponseBody
    String dangnhap(@RequestParam(value = "username") String username,
                    @RequestParam(value = "password") String password) {

        return "SUCCESS";
    }

    @RequestMapping(value = "/trangchu")
    public ModelAndView trangchu(HttpSession session) {
        return new ModelAndView("trangchu/trangchu");
    }
}
