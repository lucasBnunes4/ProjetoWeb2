package controller;

import model.AcaoExtensao;
import service.AcaoExtensaoService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/acoes")
public class AcaoExtensaoServlet extends HttpServlet {

    private AcaoExtensaoService acaoService;

    @Override
    public void init() throws ServletException {
        acaoService = AcaoExtensaoService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        String idParam = request.getParameter("id");

        if (acao != null && acao.equals("detalhes") && idParam != null) {
            Long id = Long.parseLong(idParam);
            AcaoExtensao acaoExtensao = acaoService.buscarPorId(id);
            request.setAttribute("acao", acaoExtensao);
            request.getRequestDispatcher("/detalhes-acao.jsp").forward(request, response);
            return;
        }

        // Filtros
        String filtroTipo = request.getParameter("filtroTipo");
        String busca = request.getParameter("busca");

        List<AcaoExtensao> acoes;

        if (busca != null && !busca.trim().isEmpty()) {
            acoes = acaoService.buscarPorTermo(busca);
            request.setAttribute("termoBusca", busca);
        } else if (filtroTipo != null && !filtroTipo.isEmpty()) {
            acoes = acaoService.filtrarPorTipo(model.TipoAcao.valueOf(filtroTipo));
            request.setAttribute("filtroAtivo", filtroTipo);
        } else {
            acoes = acaoService.listarTodas();
        }

        request.setAttribute("acoes", acoes);
        request.getRequestDispatcher("/acoes.jsp").forward(request, response);
    }
}