package model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class AcaoExtensao {
    private Long id;
    private String titulo;
    private String descricao;
    private TipoAcao tipo;
    private StatusAcao status;
    private LocalDate dataInicio;
    private LocalDate dataFim;
    private String responsavel;
    private String local;
    private String contato;
    private String linkExterno;
    private String publicoAlvo;
    private boolean possuiTaxa;
    private Double valorTaxa;
    private int vagasDisponiveis;
    private int vagasTotais;

    // Construtor
    public AcaoExtensao() {}

    public AcaoExtensao(Long id, String titulo, String descricao, TipoAcao tipo,
                        StatusAcao status, LocalDate dataInicio, LocalDate dataFim,
                        String responsavel, String local, String contato) {
        this.id = id;
        this.titulo = titulo;
        this.descricao = descricao;
        this.tipo = tipo;
        this.status = status;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
        this.responsavel = responsavel;
        this.local = local;
        this.contato = contato;
    }

    // Getters e Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }

    public TipoAcao getTipo() { return tipo; }
    public void setTipo(TipoAcao tipo) { this.tipo = tipo; }

    public StatusAcao getStatus() { return status; }
    public void setStatus(StatusAcao status) { this.status = status; }

    public LocalDate getDataInicio() { return dataInicio; }
    public void setDataInicio(LocalDate dataInicio) { this.dataInicio = dataInicio; }

    public LocalDate getDataFim() { return dataFim; }
    public void setDataFim(LocalDate dataFim) { this.dataFim = dataFim; }

    public String getResponsavel() { return responsavel; }
    public void setResponsavel(String responsavel) { this.responsavel = responsavel; }

    public String getLocal() { return local; }
    public void setLocal(String local) { this.local = local; }

    public String getContato() { return contato; }
    public void setContato(String contato) { this.contato = contato; }

    public String getLinkExterno() { return linkExterno; }
    public void setLinkExterno(String linkExterno) { this.linkExterno = linkExterno; }

    public String getPublicoAlvo() { return publicoAlvo; }
    public void setPublicoAlvo(String publicoAlvo) { this.publicoAlvo = publicoAlvo; }

    public boolean isPossuiTaxa() { return possuiTaxa; }
    public void setPossuiTaxa(boolean possuiTaxa) { this.possuiTaxa = possuiTaxa; }

    public Double getValorTaxa() { return valorTaxa; }
    public void setValorTaxa(Double valorTaxa) { this.valorTaxa = valorTaxa; }

    public int getVagasDisponiveis() { return vagasDisponiveis; }
    public void setVagasDisponiveis(int vagasDisponiveis) { this.vagasDisponiveis = vagasDisponiveis; }

    public int getVagasTotais() { return vagasTotais; }
    public void setVagasTotais(int vagasTotais) { this.vagasTotais = vagasTotais; }

    // Métodos auxiliares
    public String getDataInicioFormatada() {
        return dataInicio != null ?
                dataInicio.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) : "";
    }

    public String getDataFimFormatada() {
        return dataFim != null ?
                dataFim.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) : "";
    }

    public boolean isInscricoesAbertas() {
        return status == StatusAcao.ATIVA && vagasDisponiveis > 0;
    }
}