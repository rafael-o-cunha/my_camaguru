# Regras de Negócio

# Regras Obrigatórias

## Usuários

- RN001 Apenas usuários cadastrados podem autenticar na aplicação.
- RN002 O endereço de e-mail deve ser confirmado antes do primeiro acesso.
- RN003 O login é realizado utilizando nome de usuário e senha.
- RN004 Apenas usuários autenticados podem acessar funcionalidades privadas.
- RN005 Cada usuário possui exatamente um perfil.
- RN006 O nome de usuário e o e-mail devem ser únicos.

---

## Perfil

- RN007 O perfil pertence exclusivamente a um único usuário.
- RN008 O usuário poderá alterar suas informações públicas.
- RN009 O usuário poderá definir se deseja receber notificações de comentários.

---

## Publicações

- RN010 Apenas usuários autenticados podem publicar.
- RN011 Toda publicação pertence a um único usuário.
- RN012 Toda publicação deve possuir pelo menos uma mídia.
- RN013 Apenas o autor poderá excluir sua publicação.
- RN014 Todas as publicações são públicas.
- RN015 A composição final da imagem deverá ser realizada exclusivamente no servidor.

---

## Mídias

- RN016 Apenas arquivos de imagem permitidos poderão ser enviados.
- RN017 O tipo do arquivo deverá ser validado por extensão e MIME Type.
- RN018 O tamanho máximo do arquivo deverá respeitar a configuração da aplicação.
- RN019 A quantidade máxima de mídias por publicação deverá respeitar a configuração da aplicação.

---

## Comentários

- RN020 Apenas usuários autenticados podem comentar.
- RN021 Todo comentário pertence a um único usuário.
- RN022 Todo comentário pertence a uma única publicação.
- RN023 Um comentário poderá responder outro comentário.
- RN024 O tamanho máximo do comentário deverá respeitar a configuração da aplicação.

---

## Reações

- RN025 Apenas usuários autenticados podem reagir às publicações.
- RN026 Um usuário poderá possuir apenas uma reação ativa por publicação.
- RN027 Apenas reações habilitadas poderão ser utilizadas.

---

## Stickers

- RN028 Apenas stickers habilitados poderão ser utilizados na composição das imagens.
- RN029 Os stickers utilizados deverão ser registrados na publicação.

---

## Notificações

- RN030 O autor da publicação deverá ser notificado quando receber um novo comentário.
- RN031 O envio da notificação dependerá da preferência configurada pelo usuário.

---

## Segurança

- RN032 Senhas nunca poderão ser armazenadas em texto puro.
- RN033 Todas as consultas ao banco deverão utilizar PreparedStatement.
- RN034 Todos os formulários POST deverão utilizar proteção CSRF.
- RN035 Todas as entradas do usuário deverão ser validadas.
- RN036 Todo conteúdo textual deverá ser protegido contra XSS.
- RN037 Apenas arquivos válidos poderão ser enviados ao servidor.

---

# Regras de Negócio (Bônus)

## Administração

- RBN001 Apenas usuários com papel de Administrador poderão acessar a área administrativa.
- RBN002 As configurações da aplicação deverão ser persistidas em banco de dados.
- RBN003 As configurações poderão ser alteradas sem necessidade de recompilação da aplicação.
- RBN004 Apenas tipos de mídia habilitados poderão ser utilizados.
- RBN005 Apenas stickers habilitados poderão ser utilizados.
- RBN006 Apenas reações habilitadas poderão ser utilizadas.
- RBN007 A quantidade máxima de mídias por publicação será determinada pela configuração da aplicação.
- RBN008 O tamanho máximo das descrições das publicações será determinado pela configuração da aplicação.
- RBN009 O tamanho máximo dos comentários será determinado pela configuração da aplicação.

---

## Papéis

- RBN010 Um usuário poderá possuir um ou mais papéis.
- RBN011 Um papel poderá ser atribuído a diversos usuários.

---

## Moderação

- RBN012 Apenas usuários com permissão de moderação poderão executar ações de moderação.
- RBN013 Toda moderação deverá possuir um tipo de moderação válido.
- RBN014 Toda moderação deverá registrar o moderador responsável.
- RBN015 Toda moderação deverá possuir justificativa.
- RBN016 Os tipos de moderação poderão ser habilitados ou desabilitados pelo administrador.

---

## Rede Social

- RBN017 Um usuário poderá seguir diversos usuários.
- RBN018 Um usuário não poderá seguir a si próprio.
- RBN019 O relacionamento de seguir não poderá ser duplicado.

---

## Experiência do Usuário

- RBN020 Comentários poderão ser atualizados sem recarregar a página.
- RBN021 Reações poderão ser atualizadas sem recarregar a página.
- RBN022 Uploads poderão ser realizados de forma assíncrona.