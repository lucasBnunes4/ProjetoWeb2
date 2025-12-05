<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - UFRRJ</title>
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
                        <h2>Painel de Controle</h2>
                    </div>
                </div>
                <div class="header-actions">
                    <span class="welcome">${sessionScope.nomeUsuario} (${sessionScope.tipoUsuario})</span>
                    <a href="${pageContext.request.contextPath}/" class="btn btn-sm">Site</a>
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm btn-outline">Sair</a>
                </div>
            </div>

            <nav class="main-nav">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/dashboard" class="active">
                        <i class="fas fa-tachometer-alt"></i> Dashboard
                    </a></li>
                    <li><a href="${pageContext.request.contextPath}/acoes">
                        <i class="fas fa-list"></i> Ações
                    </a></li>
                    <li><a href="${pageContext.request.contextPath}/cadastro-acao">
                        <i class="fas fa-plus"></i> Nova Ação
                    </a></li>
                    <c:if test="${sessionScope.tipoUsuario == 'ADMIN'}">
                        <li><a href="#">
                            <i class="fas fa-users"></i> Usuários
                        </a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </header>

    <main class="main-content">
        <div class="container">
            <!-- Dashboard Header -->
            <div class="dashboard-header">
                <h1><i class="fas fa-tachometer-alt"></i> Dashboard</h1>
                <p>Bem-vindo ao painel de controle do sistema de extensão</p>
            </div>

            <!-- Stats Cards -->
            <div class="dashboard-stats">
                <div class="stat-card stat-primary">
                    <div class="stat-icon">
                        <i class="fas fa-project-diagram"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Total de Ações</h3>
                        <p class="stat-number">${totalAcoes}</p>
                        <p class="stat-desc">Ações cadastradas</p>
                    </div>
                </div>

                <div class="stat-card stat-success">
                    <div class="stat-icon">
                        <i class="fas fa-play-circle"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Ações Ativas</h3>
                        <p class="stat-number">${acoesAtivas}</p>
                        <p class="stat-desc">Em andamento</p>
                    </div>
                </div>

                <div class="stat-card stat-warning">
                    <div class="stat-icon">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Próximos Eventos</h3>
                        <p class="stat-number">3</p>
                        <p class="stat-desc">Nos próximos 30 dias</p>
                    </div>
                </div>

                <div class="stat-card stat-info">
                    <div class="stat-icon">
                        <i class="fas fa-user-graduate"></i>
                    </div>
                    <div class="stat-content">
                        <h3>Participantes</h3>
                        <p class="stat-number">1.2k</p>
                        <p class="stat-desc">Total de inscritos</p>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="dashboard-section">
                <h2><i class="fas fa-bolt"></i> Ações Rápidas</h2>
                <div class="quick-actions">
                    <a href="${pageContext.request.contextPath}/cadastro-acao" class="quick-action">
                        <div class="quick-icon">
                            <i class="fas fa-plus-circle"></i>
                        </div>
                        <div class="quick-content">
                            <h3>Nova Ação</h3>
                            <p>Cadastrar nova ação de extensão</p>
                        </div>
                    </a>

                    <a href="${pageContext.request.contextPath}/acoes" class="quick-action">
                        <div class="quick-icon">
                            <i class="fas fa-list-ul"></i>
                        </div>
                        <div class="quick-content">
                            <h3>Listar Ações</h3>
                            <p>Ver todas as ações cadastradas</p>
                        </div>
                    </a>

                    <a href="#" class="quick-action">
                        <div class="quick-icon">
                            <i class="fas fa-file-export"></i>
                        </div>
                        <div class="quick-content">
                            <h3>Relatório</h3>
                            <p>Gerar relatório de atividades</p>
                        </div>
                    </a>

                    <a href="#" class="quick-action">
                        <div class="quick-icon">
                            <i class="fas fa-cog"></i>
                        </div>
                        <div class="quick-content">
                            <h3>Configurações</h3>
                            <p>Configurar sistema</p>
                        </div>
                    </a>
                </div>
            </div>

            <!-- Recent Activities -->
            <div class="dashboard-section">
                <h2><i class="fas fa-history"></i> Atividades Recentes</h2>
                <div class="activities-list">
                    <div class="activity-item">
                        <div class="activity-icon success">
                            <i class="fas fa-plus"></i>
                        </div>
                        <div class="activity-content">
                            <h3>Nova ação cadastrada</h3>
                            <p>Curso de Inglês Avançado foi cadastrado</p>
                            <span class="activity-time">Hoje, 10:30</span>
                        </div>
                    </div>

                    <div class="activity-item">
                        <div class="activity-icon warning">
                            <i class="fas fa-edit"></i>
                        </div>
                        <div class="activity-content">
                            <h3>Ação atualizada</h3>
                            <p>Feira de Ciências 2025 foi atualizada</p>
                            <span class="activity-time">Ontem, 15:45</span>
                        </div>
                    </div>

                    <div class="activity-item">
                        <div class="activity-icon info">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        <div class="activity-content">
                            <h3>Novas inscrições</h3>
                            <p>15 novas inscrições no Curso de Espanhol</p>
                            <span class="activity-time">2 dias atrás</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- User Info -->
            <div class="dashboard-section">
                <h2><i class="fas fa-user-circle"></i> Sua Conta</h2>
                <div class="user-info-card">
                    <div class="user-avatar">
                        <i class="fas fa-user fa-3x"></i>
                    </div>
                    <div class="user-details">
                        <h3>${sessionScope.nomeUsuario}</h3>
                        <p><strong>Email:</strong> ${sessionScope.usuario.email}</p>
                        <p><strong>Tipo:</strong> ${sessionScope.tipoUsuario}</p>
                        <p><strong>Último acesso:</strong> Hoje</p>
                    </div>
                    <div class="user-actions">
                        <a href="#" class="btn btn-sm btn-outline">
                            <i class="fas fa-edit"></i> Editar Perfil
                        </a>
                        <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm btn-outline">
                            <i class="fas fa-sign-out-alt"></i> Sair
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer class="ufrrj-footer">
        <div class="container">
            <div class="footer-bottom">
                <p>&copy; 2025 UFRRJ - Painel Administrativo</p>
            </div>
        </div>
    </footer>
</body>
</html>