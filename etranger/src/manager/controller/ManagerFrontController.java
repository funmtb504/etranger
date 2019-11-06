package manager.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.action.Action;
import common.vo.ActionForward;
import manager.action.CategoryListAction;
import manager.action.ManagerInsertProAction;

@WebServlet("*.ma")
public class ManagerFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String command = request.getServletPath();

		Action action = null;
		ActionForward forward = null;

		System.out.println(command);

//		 manager_main.jsp 페이지 이동
		if (command.equals("/ManagerMain.ma")) {
			forward = new ActionForward();
			forward.setPath("/manager/manager_main.jsp");
		}

//		else if (command.equals("/zzzOriginalPageszzz/ManagerInsert.ma")) {
//			forward = new ActionForward();
//			forward.setPath("/manager/manager_insert.jsp");
//		}
		else if(command.equals("/ManagerInsert.ma")) {
			// BoardListAction 클래스로 이동
			action = new CategoryListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/ManagerProInsert.ma")) {
			action = new ManagerInsertProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}
