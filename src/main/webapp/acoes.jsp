<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ações de Extensão - UFRRJ</title>
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
                        <h2>Ações de Extensão</h2>
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
                    <li><a href="${pageContext.request.contextPath}/acoes" class="active">Ações de Extensão</a></li>
                    <li><a href="${pageContext.request.contextPath}/sobre">Sobre</a></li>
                    <c:if test="${sessionScope.tipoUsuario == 'ADMIN' or sessionScope.tipoUsuario == 'COORDENADOR'}">
                        <li><a href="${pageContext.request.contextPath}/cadastro-acao">Nova Ação</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </header>

    <main class="main-content">
        <div class="container">
            <!-- Page Header -->
            <div class="page-header">
                <h1>Ações de Extensão</h1>
                <p>Explore todas as ações de extensão da UFRRJ</p>
            </div>

            <!-- Search and Filters -->
            <div class="filters-section">
                <form action="${pageContext.request.contextPath}/acoes" method="get" class="search-form">
                    <div class="search-box">
                        <input type="text" name="busca" placeholder="Buscar ações..."
                               value="${param.busca}" class="search-input">
                        <button type="submit" class="search-btn">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>

                    <div class="filter-options">
                        <div class="filter-group">
                            <span class="filter-label">Filtrar por tipo:</span>
                            <select name="filtroTipo" class="filter-select" onchange="this.form.submit()">
                                <option value="">Todos os tipos</option>
                                <option value="CURSO" ${param.filtroTipo == 'CURSO' ? 'selected' : ''}>Cursos</option>
                                <option value="EVENTO" ${param.filtroTipo == 'EVENTO' ? 'selected' : ''}>Eventos</option>
                                <option value="PROJETO" ${param.filtroTipo == 'PROJETO' ? 'selected' : ''}>Projetos</option>
                                <option value="PROGRAMA" ${param.filtroTipo == 'PROGRAMA' ? 'selected' : ''}>Programas</option>
                                <option value="SERVICO" ${param.filtroTipo == 'SERVICO' ? 'selected' : ''}>Serviços</option>
                            </select>
                        </div>
                        <a href="${pageContext.request.contextPath}/acoes" class="btn btn-sm btn-outline">
                            <i class="fas fa-redo"></i> Limpar Filtros
                        </a>
                    </div>
                </form>

                <c:if test="${not empty param.busca}">
                    <div class="search-results-info">
                        <p>Resultados para: <strong>"${param.busca}"</strong></p>
                    </div>
                </c:if>
            </div>

            <!-- Actions List -->
            <div class="actions-container">
                <c:choose>
                    <c:when test="${not empty acoes and not empty acoes[0]}">
                        <div class="actions-grid">
                            <c:forEach var="acao" items="${acoes}">
                                <div class="action-card">
                                    <div class="action-header">
                                        <span class="action-badge badge-${acao.tipo.name().toLowerCase()}">
                                            ${acao.tipo.descricao}
                                        </span>
                                        <span class="action-status status-${acao.status.name().toLowerCase()}">
                                            ${acao.status.descricao}
                                        </span>
                                    </div>
                                    <div class="action-body">
                                        <h3>${acao.titulo}</h3>
                                        <p>${acao.descricao.length() > 100 ? acao.descricao.substring(0, 100) + '...' : acao.descricao}</p>

                                        <div class="action-info">
                                            <div class="info-item">
                                                <i class="fas fa-user"></i>
                                                <span>${acao.responsavel}</span>
                                            </div>
                                            <div class="info-item">
                                                <i class="fas fa-map-marker-alt"></i>
                                                <span>${acao.local}</span>
                                            </div>
                                            <div class="info-item">
                                                <i class="fas fa-calendar"></i>
                                                <span>${acao.dataInicioFormatada} - ${acao.dataFimFormatada}</span>
                                            </div>
                                        </div>

                                        <c:if test="${acao.possuiTaxa}">
                                            <div class="action-taxa">
                                                <i class="fas fa-tag"></i>
                                                <span>Taxa: R$ ${acao.valorTaxa}</span>
                                            </div>
                                        </c:if>

                                        <div class="action-vagas">
                                            <i class="fas fa-users"></i>
                                            <span>Vagas: ${acao.vagasDisponiveis}/${acao.vagasTotais}</span>
                                            <div class="vagas-bar">
                                                <div class="vagas-fill" style="width: ${(acao.vagasDisponiveis / acao.vagasTotais) * 100}%"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="action-footer">
                                        <a href="${pageContext.request.contextPath}/detalhes-acao?id=${acao.id}"
                                           class="btn btn-sm btn-block">
                                            <i class="fas fa-info-circle"></i> Detalhes
                                        </a>
                                        <c:if test="${acao.inscricoesAbertas}">
                                            <a href="${pageContext.request.contextPath}/inscricao?acaoId=${acao.id}"
                                            class="btn btn-sm btn-success btn-block mt-1">
                                                <i class="fas fa-user-plus"></i> Inscrever-se
                                            </a>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <i class="fas fa-search fa-3x"></i>
                            <h3>Nenhuma ação encontrada</h3>
                            <p>Tente ajustar seus filtros de busca ou cadastre uma nova ação.</p>
                            <c:if test="${sessionScope.tipoUsuario == 'ADMIN' or sessionScope.tipoUsuario == 'COORDENADOR'}">
                                <a href="${pageContext.request.contextPath}/cadastro-acao" class="btn btn-primary">
                                    <i class="fas fa-plus"></i> Cadastrar Nova Ação
                                </a>
                            </c:if>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </main>

    <footer class="ufrrj-footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h4>UFRRJ - Extensão</h4>
                    <p>Sistema de gerenciamento de ações extensionistas</p>
                </div>
                <div class="footer-section">
                    <h4>Contato</h4>
                    <p>extensao@ufrrj.br</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025 Universidade Federal Rural do Rio de Janeiro</p>
            </div>
        </div>
    </footer>
</body>
</html>