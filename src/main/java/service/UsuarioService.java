package service;

import model.Usuario;
import java.util.HashMap;
import java.util.Map;

public class UsuarioService {
    private static UsuarioService instance;
    private Map<String, Usuario> usuarios;

    private UsuarioService() {
        usuarios = new HashMap<>();
        inicializarUsuarios();
    }

    public static synchronized UsuarioService getInstance() {
        if (instance == null) {
            instance = new UsuarioService();
        }
        return instance;
    }

    private void inicializarUsuarios() {
        // Usuários de exemplo
        usuarios.put("admin@ufrrj.br",
                new Usuario(1L, "Administrador", "admin@ufrrj.br", "admin123", Usuario.TipoUsuario.ADMIN));
        usuarios.put("coordenador@ufrrj.br",
                new Usuario(2L, "Coordenador", "coordenador@ufrrj.br", "coord123", Usuario.TipoUsuario.COORDENADOR));
        usuarios.put("visitante@ufrrj.br",
                new Usuario(3L, "Visitante", "visitante@ufrrj.br", "visit123", Usuario.TipoUsuario.VISITANTE));
    }

    public Usuario autenticar(String email, String senha) {
        Usuario usuario = usuarios.get(email);
        if (usuario != null && usuario.verificarSenha(senha)) {
            return usuario;
        }
        return null;
    }

    public Usuario buscarPorEmail(String email) {
        return usuarios.get(email);
    }
}