# Dicionário de dados

Este documento detalha os atributos identificados durante a construção do modelo lógico do Camaguru

Enquanto o modelo conceitual representa o domínio por meio de entidades e relacionamentos, e o modelo lógico apresenta as tabelas e  seus atributos principais, o dicionário de dados descreve tecnicamente cada atributo, indicando seu tipo de dado, restrições, finalidade e relacionamento com as regras de negócio.

## User

| Atributo       | Tipo (sugestão) | PK | FK | Obrigatório | Observação                                            |
| -------------- | ---------------- | :-: | :-: | :----------: | ------------------------------------------------------- |
| id             | UUID             | ✓ |    |      ✓      | Identificador único do usuário.                       |
| username       | VARCHAR(50)      |    |    |      ✓      | Nome de usuário utilizado para login. Deve ser único. |
| email          | VARCHAR(255)     |    |    |      ✓      | E-mail do usuário. Deve ser único.                    |
| password       | VARCHAR(255)     |    |    |      ✓      | Hash da senha (bcrypt).                                 |
| email_verified | BOOLEAN          |    |    |      ✓      | Indica se o e-mail foi confirmado.                      |
| is_active      | BOOLEAN          |    |    |      ✓      | Permite desativar usuários sem removê-los.            |
| created_at     | TIMESTAMP        |    |    |      ✓      | Data de criação da conta.                             |
| updated_at     | TIMESTAMP        |    |    |      ✓      | Última atualização do cadastro.                      |
| last_login     | TIMESTAMP        |    |    |              | Último acesso realizado pelo usuário.                 |

---

## Profile

| Atributo                    | Tipo (sugestão) | PK | FK | Obrigatório | Observação                                           |
| --------------------------- | ---------------- | :-: | :-: | :----------: | ------------------------------------------------------ |
| id                          | UUID             | ✓ |    |      ✓      | Identificador do perfil.                               |
| id_user                     | UUID             |    | ✓ |      ✓      | Relação 1:1 com Usuário. UNIQUE.                    |
| display_name                | VARCHAR(100)     |    |    |      ✓      | Nome exibido publicamente.                             |
| bibliography                | TEXT             |    |    |              | Descrição do usuário.                               |
| avatar_storage_id           | VARCHAR(255)     |    |    |              | Identificador do avatar armazenado no Storage.         |
| cover_storage_id            | VARCHAR(255)     |    |    |              | Identificador da imagem de capa armazenada no Storage. |
| enable_comment_notification | BOOLEAN          |    |    |      ✓      | Preferência de receber e-mails de novos comentários. |
| created_at                  | TIMESTAMP        |    |    |      ✓      | Data de criação do perfil.                           |
| updated_at                  | TIMESTAMP        |    |    |      ✓      | Última atualização do perfil.                       |

---

## Post

| Atributo   | Tipo (sugestão) | PK | FK | Obrigatório | Observação                           |
| ---------- | ---------------- | :-: | :-: | :----------: | -------------------------------------- |
| id         | UUID             | ✓ |    |      ✓      | Identificador único da publicação.  |
| id_user    | UUID             |    | ✓ |      ✓      | Autor da publicação.                 |
| caption    | TEXT             |    |    |              | Texto descritivo da publicação.      |
| created_at | TIMESTAMP        |    |    |      ✓      | Data/hora da publicação.             |
| updated_at | TIMESTAMP        |    |    |      ✓      | Última atualização da publicação. |

---

## Media

| Atributo | Tipo (sugestão) | PK | FK | Obrigatório | Observação |
|----------|-----------------|:--:|:--:|:------------:|------------|
| id | UUID | ✓ | | ✓ | Identificador único da mídia. |
| id_post | UUID | | ✓ | ✓ | Publicação à qual a mídia pertence. |
| storage_id | VARCHAR(255) | | | ✓ | Identificador do objeto armazenado no Storage. |
| display_order | SMALLINT | | | ✓ | Ordem de exibição da mídia no post. |
| created_at | TIMESTAMP | | | ✓ | Data de armazenamento da mídia. |

---

## Comment

| Atributo          | Tipo (sugestão) | PK | FK | Obrigatório | Observação                                                 |
| ----------------- | ---------------- | :-: | :-: | :----------: | ------------------------------------------------------------ |
| id                | UUID             | ✓ |    |      ✓      | Identificador único do comentário.                         |
| id_post           | UUID             |    | ✓ |      ✓      | Post ao qual o comentário pertence.                         |
| id_user           | UUID             |    | ✓ |      ✓      | Autor do comentário.                                        |
| parent_comment_id | UUID             |    | ✓ |              | Referência ao comentário respondido (auto-relacionamento). |
| content           | TEXT             |    |    |      ✓      | Texto do comentário.                                        |
| created_at        | TIMESTAMP        |    |    |      ✓      | Data/hora da criação do comentário.                       |
| updated_at        | TIMESTAMP        |    |    |              | Última edição do comentário.                             |

---

## Sticker

| Atributo | Tipo (sugestão) | PK | FK | Obrigatório | Observação |
|----------|-----------------|:--:|:--:|:------------:|------------|
| id | UUID | ✓ | | ✓ | Identificador único do sticker. |
| name | VARCHAR(100) | | | ✓ | Nome do sticker. |
| storage_id | VARCHAR(255) | | | ✓ | Identificador do arquivo armazenado no Storage. |
| description | TEXT | | | | Descrição do sticker. |
| category | VARCHAR(50) | | | | Categoria do sticker. |
| is_active | BOOLEAN | | | ✓ | Indica se o sticker está disponível para utilização. |
| created_at | TIMESTAMP | | | ✓ | Data de cadastro do sticker. |
| updated_at | TIMESTAMP | | | | Última atualização do cadastro. |

---

## Post_Sticker

| Atributo   | Tipo (sugestão) | PK | FK | Obrigatório | Observação                                        |
| ---------- | ---------------- | :-: | :-: | :----------: | --------------------------------------------------- |
| id         | UUID             | ✓ |    |      ✓      | Identificador da ocorrência.                       |
| id_post    | UUID             |    | ✓ |      ✓      | Post no qual o sticker foi utilizado.               |
| id_sticker | UUID             |    | ✓ |      ✓      | Sticker utilizado na composição.                  |
| position_x | INTEGER          |    |    |              | Coordenada X do sticker na imagem.                  |
| position_y | INTEGER          |    |    |              | Coordenada Y do sticker na imagem.                  |
| scale      | DECIMAL(5,2)     |    |    |              | Escala aplicada ao sticker.                         |
| rotations  | DECIMAL(5,2)     |    |    |              | Rotação aplicada ao sticker (graus).              |
| created_at | TIMESTAMP        |    |    |      ✓      | Data em que o post foi gerado utilizando o sticker. |

---

## Reaction

| Atributo   | Tipo (sugestão) | PK | FK | Obrigatório | Observação                                      |
| ---------- | ---------------- | :-: | :-: | :----------: | ------------------------------------------------- |
| id         | UUID             | ✓ |    |      ✓      | Identificador único do tipo de reação.         |
| name       | VARCHAR(50)      |    |    |      ✓      | Nome da reação (Curtir, Amar, Haha...).         |
| icon       | VARCHAR(100)     |    |    |      ✓      | Nome do ícone ou emoji utilizado pela interface. |
| is_active  | BOOLEAN          |    |    |      ✓      | Permite habilitar ou desabilitar a reação.      |
| created_at | TIMESTAMP        |    |    |      ✓      | Data de cadastro da reação.                     |
| updated_at | TIMESTAMP        |    |    |              | Última edição da reação.                    |

---

## Post_Reaction

| Atributo    | Tipo (sugestão) | PK | FK | Obrigatório | Observação                                |
| ----------- | ---------------- | :-: | :-: | :----------: | ------------------------------------------- |
| id          | UUID             | ✓ |    |      ✓      | Identificador da ocorrência da reação.   |
| id_post     | UUID             |    | ✓ |      ✓      | Post que recebeu a reação.                |
| id_user     | UUID             |    | ✓ |      ✓      | Usuário que realizou a reação.           |
| id_reaction | UUID             |    | ✓ |      ✓      | Tipo de reação aplicada.                  |
| created_at  | TIMESTAMP        |    |    |      ✓      | Data/hora em que a reação foi registrada. |


---

## Follow

| Atributo | Tipo (sugestão) | PK | FK | Obrigatório | Observação |
|----------|-----------------|:--:|:--:|:------------:|------------|
| id_follower | UUID | ✓ | ✓ | ✓ | Usuário que segue outro usuário. Parte da chave primária composta. |
| id_following | UUID | ✓ | ✓ | ✓ | Usuário seguido. Parte da chave primária composta. |
| created_at | TIMESTAMP | | | ✓ | Data em que o relacionamento de seguimento foi criado. |


