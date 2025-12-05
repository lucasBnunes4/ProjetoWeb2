package controller;

import model.AcaoExtensao;
import service.AcaoExtensaoService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/detalhes-acao")
public class DetalhesAcaoServlet extends HttpServlet {

    private AcaoExtensaoService acaoService;

    @Override
    public void init() throws ServletException {
        acaoService = AcaoExtensaoService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/acoes");
            return;
        }

        try {
            Long id = Long.parseLong(idParam);
            AcaoExtensao acao = acaoService.buscarPorId(id);

            if (acao == null) {
                request.setAttribute("erro", "Ação não encontrada!");
                request.getRequestDispatcher("/acoes.jsp").forward(request, response);
                return;
            }

            request.setAttribute("acao", acao);
            request.getRequestDispatcher("/detalhes-acao.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("erro", "ID inválido!");
            request.getRequestDispatcher("/acoes.jsp").forward(request, response);
        }
    }
}