<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Sistema de Extensão UFRRJ</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ufrrj-theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .login-page {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #005b2e 0%, #003319 100%);
            padding: 20px;
        }

        .login-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 450px;
            overflow: hidden;
        }

        .login-header {
            background: #005b2e;
            color: white;
            padding: 30px;
            text-align: center;
        }

        .login-header h1 {
            margin: 0;
            font-size: 24px;
        }

        .login-header p {
            margin: 10px 0 0;
            opacity: 0.9;
        }

        .login-body {
            padding: 40px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            outline: none;
            border-color: #005b2e;
        }

        .btn-login {
            width: 100%;
            padding: 14px;
            background: #005b2e;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-login:hover {
            background: #004424;
        }

        .login-footer {
            text-align: center;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #e0e0e0;
        }

        .alert {
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 20px;
            background: #fee;
            border: 1px solid #fcc;
            color: #c00;
        }

        .demo-accounts {
            margin-top: 30px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 8px;
            border-left: 4px solid #005b2e;
        }

        .demo-accounts h4 {
            margin-top: 0;
            color: #005b2e;
        }

        .demo-account {
            margin-bottom: 10px;
            padding: 10px;
            background: white;
            border-radius: 6px;
            border: 1px solid #e0e0e0;
        }

        .demo-account strong {
            color: #005b2e;
        }
    </style>
</head>
<body>
    <div class="login-page">
        <div class="login-container">
            <div class="login-header">
                <h1><i class="fas fa-university"></i> UFRRJ</h1>
                <p>Sistema de Ações de Extensão</p>
            </div>

            <div class="login-body">
                <c:if test="${not empty erro}">
                    <div class="alert">
                        <i class="fas fa-exclamation-triangle"></i> ${erro}
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/login" method="post">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" class="form-control" required
                               placeholder="seu.email@ufrrj.br">
                    </div>

                    <div class="form-group">
                        <label for="senha">Senha</label>
                        <input type="password" id="senha" name="senha" class="form-control" required
                               placeholder="Sua senha">
                    </div>

                    <button type="submit" class="btn-login">
                        <i class="fas fa-sign-in-alt"></i> Entrar no Sistema
                    </button>
                </form>

                <div class="login-footer">
                    <p>Não tem uma conta? <a href="${pageContext.request.contextPath}/">Acesse como visitante</a></p>
                </div>

                <!-- Contas de demonstração -->
                <div class="demo-accounts">
                    <h4><i class="fas fa-key"></i> Contas de Demonstração:</h4>
                    <div class="demo-account">
                        <strong>Administrador:</strong> admin@ufrrj.br / admin123
                    </div>
                    <div class="demo-account">
                        <strong>Coordenador:</strong> coordenador@ufrrj.br / coord123
                    </div>
                    <div class="demo-account">
                        <strong>Visitante:</strong> visitante@ufrrj.br / visit123
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>