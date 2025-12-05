<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sobre o Sistema - UFRRJ</title>
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
                        <h2>Sistema de Extensão</h2>
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
                    <li><a href="${pageContext.request.contextPath}/sobre" class="active">Sobre</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <main class="main-content">
        <div class="container">
            <!-- Page Header -->
            <div class="page-header">
                <h1>Sobre o Sistema</h1>
                <p>Conheça mais sobre o Sistema de Ações de Extensão da UFRRJ</p>
            </div>

            <!-- About Content -->
            <div class="about-content">
                <div class="about-section">
                    <h2><i class="fas fa-university"></i> Sobre a UFRRJ</h2>
                    <p>A Universidade Federal Rural do Rio de Janeiro (UFRRJ) é uma instituição de ensino superior pública federal brasileira, com sede em Seropédica, no estado do Rio de Janeiro. Fundada em 1910, é uma das mais tradicionais instituições de ensino do país, com foco em ciências agrárias, biológicas e exatas.</p>
                    <p>A universidade desenvolve diversas ações de extensão que visam estabelecer uma interação produtiva entre a instituição e a comunidade interna e externa, promovendo benefícios sociais e acadêmicos.</p>
                </div>

                <div class="about-section">
                    <h2><i class="fas fa-bullseye"></i> Objetivo do Sistema</h2>
                    <p>Este sistema foi desenvolvido para centralizar e organizar todas as ações de extensão da UFRRJ, proporcionando:</p>
                    <ul class="feature-list">
                        <li><i class="fas fa-check-circle"></i> <strong>Visibilidade:</strong> Divulgação centralizada das ações de extensão</li>
                        <li><i class="fas fa-check-circle"></i> <strong>Acesso:</strong> Facilidade para comunidade encontrar oportunidades</li>
                        <li><i class="fas fa-check-circle"></i> <strong>Organização:</strong> Registro histórico das ações realizadas</li>
                        <li><i class="fas fa-check-circle"></i> <strong>Transparência:</strong> Informações claras sobre todas as iniciativas</li>
                        <li><i class="fas fa-check-circle"></i> <strong>Gerenciamento:</strong> Ferramentas para coordenação das ações</li>
                    </ul>
                </div>

                <div class="about-section">
                    <h2><i class="fas fa-cogs"></i> Funcionalidades</h2>
                    <div class="features-grid">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-search"></i>
                            </div>
                            <div class="feature-content">
                                <h3>Busca Avançada</h3>
                                <p>Encontre ações por tipo, data, local ou palavra-chave</p>
                            </div>
                        </div>

                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-filter"></i>
                            </div>
                            <div class="feature-content">
                                <h3>Filtros Inteligentes</h3>
                                <p>Filtre ações por status, tipo ou período</p>
                            </div>
                        </div>

                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-edit"></i>
                            </div>
                            <div class="feature-content">
                                <h3>Gestão Completa</h3>
                                <p>Cadastro, edição e gerenciamento de ações</p>
                            </div>
                        </div>

                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-chart-bar"></i>
                            </div>
                            <div class="feature-content">
                                <h3>Dashboard</h3>
                                <p>Painel com estatísticas e relatórios</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="about-section">
                    <h2><i class="fas fa-users"></i> Tipos de Usuários</h2>
                    <div class="user-types">
                        <div class="user-type-card">
                            <h3><i class="fas fa-user-shield"></i> Administrador</h3>
                            <p>Gerencia todo o sistema, usuários e configurações</p>
                        </div>

                        <div class="user-type-card">
                            <h3><i class="fas fa-user-tie"></i> Coordenador</h3>
                            <p>Cadastra e gerencia ações de extensão</p>
                        </div>

                        <div class="user-type-card">
                            <h3><i class="fas fa-user"></i> Visitante</h3>
                            <p>Consulta ações e realiza inscrições</p>
                        </div>
                    </div>
                </div>

                <div class="about-section">
                    <h2><i class="fas fa-code"></i> Tecnologias Utilizadas</h2>
                    <div class="tech-stack">
                        <div class="tech-item">
                            <i class="fab fa-java fa-2x"></i>
                            <span>Java 17</span>
                        </div>
                        <div class="tech-item">
                            <i class="fas fa-server fa-2x"></i>
                            <span>Jakarta EE</span>
                        </div>
                        <div class="tech-item">
                            <i class="fab fa-html5 fa-2x"></i>
                            <span>HTML5</span>
                        </div>
                        <div class="tech-item">
                            <i class="fab fa-css3-alt fa-2x"></i>
                            <span>CSS3</span>
                        </div>
                        <div class="tech-item">
                            <i class="fab fa-js-square fa-2x"></i>
                            <span>JavaScript</span>
                        </div>
                        <div class="tech-item">
                            <i class="fas fa-database fa-2x"></i>
                            <span>Maven</span>
                        </div>
                    </div>
                </div>

                <div class="about-section">
                    <h2><i class="fas fa-graduation-cap"></i> Desenvolvimento Acadêmico</h2>
                    <p>Este sistema foi desenvolvido como projeto da disciplina <strong>Sistemas Web II</strong> do curso de Sistemas de Informação da UFRRJ.</p>
                    <p><strong>Docente:</strong> Prof. Tiago Cruz de França</p>
                    <p><strong>Objetivo:</strong> Aplicar os conceitos de desenvolvimento web com Java EE, padrões de projeto, arquitetura MVC e boas práticas de programação.</p>
                </div>

                <div class="about-section contact-section">
                    <h2><i class="fas fa-envelope"></i> Contato</h2>
                    <p>Para mais informações sobre o sistema ou para reportar problemas:</p>
                    <div class="contact-info">
                        <p><i class="fas fa-envelope"></i> <strong>Email:</strong> extensao@ufrrj.br</p>
                        <p><i class="fas fa-phone"></i> <strong>Telefone:</strong> (21) 2681-0000</p>
                        <p><i class="fas fa-map-marker-alt"></i> <strong>Endereço:</strong> Rodovia BR 465, Km 7 - Seropédica - RJ</p>
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
                    <p>Projeto desenvolvido para a disciplina Sistemas Web II</p>
                    <p>Departamento de Computação - Instituto de Ciências Exatas</p>
                </div>
                <div class="footer-section">
                    <h4>Links Úteis</h4>
                    <ul>
                        <li><a href="https://portal.ufrrj.br/" target="_blank">Portal UFRRJ</a></li>
                        <li><a href="https://www.ufrrj.br/" target="_blank">Site Oficial</a></li>
                        <li><a href="https://ice.ufrrj.br/" target="_blank">Instituto de Ciências Exatas</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025 Universidade Federal Rural do Rio de Janeiro - Todos os direitos reservados</p>
            </div>
        </div>
    </footer>
</body>
</html>