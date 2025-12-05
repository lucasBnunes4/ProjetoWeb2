<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Ações de Extensão - UFRRJ</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ufrrj-theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <!-- Header inspirado no portal UFRRJ -->
    <header class="ufrrj-header">
        <div class="container">
            <div class="header-top">
                <div class="logo-section">
                    <img src="${pageContext.request.contextPath}/assets/img/logo-ufrrj.png" alt="UFRRJ" class="logo">
                    <div class="titles">
                        <h1>Universidade Federal Rural do Rio de Janeiro</h1>
                        <h2>Sistema de Ações de Extensão</h2>
                    </div>
                </div>
                <div class="header-actions">
                    <c:choose>
                        <c:when test="${not empty sessionScope.usuario}">
                            <span class="welcome">Bem-vindo, ${sessionScope.nomeUsuario}!</span>
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
                    <li><a href="${pageContext.request.contextPath}/" class="active">Início</a></li>
                    <li><a href="${pageContext.request.contextPath}/acoes">Ações de Extensão</a></li>
                    <li><a href="${pageContext.request.contextPath}/sobre">Sobre o Sistema</a></li>
                    <c:if test="${sessionScope.tipoUsuario == 'ADMIN' or sessionScope.tipoUsuario == 'COORDENADOR'}">
                        <li><a href="${pageContext.request.contextPath}/cadastro-acao">Nova Ação</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </header>

    <main class="main-content">
        <div class="container">
            <!-- Hero Section -->
            <section class="hero-section">
                <div class="hero-content">
                    <h1>Conectando a Universidade à Comunidade</h1>
                    <p class="lead">Sistema integrado de ações de extensão da UFRRJ</p>
                    <div class="hero-actions">
                        <a href="${pageContext.request.contextPath}/acoes" class="btn btn-primary btn-lg">
                            <i class="fas fa-search"></i> Buscar Ações
                        </a>
                        <c:if test="${sessionScope.tipoUsuario == 'ADMIN' or sessionScope.tipoUsuario == 'COORDENADOR'}">
                            <a href="${pageContext.request.contextPath}/cadastro-acao" class="btn btn-success btn-lg">
                                <i class="fas fa-plus"></i> Cadastrar Nova Ação
                            </a>
                        </c:if>
                    </div>
                </div>
            </section>

            <!-- Stats Section -->
            <section class="stats-section">
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-graduation-cap"></i>
                        </div>
                        <div class="stat-content">
                            <h3>Cursos</h3>
                            <p class="stat-number">15+</p>
                            <p class="stat-desc">Cursos de extensão ativos</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-calendar-alt"></i>
                        </div>
                        <div class="stat-content">
                            <h3>Eventos</h3>
                            <p class="stat-number">8+</p>
                            <p class="stat-desc">Eventos programados</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="stat-content">
                            <h3>Participantes</h3>
                            <p class="stat-number">1200+</p>
                            <p class="stat-desc">Pessoas atendidas</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <div class="stat-content">
                            <h3>Locais</h3>
                            <p class="stat-number">5</p>
                            <p class="stat-desc">Campus atendidos</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Featured Actions -->
            <section class="featured-section">
                <h2 class="section-title">Ações em Destaque</h2>
                <div class="actions-grid">
                    <div class="action-card">
                        <div class="action-header">
                            <span class="action-badge badge-curso">Curso</span>
                            <span class="action-status status-ativa">Ativa</span>
                        </div>
                        <div class="action-body">
                            <h3>Curso de Inglês Básico</h3>
                            <p>Curso destinado à comunidade interna e externa para aprendizado de inglês básico.</p>
                            <div class="action-info">
                                <div class="info-item">
                                    <i class="fas fa-user"></i>
                                    <span>Prof. Maria Silva</span>
                                </div>
                                <div class="info-item">
                                    <i class="fas fa-map-marker-alt"></i>
                                    <span>Campus Seropédica</span>
                                </div>
                                <div class="info-item">
                                    <i class="fas fa-calendar"></i>
                                    <span>01/03/2025 - 30/07/2025</span>
                                </div>
                            </div>
                        </div>
                        <div class="action-footer">
                            <a href="${pageContext.request.contextPath}/detalhes-acao?id=1" class="btn btn-sm btn-block">
                                Ver Detalhes
                            </a>
                        </div>
                    </div>

                    <div class="action-card">
                        <div class="action-header">
                            <span class="action-badge badge-evento">Evento</span>
                            <span class="action-status status-planejada">Planejada</span>
                        </div>
                        <div class="action-body">
                            <h3>Feira de Ciências 2025</h3>
                            <p>Evento anual de divulgação científica para escolas da região.</p>
                            <div class="action-info">
                                <div class="info-item">
                                    <i class="fas fa-user"></i>
                                    <span>Prof. João Santos</span>
                                </div>
                                <div class="info-item">
                                    <i class="fas fa-map-marker-alt"></i>
                                    <span>Praça Central</span>
                                </div>
                                <div class="info-item">
                                    <i class="fas fa-calendar"></i>
                                    <span>15/08/2025 - 17/08/2025</span>
                                </div>
                            </div>
                        </div>
                        <div class="action-footer">
                            <a href="${pageContext.request.contextPath}/detalhes-acao?id=2" class="btn btn-sm btn-block">
                                Ver Detalhes
                            </a>
                        </div>
                    </div>
                </div>

                <div class="text-center" style="margin-top: 30px;">
                    <a href="${pageContext.request.contextPath}/acoes" class="btn btn-outline">
                        Ver Todas as Ações <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </section>
        </div>
    </main>

    <footer class="ufrrj-footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h4>Universidade Federal Rural do Rio de Janeiro</h4>
                    <p>Rodovia BR 465, Km 7 - Seropédica - RJ</p>
                    <p>CEP: 23890-000</p>
                </div>
                <div class="footer-section">
                    <h4>Sistema de Extensão</h4>
                    <p>Projeto desenvolvido para a disciplina Sistemas Web II</p>
                    <p>Departamento de Computação - ICE</p>
                </div>
                <div class="footer-section">
                    <h4>Contato</h4>
                    <p>Email: extensao@ufrrj.br</p>
                    <p>Telefone: (21) 2681-0000</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025 UFRRJ - Todos os direitos reservados</p>
            </div>
        </div>
    </footer>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</body>
</html>