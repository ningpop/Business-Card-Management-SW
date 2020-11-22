package BusinessCard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;

/**
 * Servlet implementation class AddCardServlet
 */
@WebServlet("/AddCardServlet")
public class AddCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String team = request.getParameter("team");
		String position = request.getParameter("position");
		String email = request.getParameter("email");
		String company = request.getParameter("company");
		String address = request.getParameter("address");
		String zip = request.getParameter("zip");
		String fax = request.getParameter("fax");
		String telephone = request.getParameter("telephone");
		String businessType = request.getParameter("businessType");
		//int userNum = Integer.parseInt(request.getParameter("userNum"));
		if(BusinessCardDAO.getInstance().addCard(name, phone, team, position, email, company, address, zip, fax, telephone, businessType)) {
			response.sendRedirect("index.jsp");
		}
		else {
			response.setStatus(500);
		}
	}

}
