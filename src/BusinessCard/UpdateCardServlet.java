package businesscard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateCardServlet
 */
@WebServlet("/UpdateCardServlet")
public class UpdateCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateCardServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int bcId = 0;
		if (request.getParameter("bcId") != null) {
			bcId = Integer.parseInt(request.getParameter("bcId"));
		}
		ArrayList<String> telephone = new ArrayList<String>();
		String[] tele = request.getParameterValues("telephone[]");
		for (String t : tele)
			telephone.add(t);

		ArrayList<String> businessType = new ArrayList<String>();
		String[] busi = request.getParameterValues("type[]");
		for (String b : busi)
			businessType.add(b);

		BusinessCardDAO dao = BusinessCardDAO.getInstance();
		dao.update(bcId, request.getParameter("name"), request.getParameter("phone"), request.getParameter("team"),
				request.getParameter("position"), request.getParameter("email"), request.getParameter("company"),
				request.getParameter("address"), request.getParameter("zip"), request.getParameter("fax"), telephone,
				businessType);
		response.sendRedirect("/detail.jsp?id=" + bcId);
	}

}
