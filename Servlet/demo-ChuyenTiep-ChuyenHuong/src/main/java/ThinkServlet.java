import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ThinkServlet", urlPatterns = "/think")
public class ThinkServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String think = req.getParameter("think");
        req.setAttribute("think", think);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/show.jsp");
        dispatcher.forward(req, resp);
//        dispatcher.include(req,resp);

//        resp.sendRedirect("/show.jsp");
    }
}

//    Chuyển tiếp (Forward): Khi một yêu cầu (request) của trình duyệt gửi
//        tới một Servlet, nó có thể chuyển tiếp yêu cầu tới một trang khác
//        (hoặc một servlet khác).
//        Địa chỉ trên trình duyệt của người dùng vẫn là đường dẫn của trang đầu tiên,
//        nhưng nội dung của trang do trang được chuyển tiếp tới tạo ra.

//    Include().
//        - Phương thức này được dùng để lấy nội dung của một trang khác và chèn vào trong servlet hiện thời

//    Chuyển hướng (Redirect): Khi một yêu cầu (request) từ phía người dùng
// tới một Servlet (Trang A), servlet này có thể chuyển yêu cầu này tới một trang khác (Trang B),
// và kết thúc nhiệm vụ của nó.
// Trang được chuyển hướng tới có thể là trang trong ứng dụng của bạn,
// hoặc có thể là một trang bất kỳ. Địa chỉ trên trình duyệt của người dùng
// lúc này sẽ hiển thị đường dẫn của trang B.


//Chuyển tiếp - Forward:
//Khi web chuyển tiếp từ trang link đến trang show
//    tất cả dữ liệu của req và resp
//    sẽ đc chuyển tới trang show, nhưng đường link trang web không bị thay đổi

//Chuyển hướng - Redirect:
//Khi web chuyển hướng từ trang link đến trang show
//    thì web server sẽ thực hiện 1 resp trả về cho trình duyệt và yêu cầu thực hiện 1 req thứ 2
//    đến trang show, mà khi thực hiện req thứ 2 tức là req thứ nhất đã hoàn thành nên dữ liệu gán vào req
//    sẽ bị hủy -> giá trị think = null
//     đường link trang web thay đổi thành show.jsp