package model;

public enum TipoAcao {
    CURSO("Curso"),
    EVENTO("Evento"),
    PROJETO("Projeto"),
    PROGRAMA("Programa"),
    SERVICO("Prestação de Serviço");

    private final String descricao;

    TipoAcao(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricao() {
        return descricao;
    }
}