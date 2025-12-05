<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscrição - ${acao.titulo}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ufrrj-theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <c:if test="${empty sessionScope.usuario}">
        <c:redirect url="/login" />
    </c:if>

    <header class="ufrrj-header">
        <div class="container">
            <div class="header-top">
                <div class="logo-section">
                    <img src="${pageContext.request.contextPath}/assets/img/logo-ufrrj.png" alt="UFRRJ" class="logo">
                    <div class="titles">
                        <h1>UFRRJ</h1>
                        <h2>Inscrição em Ação de Extensão</h2>
                    </div>
                </div>
                <div class="header-actions">
                    <span class="welcome">${sessionScope.nomeUsuario}</span>
                    <a href="${pageContext.request.contextPath}/acoes" class="btn btn-sm">Voltar</a>
                </div>
            </div>
        </div>
    </header>

    <main class="main-content">
        <div class="container">
            <div class="page-header">
                <h1><i class="fas fa-user-plus"></i> Inscrição</h1>
                <p>Preencha seus dados para se inscrever na ação</p>
            </div>

            <c:if test="${not empty erro}">
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-triangle"></i> ${erro}
                </div>
            </c:if>

            <div class="inscricao-container">
                <div class="acao-info-card">
                    <h2>${acao.titulo}</h2>
                    <div class="info-grid">
                        <div class="info-item">
                            <i class="fas fa-calendar"></i>
                            <span>${acao.dataInicioFormatada} a ${acao.dataFimFormatada}</span>
                        </div>
                        <div class="info-item">
                            <i class="fas fa-map-marker-alt"></i>
                            <span>${acao.local}</span>
                        </div>
                        <div class="info-item">
                            <i class="fas fa-user-tie"></i>
                            <span>${acao.responsavel}</span>
                        </div>
                        <c:if test="${acao.possuiTaxa}">
                            <div class="info-item">
                                <i class="fas fa-tag"></i>
                                <span>Taxa: R$ ${acao.valorTaxa}</span>
                            </div>
                        </c:if>
                    </div>
                    <div class="vagas-info">
                        <p>Vagas disponíveis: <strong>${acao.vagasDisponiveis}/${acao.vagasTotais}</strong></p>
                        <div class="progress-bar">
                            <div class="progress-fill"
                                 style="width: ${(acao.vagasDisponiveis / acao.vagasTotais) * 100}%"></div>
                        </div>
                    </div>
                </div>

                <form action="${pageContext.request.contextPath}/inscricao" method="post" class="form-inscricao">
                    <input type="hidden" name="acaoId" value="${acao.id}">

                    <h2><i class="fas fa-user-circle"></i> Dados Pessoais</h2>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="nome">Nome Completo *</label>
                            <input type="text" id="nome" name="nome" required
                                   value="${sessionScope.nomeUsuario}"
                                   placeholder="Seu nome completo">
                        </div>

                        <div class="form-group">
                            <label for="email">Email *</label>
                            <input type="email" id="email" name="email" required
                                   value="${sessionScope.usuario.email}"
                                   placeholder="seu.email@exemplo.com">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="telefone">Telefone *</label>
                            <input type="tel" id="telefone" name="telefone" required
                                   placeholder="(21) 99999-9999">
                        </div>

                        <div class="form-group">
                            <label for="cpf">CPF *</label>
                            <input type="text" id="cpf" name="cpf" required
                                   placeholder="000.000.000-00">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="instituicao">Instituição/Escola</label>
                        <input type="text" id="instituicao" name="instituicao"
                               placeholder="Nome da sua instituição">
                    </div>

                    <div class="form-group">
                        <label for="observacoes">Observações</label>
                        <textarea id="observacoes" name="observacoes" rows="3"
                                  placeholder="Alguma informação adicional..."></textarea>
                    </div>

                    <c:if test="${acao.possuiTaxa}">
                        <div class="taxa-section">
                            <h3><i class="fas fa-money-bill-wave"></i> Informações da Taxa</h3>
                            <p>Valor da taxa: <strong>R$ ${acao.valorTaxa}</strong></p>
                            <p>O pagamento deverá ser realizado no primeiro dia da atividade.</p>
                        </div>
                    </c:if>

                    <div class="form-check">
                        <input type="checkbox" id="termos" name="termos" required>
                        <label for="termos">
                            Concordo com os termos de participação e autorizo o uso dos meus dados
                            para fins acadêmicos e administrativos da UFRRJ.
                        </label>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="fas fa-check-circle"></i> Confirmar Inscrição
                        </button>
                        <a href="${pageContext.request.contextPath}/detalhes-acao?id=${acao.id}"
                           class="btn btn-outline btn-lg">
                            <i class="fas fa-times"></i> Cancelar
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <footer class="ufrrj-footer">
        <div class="container">
            <div class="footer-bottom">
                <p>&copy; 2025 UFRRJ - Sistema de Inscrições</p>
            </div>
        </div>
    </footer>

    <script>
        // Máscara para CPF
        document.getElementById('cpf').addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length > 3) value = value.replace(/^(\d{3})(\d)/, '$1.$2');
            if (value.length > 6) value = value.replace(/^(\d{3})\.(\d{3})(\d)/, '$1.$2.$3');
            if (value.length > 9) value = value.replace(/^(\d{3})\.(\d{3})\.(\d{3})(\d)/, '$1.$2.$3-$4');
            e.target.value = value.substring(0, 14);
        });

        // Máscara para telefone
        document.getElementById('telefone').addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length > 0) value = '(' + value;
            if (value.length > 3) value = value.replace(/^(\d{2})(\d)/, '$1) $2');
            if (value.length > 9) value = value.replace(/(\d{5})(\d)/, '$1-$2');
            e.target.value = value.substring(0, 15);
        });
    </script>
</body>
</html>