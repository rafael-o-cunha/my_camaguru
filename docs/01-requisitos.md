# Camagru

# Objetivo

Desenvolver uma aplicação web que permita aos usuários capturar ou enviar imagens, aplicar stickers, publicar o resultado em uma galeria pública, interagir através de comentários e curtidas, mantendo autenticação, segurança e responsividade.

---

# Escopo

## Inclui

- Cadastro de usuários
- Login
- Logout
- Recuperação de senha
- Confirmação de e-mail
- Gerenciamento de perfil
- Upload de imagens
- Captura via Webcam
- Processamento de imagens
- Galeria pública
- Curtidas
- Comentários
- Paginação
- Segurança
- Containerização

## Não inclui

- Chat
- Mensagens privadas
- Redes sociais internas

---

# Requisitos Funcionais

## Usuários

- RF001 Cadastrar usuário
- RF002 Confirmar conta por e-mail
- RF003 Login
- RF004 Logout
- RF005 Recuperar senha
- RF006 Alterar dados cadastrais

## Imagens

- RF007 Enviar imagem
- RF008 Capturar imagem pela webcam
- RF009 Selecionar sticker
- RF010 Gerar imagem composta
- RF011 Salvar imagem
- RF012 Excluir imagem

## Galeria

- RF013 Listar imagens
- RF014 Paginar resultados
- RF015 Curtir imagem
- RF016 Comentar imagem

## Notificações

- RF017 Enviar e-mail de confirmação
- RF018 Enviar e-mail de recuperação
- RF019 Notificar novos comentários

---

# Requisitos Não Funcionais

- RNF001 Interface responsiva
- RNF002 Compatibilidade com Firefox
- RNF003 Compatibilidade com Chrome
- RNF004 Containerização com Docker
- RNF005 Variáveis sensíveis fora do código
- RNF006 Senhas criptografadas
- RNF007 Proteção contra SQL Injection
- RNF008 Proteção contra XSS
- RNF009 Proteção contra CSRF
- RNF010 Upload seguro

---

# Bônus

## AJAX

- Curtidas sem reload
- Comentários sem reload
- Upload assíncrono

## Administração

- Configurações da aplicação
- Extensões permitidas
- Tamanho máximo de upload
- Paginação configurável
- Política de senhas
- Limites da aplicação
