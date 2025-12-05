package controller;

import service.AcaoExtensaoService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private AcaoExtensaoService acaoService;

    @Override
    public void init() throws ServletException {
        acaoService = AcaoExtensaoService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.setAttribute("totalAcoes", acaoService.listarTodas().size());
        request.setAttribute("acoesAtivas", acaoService.listarAtivas().size());

        request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
    }
}