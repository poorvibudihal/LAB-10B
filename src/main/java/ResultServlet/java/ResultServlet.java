package ResultServlet.java;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/processResult")
public class ResultServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String rollno = request.getParameter("rollno");
        String name = request.getParameter("name");

        String message = "";
        double avg = 0;
        String result = "";

        try {
            int s1 = Integer.parseInt(request.getParameter("sub1"));
            int s2 = Integer.parseInt(request.getParameter("sub2"));
            int s3 = Integer.parseInt(request.getParameter("sub3"));
            int s4 = Integer.parseInt(request.getParameter("sub4"));
            int s5 = Integer.parseInt(request.getParameter("sub5"));

            // Server-side validation
            if (rollno == null || rollno.trim().isEmpty() ||
                name == null || name.trim().isEmpty()) {
                message = "Error: Roll No and Name are required!";
            } else if (s1 < 0 || s2 < 0 || s3 < 0 || s4 < 0 || s5 < 0) {
                message = "Error: Marks cannot be negative!";
            } else {

                int total = s1 + s2 + s3 + s4 + s5;
                avg = total / 5.0;

                // Pass condition
                if (s1 >= 40 && s2 >= 40 && s3 >= 40 && s4 >= 40 && s5 >= 40) {
                    result = "PASS";
                } else {
                    result = "FAIL";
                }

                message = "Result Processed Successfully";

                // Set attributes
                request.setAttribute("rollno", rollno);
                request.setAttribute("name", name);
                request.setAttribute("s1", s1);
                request.setAttribute("s2", s2);
                request.setAttribute("s3", s3);
                request.setAttribute("s4", s4);
                request.setAttribute("s5", s5);
                request.setAttribute("average", avg);
                request.setAttribute("result", result);
            }

        } catch (NumberFormatException e) {
            message = "Error: Please enter valid numeric marks!";
        }

        request.setAttribute("message", message);

        RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}