package controller;

import model.AcaoExtensao;
import service.AcaoExtensaoService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/inscricao")
public class InscricaoServlet extends HttpServlet {

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
            // Redireciona para login se não estiver logado
            response.sendRedirect(request.getContextPath() + "/login?redirect=inscricao&acaoId=" +
                    request.getParameter("acaoId"));
            return;
        }

        String acaoIdParam = request.getParameter("acaoId");

        if (acaoIdParam == null || acaoIdParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/acoes");
            return;
        }

        try {
            Long acaoId = Long.parseLong(acaoIdParam);
            AcaoExtensao acao = acaoService.buscarPorId(acaoId);

            if (acao == null) {
                request.setAttribute("erro", "Ação não encontrada!");
                request.getRequestDispatcher("/acoes.jsp").forward(request, response);
                return;
            }

            if (!acao.isInscricoesAbertas()) {
                request.setAttribute("erro", "Inscrições não estão abertas para esta ação!");
                request.getRequestDispatcher("/detalhes-acao.jsp").forward(request, response);
                return;
            }

            request.setAttribute("acao", acao);
            request.getRequestDispatcher("/inscricao.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("erro", "ID inválido!");
            request.getRequestDispatcher("/acoes.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String acaoIdParam = request.getParameter("acaoId");
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");

        try {
            Long acaoId = Long.parseLong(acaoIdParam);
            AcaoExtensao acao = acaoService.buscarPorId(acaoId);

            if (acao != null && acao.isInscricoesAbertas()) {
                // Simular inscrição
                acao.setVagasDisponiveis(acao.getVagasDisponiveis() - 1);
                acaoService.salvar(acao);

                request.setAttribute("sucesso", "Inscrição realizada com sucesso!");
                request.setAttribute("acao", acao);
                request.setAttribute("nomeInscrito", nome);
                request.setAttribute("emailInscrito", email);
            } else {
                request.setAttribute("erro", "Não foi possível realizar a inscrição!");
            }

            request.getRequestDispatcher("/inscricao-confirmacao.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("erro", "Erro ao processar inscrição: " + e.getMessage());
            request.getRequestDispatcher("/inscricao.jsp").forward(request, response);
        }
    }
}