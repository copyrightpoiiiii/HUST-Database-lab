package servlet;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;
import org.Dao.Query;

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
@WebServlet("/getCarServlet")
public class getCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public getCarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //HttpSession session = request.getSession();
        //System.out.println(take);
        //System.out.println(carType);
        //System.out.println(priceBegin);
        //System.out.println(city);
        Query queryCar = new Query();
        try {
            //ArrayList<JSONObject> array = queryCar.queryCar(1,1,0,3000,"武汉");
            ArrayList<JSONObject> array = queryCar.queryCarInfo();
            response.setContentType("text/html;charset=utf-8");
            PrintWriter pw = response.getWriter();
            pw.print(array.toString());
            //System.out.println(array);
        }catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
