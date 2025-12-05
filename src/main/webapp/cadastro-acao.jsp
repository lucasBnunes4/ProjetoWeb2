<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:choose><c:when test="${not empty acao}">Editar Ação</c:when><c:otherwise>Nova Ação</c:otherwise></c:choose> - UFRRJ</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ufrrj-theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <c:if test="${empty sessionScope.usuario or (sessionScope.tipoUsuario != 'ADMIN' and sessionScope.tipoUsuario != 'COORDENADOR')}">
        <c:redirect url="/login" />
    </c:if>

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
                    <span class="welcome">${sessionScope.nomeUsuario}</span>
                    <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-sm">Dashboard</a>
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm btn-outline">Sair</a>
                </div>
            </div>

            <nav class="main-nav">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/">Início</a></li>
                    <li><a href="${pageContext.request.contextPath}/acoes">Ações</a></li>
                    <li><a href="${pageContext.request.contextPath}/cadastro-acao" class="active">
                        <c:choose>
                            <c:when test="${not empty acao}">Editar Ação</c:when>
                            <c:otherwise>Nova Ação</c:otherwise>
                        </c:choose>
                    </a></li>
                </ul>
            </nav>
        </div>
    </header>

    <main class="main-content">
        <div class="container">
            <div class="page-header">
                <h1>
                    <c:choose>
                        <c:when test="${not empty acao}">
                            <i class="fas fa-edit"></i> Editar Ação de Extensão
                        </c:when>
                        <c:otherwise>
                            <i class="fas fa-plus"></i> Nova Ação de Extensão
                        </c:otherwise>
                    </c:choose>
                </h1>
                <p>Preencha os dados da ação de extensão</p>
            </div>

            <c:if test="${not empty erro}">
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-triangle"></i> ${erro}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/cadastro-acao" method="post" class="form-cadastro">
                <input type="hidden" name="id" value="${acao.id}">

                <div class="form-section">
                    <h2><i class="fas fa-info-circle"></i> Informações Básicas</h2>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="titulo">Título da Ação *</label>
                            <input type="text" id="titulo" name="titulo" required
                                   value="${acao.titulo}" placeholder="Ex: Curso de Inglês Básico">
                        </div>

                        <div class="form-group">
                            <label for="tipo">Tipo de Ação *</label>
                            <select id="tipo" name="tipo" required>
                                <option value="">Selecione...</option>
                                <option value="CURSO" ${acao.tipo == 'CURSO' ? 'selected' : ''}>Curso</option>
                                <option value="EVENTO" ${acao.tipo == 'EVENTO' ? 'selected' : ''}>Evento</option>
                                <option value="PROJETO" ${acao.tipo == 'PROJETO' ? 'selected' : ''}>Projeto</option>
                                <option value="PROGRAMA" ${acao.tipo == 'PROGRAMA' ? 'selected' : ''}>Programa</option>
                                <option value="SERVICO" ${acao.tipo == 'SERVICO' ? 'selected' : ''}>Prestação de Serviço</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="descricao">Descrição *</label>
                        <textarea id="descricao" name="descricao" rows="4" required
                                  placeholder="Descreva detalhadamente a ação de extensão">${acao.descricao}</textarea>
                    </div>
                </div>

                <div class="form-section">
                    <h2><i class="fas fa-calendar-alt"></i> Datas e Status</h2>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="dataInicio">Data de Início *</label>
                            <input type="date" id="dataInicio" name="dataInicio" required
                                   value="${acao.dataInicio}">
                        </div>

                        <div class="form-group">
                            <label for="dataFim">Data de Término *</label>
                            <input type="date" id="dataFim" name="dataFim" required
                                   value="${acao.dataFim}">
                        </div>

                        <div class="form-group">
                            <label for="status">Status *</label>
                            <select id="status" name="status" required>
                                <option value="PLANEJADA" ${acao.status == 'PLANEJADA' ? 'selected' : ''}>Planejada</option>
                                <option value="ATIVA" ${acao.status == 'ATIVA' ? 'selected' : ''}>Ativa</option>
                                <option value="ENCERRADA" ${acao.status == 'ENCERRADA' ? 'selected' : ''}>Encerrada</option>
                                <option value="CANCELADA" ${acao.status == 'CANCELADA' ? 'selected' : ''}>Cancelada</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h2><i class="fas fa-users"></i> Responsabilidade e Local</h2>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="responsavel">Responsável *</label>
                            <input type="text" id="responsavel" name="responsavel" required
                                   value="${acao.responsavel}" placeholder="Nome do professor/responsável">
                        </div>

                        <div class="form-group">
                            <label for="local">Local de Realização *</label>
                            <input type="text" id="local" name="local" required
                                   value="${acao.local}" placeholder="Ex: Campus Seropédica - Sala 101">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="contato">Contato *</label>
                            <input type="email" id="contato" name="contato" required
                                   value="${acao.contato}" placeholder="Email para contato">
                        </div>

                        <div class="form-group">
                            <label for="publicoAlvo">Público-Alvo</label>
                            <input type="text" id="publicoAlvo" name="publicoAlvo"
                                   value="${acao.publicoAlvo}" placeholder="Ex: Estudantes, Comunidade externa, etc.">
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h2><i class="fas fa-link"></i> Informações Adicionais</h2>

                    <div class="form-group">
                        <label for="linkExterno">Link Externo (opcional)</label>
                        <input type="url" id="linkExterno" name="linkExterno"
                               value="${acao.linkExterno}" placeholder="https://...">
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <div class="checkbox-group">
                                <input type="checkbox" id="possuiTaxa" name="possuiTaxa"
                                       ${acao.possuiTaxa ? 'checked' : ''} onchange="toggleTaxa()">
                                <label for="possuiTaxa">Possui taxa de inscrição?</label>
                            </div>
                        </div>

                        <div class="form-group" id="valorTaxaGroup" style="display: ${acao.possuiTaxa ? 'block' : 'none'}">
                            <label for="valorTaxa">Valor da Taxa (R$)</label>
                            <input type="number" id="valorTaxa" name="valorTaxa" step="0.01" min="0"
                                   value="${acao.valorTaxa}" placeholder="0,00">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="vagasTotais">Total de Vagas *</label>
                            <input type="number" id="vagasTotais" name="vagasTotais" required min="1"
                                   value="${not empty acao.vagasTotais ? acao.vagasTotais : 50}">
                        </div>

                        <div class="form-group">
                            <label for="vagasDisponiveis">Vagas Disponíveis *</label>
                            <input type="number" id="vagasDisponiveis" name="vagasDisponiveis" required min="0"
                                   value="${not empty acao.vagasDisponiveis ? acao.vagasDisponiveis : 50}">
                        </div>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary btn-lg">
                        <i class="fas fa-save"></i> Salvar Ação
                    </button>
                    <a href="${pageContext.request.contextPath}/acoes" class="btn btn-outline btn-lg">
                        <i class="fas fa-times"></i> Cancelar
                    </a>
                </div>
            </form>
        </div>
    </main>

    <footer class="ufrrj-footer">
        <div class="container">
            <div class="footer-bottom">
                <p>&copy; 2025 UFRRJ - Sistema de Ações de Extensão</p>
            </div>
        </div>
    </footer>

    <script>
        function toggleTaxa() {
            const taxaGroup = document.getElementById('valorTaxaGroup');
            const possuiTaxa = document.getElementById('possuiTaxa').checked;
            taxaGroup.style.display = possuiTaxa ? 'block' : 'none';
        }

        // Validação de datas
        document.getElementById('dataFim').addEventListener('change', function() {
            const inicio = new Date(document.getElementById('dataInicio').value);
            const fim = new Date(this.value);

            if (fim < inicio) {
                alert('A data de término não pode ser anterior à data de início!');
                this.value = '';
            }
        });
    </script>
</body>
</html>