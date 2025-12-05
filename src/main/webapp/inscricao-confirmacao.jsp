<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscrição Confirmada - UFRRJ</title>
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
                        <h2>Confirmação de Inscrição</h2>
                    </div>
                </div>
                <div class="header-actions">
                    <span class="welcome">${sessionScope.nomeUsuario}</span>
                    <a href="${pageContext.request.contextPath}/acoes" class="btn btn-sm">Voltar às Ações</a>
                </div>
            </div>
        </div>
    </header>

    <main class="main-content">
        <div class="container">
            <div class="confirmacao-container">
                <c:choose>
                    <c:when test="${not empty sucesso}">
                        <div class="confirmacao-card success">
                            <div class="confirmacao-icon">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <div class="confirmacao-content">
                                <h1>✅ Inscrição Confirmada!</h1>
                                <p>Sua inscrição foi realizada com sucesso.</p>

                                <div class="detalhes-inscricao">
                                    <h2>Detalhes da Inscrição</h2>
                                    <div class="info-grid">
                                        <div class="info-item">
                                            <strong>Ação:</strong>
                                            <span>${acao.titulo}</span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Participante:</strong>
                                            <span>${nomeInscrito}</span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Email:</strong>
                                            <span>${emailInscrito}</span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Data da Inscrição:</strong>
                                            <span><%= new java.util.Date().toLocaleString() %></span>
                                        </div>
                                        <div class="info-item">
                                            <strong>Código da Inscrição:</strong>
                                            <span class="codigo">INS-${acao.id}-<%= System.currentTimeMillis() %></span>
                                        </div>
                                    </div>
                                </div>

                                <c:if test="${acao.possuiTaxa}">
                                    <div class="alerta-taxa">
                                        <h3><i class="fas fa-exclamation-triangle"></i> Atenção</h3>
                                        <p>Esta ação possui uma taxa de <strong>R$ ${acao.valorTaxa}</strong>.</p>
                                        <p>O pagamento deverá ser realizado no primeiro dia da atividade.</p>
                                    </div>
                                </c:if>

                                <div class="instrucoes">
                                    <h3><i class="fas fa-info-circle"></i> Próximos Passos</h3>
                                    <ul>
                                        <li>Você receberá um email de confirmação</li>
                                        <li>Guarde o código da inscrição para referência</li>
                                        <li>Compareça no local e data informados</li>
                                        <li>Em caso de dúvidas, entre em contato: ${acao.contato}</li>
                                    </ul>
                                </div>

                                <div class="acoes-confirmacao">
                                    <a href="${pageContext.request.contextPath}/acoes" class="btn btn-primary">
                                        <i class="fas fa-list"></i> Ver Outras Ações
                                    </a>
                                    <button onclick="window.print()" class="btn btn-outline">
                                        <i class="fas fa-print"></i> Imprimir Comprovante
                                    </button>
                                    <a href="${pageContext.request.contextPath}/detalhes-acao?id=${acao.id}"
                                       class="btn btn-outline">
                                        <i class="fas fa-info-circle"></i> Ver Detalhes da Ação
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="confirmacao-card error">
                            <div class="confirmacao-icon">
                                <i class="fas fa-exclamation-triangle"></i>
                            </div>
                            <div class="confirmacao-content">
                                <h1>❌ Inscrição Não Realizada</h1>
                                <p>${erro}</p>

                                <div class="acoes-confirmacao">
                                    <a href="${pageContext.request.contextPath}/acoes" class="btn btn-primary">
                                        <i class="fas fa-arrow-left"></i> Voltar às Ações
                                    </a>
                                    <a href="${pageContext.request.contextPath}/detalhes-acao?id=${acao.id}"
                                       class="btn btn-outline">
                                        <i class="fas fa-info-circle"></i> Ver Detalhes da Ação
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
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

    <style>
        .confirmacao-container {
            max-width: 800px;
            margin: 0 auto;
        }

        .confirmacao-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
        }

        .confirmacao-card.success {
            border-top: 5px solid #28a745;
        }

        .confirmacao-card.error {
            border-top: 5px solid #dc3545;
        }

        .confirmacao-icon {
            text-align: center;
            padding: 40px 0 20px;
            font-size: 5rem;
        }

        .confirmacao-card.success .confirmacao-icon {
            color: #28a745;
        }

        .confirmacao-card.error .confirmacao-icon {
            color: #dc3545;
        }

        .confirmacao-content {
            padding: 0 40px 40px;
        }

        .confirmacao-content h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .confirmacao-content > p {
            text-align: center;
            font-size: 1.1rem;
            color: #666;
            margin-bottom: 40px;
        }

        .detalhes-inscricao {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 30px;
        }

        .detalhes-inscricao h2 {
            color: #005b2e;
            margin-bottom: 20px;
            font-size: 1.3rem;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 15px;
        }

        .info-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }

        .info-item:last-child {
            border-bottom: none;
        }

        .info-item strong {
            color: #333;
        }

        .info-item span {
            color: #666;
        }

        .codigo {
            font-family: monospace;
            font-size: 1.1rem;
            color: #005b2e;
            font-weight: bold;
        }

        .alerta-taxa {
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
        }

        .alerta-taxa h3 {
            color: #856404;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .instrucoes {
            margin-bottom: 40px;
        }

        .instrucoes h3 {
            color: #005b2e;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .instrucoes ul {
            list-style: none;
            padding-left: 0;
        }

        .instrucoes li {
            padding: 8px 0;
            padding-left: 30px;
            position: relative;
        }

        .instrucoes li:before {
            content: "✓";
            position: absolute;
            left: 0;
            color: #28a745;
            font-weight: bold;
        }

        .acoes-confirmacao {
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
        }

        @media print {
            .header-actions,
            .ufrrj-footer,
            .btn {
                display: none !important;
            }

            .confirmacao-card {
                box-shadow: none;
                border: 2px solid #000;
            }
        }
    </style>
</body>
</html>