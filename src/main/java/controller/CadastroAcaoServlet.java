package controller;

import model.AcaoExtensao;
import model.StatusAcao;
import model.TipoAcao;
import service.AcaoExtensaoService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/cadastro-acao")
public class CadastroAcaoServlet extends HttpServlet {

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

        String idParam = request.getParameter("id");
        if (idParam != null) {
            Long id = Long.parseLong(idParam);
            AcaoExtensao acao = acaoService.buscarPorId(id);
            request.setAttribute("acao", acao);
        }

        request.getRequestDispatcher("/cadastro-acao.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            AcaoExtensao acao;
            String idParam = request.getParameter("id");

            if (idParam != null && !idParam.isEmpty()) {
                Long id = Long.parseLong(idParam);
                acao = acaoService.buscarPorId(id);
                if (acao == null) {
                    acao = new AcaoExtensao();
                }
            } else {
                acao = new AcaoExtensao();
            }

            // Preencher dados da ação
            acao.setTitulo(request.getParameter("titulo"));
            acao.setDescricao(request.getParameter("descricao"));
            acao.setTipo(TipoAcao.valueOf(request.getParameter("tipo")));
            acao.setStatus(StatusAcao.valueOf(request.getParameter("status")));

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            acao.setDataInicio(LocalDate.parse(request.getParameter("dataInicio"), formatter));
            acao.setDataFim(LocalDate.parse(request.getParameter("dataFim"), formatter));

            acao.setResponsavel(request.getParameter("responsavel"));
            acao.setLocal(request.getParameter("local"));
            acao.setContato(request.getParameter("contato"));
            acao.setLinkExterno(request.getParameter("linkExterno"));
            acao.setPublicoAlvo(request.getParameter("publicoAlvo"));

            acao.setPossuiTaxa("on".equals(request.getParameter("possuiTaxa")));
            if (acao.isPossuiTaxa()) {
                acao.setValorTaxa(Double.parseDouble(request.getParameter("valorTaxa")));
            }

            acao.setVagasTotais(Integer.parseInt(request.getParameter("vagasTotais")));
            acao.setVagasDisponiveis(Integer.parseInt(request.getParameter("vagasDisponiveis")));

            acaoService.salvar(acao);

            response.sendRedirect(request.getContextPath() + "/acoes");

        } catch (Exception e) {
            request.setAttribute("erro", "Erro ao salvar ação: " + e.getMessage());
            request.getRequestDispatcher("/cadastro-acao.jsp").forward(request, response);
        }
    }
}