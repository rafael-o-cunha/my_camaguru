# Capacidades Técnicas

Este documento apresenta as principais capacidades técnicas desenvolvidas durante a implementação do Camagru.

As capacidades estão organizadas em funcionalidades obrigatórias e funcionalidades implementadas como evolução da especificação original (bônus).

---

# Capacidades Obrigatórias

```text
Camagru
│
├── Autenticação
│   ├── Cadastro de usuários
│   ├── Login
│   ├── Logout
│   ├── Recuperação de senha
│   └── Confirmação de e-mail
│
├── Gerenciamento de Perfil
│   ├── Atualização de dados
│   ├── Avatar
│   └── Preferências de notificação
│
├── Publicações
│   ├── Upload de imagens
│   ├── Captura via Webcam
│   ├── Composição de imagens
│   ├── Gerenciamento de stickers
│   └── Exclusão de publicações
│
├── Galeria
│   ├── Paginação
│   ├── Comentários
│   ├── Reações
│   └── Notificações
│
├── Persistência
│   ├── PostgreSQL
│   ├── JDBC
│   └── Storage de arquivos
│
├── Segurança
│   ├── BCrypt
│   ├── PreparedStatement
│   ├── CSRF
│   ├── XSS
│   ├── SQL Injection
│   └── Upload Seguro
│
├── HTTP
│
├── Interface Web
│
├── Processamento de Imagem
│
├── Envio de E-mail
│
└── DevOps
    ├── Docker
    └── Docker Compose
```

---

# Capacidades Bônus

```text
Camagru
│
├── Administração
│   ├── Papéis de acesso
│   ├── Configuração de Post
│   ├── Configuração de Mídia
│   ├── Tipos de Mídia
│   ├── Gerenciamento de Reações
│   └── Gerenciamento de Stickers
│
├── Moderação
│   ├── Moderação de Usuários
│   ├── Moderação de Publicações
│   └── Tipos de Moderação
│
├── Rede Social
│   ├── Seguir usuários
│   ├── Respostas a comentários
│   └── Múltiplos papéis
│
└── Experiência do Usuário
    ├── AJAX
    ├── Upload assíncrono
    ├── Atualização assíncrona de comentários
    └── Atualização assíncrona de reações
```

---

# Resumo das Capacidades

| Categoria | Capacidades |
|-----------|-------------|
| Autenticação | Cadastro, Login, Logout, Recuperação de Senha, Confirmação de E-mail |
| Perfil | Gerenciamento de Perfil e Preferências |
| Publicações | Upload, Webcam, Composição de Imagens e Stickers |
| Galeria | Paginação, Comentários, Reações e Notificações |
| Persistência | PostgreSQL, JDBC e Storage |
| Segurança | BCrypt, CSRF, XSS, SQL Injection, Upload Seguro |
| Administração (Bônus) | Configurações da aplicação, Papéis e Catálogos |
| Moderação (Bônus) | Moderação de Usuários e Publicações |
| Rede Social (Bônus) | Follow, Respostas e Papéis |
| UX (Bônus) | AJAX e Atualizações Assíncronas |