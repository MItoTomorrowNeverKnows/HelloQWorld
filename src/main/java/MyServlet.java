import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/hello")
public class MyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/html; charset=UTF-8");
        resp.getWriter().println("<h1>Success!</h1>");
        resp.getWriter().println("<p>Dockerの上でJavaが動いています！</p>");
    }
}