package service;

import model.AcaoExtensao;
import model.StatusAcao;
import model.TipoAcao;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class AcaoExtensaoService {
    private static AcaoExtensaoService instance;
    private List<AcaoExtensao> acoes;
    private Long proximoId = 1L;

    private AcaoExtensaoService() {
        acoes = new ArrayList<>();
        inicializarDados();
    }

    public static synchronized AcaoExtensaoService getInstance() {
        if (instance == null) {
            instance = new AcaoExtensaoService();
        }
        return instance;
    }

    private void inicializarDados() {
        // Ações de exemplo
        acoes.add(new AcaoExtensao(proximoId++,
                "Curso de Inglês Básico",
                "Curso destinado à comunidade interna e externa para aprendizado de inglês básico.",
                TipoAcao.CURSO,
                StatusAcao.ATIVA,
                LocalDate.of(2025, 3, 1),
                LocalDate.of(2025, 7, 30),
                "Prof. Maria Silva",
                "Campus Seropédica - Sala 101",
                "inglestico@ufrrj.br"
        ));

        AcaoExtensao acao2 = new AcaoExtensao(proximoId++,
                "Feira de Ciências 2025",
                "Evento anual de divulgação científica para escolas da região.",
                TipoAcao.EVENTO,
                StatusAcao.PLANEJADA,
                LocalDate.of(2025, 8, 15),
                LocalDate.of(2025, 8, 17),
                "Prof. João Santos",
                "Praça Central - Campus Seropédica",
                "feiraciencias@ufrrj.br"
        );
        acao2.setVagasTotais(500);
        acao2.setVagasDisponiveis(500);
        acoes.add(acao2);

        // Adicionar mais ações...
        for (int i = 3; i <= 8; i++) {
            AcaoExtensao acao = new AcaoExtensao(proximoId++,
                    "Projeto de Extensão " + i,
                    "Descrição do projeto de extensão número " + i,
                    TipoAcao.values()[i % TipoAcao.values().length],
                    StatusAcao.values()[i % StatusAcao.values().length],
                    LocalDate.now().plusDays(i * 10),
                    LocalDate.now().plusDays(i * 10 + 30),
                    "Responsável " + i,
                    "Local " + i,
                    "contato" + i + "@ufrrj.br"
            );
            acao.setVagasTotais(50);
            acao.setVagasDisponiveis(50 - i * 5);
            acao.setPossuiTaxa(i % 3 == 0);
            if (acao.isPossuiTaxa()) {
                acao.setValorTaxa(50.0 + i * 10);
            }
            acoes.add(acao);
        }
    }

    // CRUD operations
    public List<AcaoExtensao> listarTodas() {
        return new ArrayList<>(acoes);
    }

    public List<AcaoExtensao> listarAtivas() {
        return acoes.stream()
                .filter(a -> a.getStatus() == StatusAcao.ATIVA)
                .collect(Collectors.toList());
    }

    public AcaoExtensao buscarPorId(Long id) {
        return acoes.stream()
                .filter(a -> a.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    public void salvar(AcaoExtensao acao) {
        if (acao.getId() == null) {
            acao.setId(proximoId++);
            acoes.add(acao);
        } else {
            for (int i = 0; i < acoes.size(); i++) {
                if (acoes.get(i).getId().equals(acao.getId())) {
                    acoes.set(i, acao);
                    break;
                }
            }
        }
    }

    public void excluir(Long id) {
        acoes.removeIf(a -> a.getId().equals(id));
    }

    public List<AcaoExtensao> filtrarPorTipo(TipoAcao tipo) {
        return acoes.stream()
                .filter(a -> a.getTipo() == tipo)
                .collect(Collectors.toList());
    }

    public List<AcaoExtensao> buscarPorTermo(String termo) {
        String termoLower = termo.toLowerCase();
        return acoes.stream()
                .filter(a -> a.getTitulo().toLowerCase().contains(termoLower) ||
                        a.getDescricao().toLowerCase().contains(termoLower) ||
                        a.getResponsavel().toLowerCase().contains(termoLower))
                .collect(Collectors.toList());
    }
}