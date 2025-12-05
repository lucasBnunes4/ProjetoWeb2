package model;

public enum StatusAcao {
    ATIVA("Ativa"),
    ENCERRADA("Encerrada"),
    CANCELADA("Cancelada"),
    PLANEJADA("Planejada");

    private final String descricao;

    StatusAcao(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricao() {
        return descricao;
    }
}