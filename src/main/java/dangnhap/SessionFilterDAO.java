package dangnhap;

import javax.servlet.http.HttpSession;

public interface SessionFilterDAO {
    public boolean checkSession(HttpSession session);
}
