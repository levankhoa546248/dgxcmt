package dangnhap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
@Controller
public class UserController {

    @Autowired
    SessionFilter SessionFilter;

    @RequestMapping(value = "/dangnhap")
    public @ResponseBody
    String dangnhap(HttpSession session,
                    @RequestParam(value = "username") String username,
                    @RequestParam(value = "password") String password) {

        return "1";
    }

}
