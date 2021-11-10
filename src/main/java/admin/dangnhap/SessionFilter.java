package admin.dangnhap;
import javax.servlet.http.HttpSession;

public class SessionFilter implements SessionFilterDAO {

    @Override
    public boolean checkSession(HttpSession session) {
        if(session.getAttribute("Sess_User")==null||session.getAttribute("Sess_User").equals("")){
            return false;
        }
        return true;
    }

    
}
