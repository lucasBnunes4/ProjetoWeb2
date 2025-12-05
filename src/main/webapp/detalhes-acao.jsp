<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${acao.titulo} - UFRRJ</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ufrrj-theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <header class="ufrrj-header">
        <div class="container">
            <div class="header-top">
                <div class="logo-section">
                    <img src="${pageContext.request.contextPath}/assets/img/logo-ufrrj.png" alt="UFRRJ" class="logo">
                    <div class="titles">
                        <h1>UFRRJ</h1>
                        <h2>Ação de Extensão</h2>
                    </div>
                </div>
                <div class="header-actions">
                    <c:choose>
                        <c:when test="${not empty sessionScope.usuario}">
                            <span class="welcome">${sessionScope.nomeUsuario}</span>
                            <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-sm">Dashboard</a>
                            <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm btn-outline">Sair</a>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/login" class="btn btn-sm">Login</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <nav class="main-nav">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/">Início</a></li>
                    <li><a href="${pageContext.request.contextPath}/acoes">Ações</a></li>
                    <li><a href="${pageContext.request.contextPath}/sobre">Sobre</a></li>
                    <c:if test="${sessionScope.tipoUsuario == 'ADMIN' or sessionScope.tipoUsuario == 'COORDENADOR'}">
                        <li><a href="${pageContext.request.contextPath}/cadastro-acao?id=${acao.id}" class="btn-edit">
                            <i class="fas fa-edit"></i> Editar
                        </a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </header>

    <main class="main-content">
        <div class="container">
            <!-- Action Details -->
            <div class="action-details">
                <div class="details-header">
                    <div class="header-left">
                        <div class="breadcrumb">
                            <a href="${pageContext.request.contextPath}/acoes">Ações</a> /
                            <span>${acao.titulo}</span>
                        </div>
                        <h1>${acao.titulo}</h1>
                        <div class="action-metadata">
                            <span class="badge badge-${acao.tipo.name().toLowerCase()}">
                                ${acao.tipo.descricao}
                            </span>
                            <span class="badge status-${acao.status.name().toLowerCase()}">
                                ${acao.status.descricao}
                            </span>
                            <span class="date-range">
                                <i class="fas fa-calendar"></i>
                                ${acao.dataInicioFormatada} a ${acao.dataFimFormatada}
                            </span>
                        </div>
                    </div>
                    <div class="header-right">
                        <c:if test="${acao.inscricoesAbertas}">
                            <a href="${pageContext.request.contextPath}/inscricao?acaoId=${acao.id}"
                                   class="btn btn-primary btn-lg">
                                <i class="fas fa-user-plus"></i> Inscrever-se
                            </a>
                        </c:if>
                        <c:if test="${sessionScope.tipoUsuario == 'ADMIN' or sessionScope.tipoUsuario == 'COORDENADOR'}">
                            <a href="${pageContext.request.contextPath}/cadastro-acao?id=${acao.id}"
                               class="btn btn-outline btn-lg">
                                <i class="fas fa-edit"></i> Editar Ação
                            </a>
                        </c:if>
                    </div>
                </div>

                <div class="details-content">
                    <div class="content-main">
                        <div class="description-section">
                            <h2><i class="fas fa-info-circle"></i> Descrição</h2>
                            <p>${acao.descricao}</p>
                        </div>

                        <div class="info-grid">
                            <div class="info-card">
                                <h3><i class="fas fa-user-tie"></i> Responsável</h3>
                                <p>${acao.responsavel}</p>
                            </div>
                            <div class="info-card">
                                <h3><i class="fas fa-map-marker-alt"></i> Local</h3>
                                <p>${acao.local}</p>
                            </div>
                            <div class="info-card">
                                <h3><i class="fas fa-envelope"></i> Contato</h3>
                                <p>${acao.contato}</p>
                            </div>
                            <div class="info-card">
                                <h3><i class="fas fa-users"></i> Público-Alvo</h3>
                                <p>${not empty acao.publicoAlvo ? acao.publicoAlvo : 'Comunidade em geral'}</p>
                            </div>
                        </div>

                        <c:if test="${not empty acao.linkExterno}">
                            <div class="external-link-section">
                                <h2><i class="fas fa-external-link-alt"></i> Links Externos</h2>
                                <a href="${acao.linkExterno}" target="_blank" class="external-link">
                                    ${acao.linkExterno}
                                </a>
                            </div>
                        </c:if>
                    </div>

                    <div class="content-sidebar">
                        <div class="sidebar-card">
                            <h3><i class="fas fa-chart-pie"></i> Vagas</h3>
                            <div class="vagas-info">
                                <div class="vagas-numbers">
                                    <div class="vagas-total">
                                        <span class="label">Total:</span>
                                        <span class="value">${acao.vagasTotais}</span>
                                    </div>
                                    <div class="vagas-disponiveis">
                                        <span class="label">Disponíveis:</span>
                                        <span class="value ${acao.vagasDisponiveis > 0 ? 'text-success' : 'text-danger'}">
                                            ${acao.vagasDisponiveis}
                                        </span>
                                    </div>
                                </div>
                                <div class="vagas-progress">
                                    <div class="progress-bar">
                                        <div class="progress-fill"
                                             style="width: ${(acao.vagasDisponiveis / acao.vagasTotais) * 100}%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <c:if test="${acao.possuiTaxa}">
                            <div class="sidebar-card">
                                <h3><i class="fas fa-tag"></i> Taxa</h3>
                                <div class="taxa-info">
                                    <p class="taxa-value">R$ ${acao.valorTaxa}</p>
                                    <p class="taxa-note">Valor da inscrição</p>
                                </div>
                            </div>
                        </c:if>

                        <div class="sidebar-card">
                            <h3><i class="fas fa-share-alt"></i> Compartilhar</h3>
                            <div class="share-buttons">
                                <button class="share-btn" onclick="shareAction()">
                                    <i class="fas fa-share"></i> Compartilhar
                                </button>
                            </div>
                        </div>

                        <div class="sidebar-card">
                            <h3><i class="fas fa-question-circle"></i> Precisa de ajuda?</h3>
                            <p>Entre em contato com a coordenação de extensão:</p>
                            <a href="mailto:extensao@ufrrj.br" class="btn btn-sm btn-block mt-2">
                                <i class="fas fa-envelope"></i> extensao@ufrrj.br
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer class="ufrrj-footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h4>UFRRJ - Sistema de Extensão</h4>
                    <p>Informações detalhadas sobre ações extensionistas</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025 UFRRJ - Todos os direitos reservados</p>
            </div>
        </div>
    </footer>

    <script>
        function shareAction() {
            if (navigator.share) {
                navigator.share({
                    title: '${acao.titulo}',
                    text: 'Confira esta ação de extensão da UFRRJ',
                    url: window.location.href
                });
            } else {
                navigator.clipboard.writeText(window.location.href);
                alert('Link copiado para a área de transferência!');
            }
        }
    </script>
</body>
</html>