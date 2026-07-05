# Regras de Negócio

## Usuários

- Apenas usuários cadastrados podem autenticar.
- O e-mail deve ser confirmado antes do acesso.
- O login utiliza usuário e senha.
- Apenas usuários autenticados podem utilizar funcionalidades privadas.


## Imagens

- Apenas usuários autenticados podem criar imagens.
- Cada imagem pertence a um único usuário.
- Apenas o proprietário pode excluir sua imagem.
- Toda imagem publicada é pública.


## Comentários

- Apenas usuários autenticados podem comentar.
- O autor da imagem recebe notificação por e-mail.
- O usuário poderá desabilitar notificações.


## Curtidas

- Apenas usuários autenticados podem curtir.
- Um usuário poderá curtir apenas uma vez cada imagem.


## Upload

- Apenas imagens permitidas poderão ser enviadas.
- O tamanho máximo será configurável.
- A extensão deverá ser validada.
- O MIME Type deverá ser validado.


## Webcam

- O navegador deverá conceder permissão.
- O processamento ocorrerá no servidor.


## Segurança

- Senhas nunca serão armazenadas em texto.
- Toda consulta ao banco utilizará PreparedStatement.
- Todos os formulários POST possuirão Token CSRF.
- Entradas do usuário serão validadas.
- Comentários serão protegidos contra XSS.


## Administração (Bônus)

- Configurações serão persistidas no banco.
- Configurações serão carregadas em cache.
- Alterações poderão ser aplicadas sem recompilação.
