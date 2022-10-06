import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculateServlet", value = "/calculate")
public class CalculateServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String description = req.getParameter("description");
        float price = Float.parseFloat(req.getParameter("price"));
        float discountPercent = Float.parseFloat(req.getParameter("discountPercent"));

        float discountAmount = price * discountPercent/100;
        float priceAfterDiscount = price - discountAmount;
        PrintWriter printWriter = resp.getWriter();
        printWriter.println("<html>");
        printWriter.println("San pham "+description+ " co gia la: "+price+" va ty le chiet khau "+discountPercent+ "% <br>");
        printWriter.println("Luong chiet khau: "+ discountAmount +" VND <br>");
        printWriter.println("Gia sau chiet khau: "+priceAfterDiscount+ " VND <br>");
        printWriter.println("</html>");
    }
}
