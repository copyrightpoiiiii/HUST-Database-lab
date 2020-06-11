package servlet;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;
import org.Dao.Writer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/changeServlet")
public class changeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public changeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Integer state = Integer.valueOf(request.getParameter("state"));
        Integer id = Integer.valueOf(request.getParameter("id"));
        //HttpSession session = request.getSession();
        //System.out.println(take);
        //System.out.println(carType);
        //System.out.println(priceBegin);
        //System.out.println(city);
        Writer queryCar = new Writer();
        //ArrayList<JSONObject> array = queryCar.queryCar(1,1,0,3000,"武汉");
        int result = queryCar.changeState(id,state);
        PrintWriter out = response.getWriter();
        if (result == 1) {
            out.write("true");
        } else {
            out.write(result+"");
        }
        out.close();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
