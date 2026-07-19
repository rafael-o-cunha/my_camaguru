# Equivalência Tecnológica entre PHP e Java

==Obs.:==

> Após pesquisas e análises comparativas o documento foi formatado por IA para facilitar a leitura seguindo os tópicos:

- Objetivo
- Critérios de classificação
- Tabela comparativa
- Justificativas por item
- Bibliografia

---

## Objetivo

A especificação oficial do projeto Camagru permite que a aplicação seja desenvolvida utilizando qualquer linguagem no servidor, desde que cada função utilizada possua um recurso equivalente disponível na biblioteca padrão do PHP. Da mesma forma, todo framework, micro-framework ou biblioteca que não tenha sido criado pelo autor, e que não possua equivalente na biblioteca padrão do PHP, é considerado proibido — com exceção de frameworks CSS que não dependam de JavaScript não permitido.

Dessa forma, a tecnologia utilizada na implementação não constitui um requisito obrigatório em si. O requisito consiste em preservar a compatibilidade funcional com os recursos que poderiam ser implementados utilizando a PHP Standard Library, mantendo o comportamento esperado pela especificação oficial do projeto.

Neste projeto optei pela implementação utilizando **Java (Jakarta EE)**, por ser a plataforma que utilizo profissionalmente.

---

## Critério de Classificação

Para reduzir ambiguidade na avaliação de cada recurso utilizado, os itens da tabela abaixo foram classificados em quatro categorias:

1. **Infraestrutura mínima da plataforma escolhida**
   1. recursos que fazem parte da base do Jakarta EE, equivalentes a recursos nativos da linguagem PHP (superglobals, sessão, cookies).
2. **Biblioteca que implementa uma função nativa ausente no JDK**
   1. quando o JDK não possui uma função nativa equivalente, mas o PHP possui, sendo necessária uma biblioteca mínima para reproduzir exatamente essa função (nunca acrescentando funcionalidade além da necessária).
3. **Decisão decorrente do modelo de execução da JVM**
   1. escolhas motivadas pela diferença estrutural entre o modelo de processo contínuo (JVM) e o modelo request-response (PHP), análogas à liberdade de escolha de servidor já concedida pela especificação.
4. **Ferramentas de build/empacotamento**
   1. fora do escopo da regra de equivalência, por não fazerem parte da lógica de runtime da aplicação.

---

## Tabela Comparativa — Java (JDK 21 / Jakarta EE) × PHP Standard Library

| #  | Necessidade Funcional       | Solução em Java                                              | Nativo ou Biblioteca?                 | Equivalente Nativo no PHP                    | Status                  |
| -- | --------------------------- | -------------------------------------------------------------- | ------------------------------------- | -------------------------------------------- | ----------------------- |
| 1  | Requisição/Resposta HTTP  | `HttpServletRequest` / `HttpServletResponse`               | Jakarta EE (base da plataforma)       | `$_GET`, `$_POST`, `header()`          | Mantido                 |
| 2  | Sessão                     | `HttpSession`                                                | Jakarta EE                            | `$_SESSION`                                | Mantido                 |
| 3  | Cookies                     | `Cookie`                                                     | Jakarta EE                            | `setcookie()`                              | Mantido                 |
| 4  | Upload de arquivos          | `Part`                                                       | Jakarta EE                            | `$_FILES`                                  | Mantido                 |
| 5  | Consultas parametrizadas    | `PreparedStatement`                                          | JDBC (JDK)                            | Prepared Statement (PDO)                     | Mantido                 |
| 6  | Conexão com banco de dados | `DriverManager.getConnection()`                              | 100% nativo (JDK)                     | `new PDO(...)`                             | Alterado (era HikariCP) |
| 7  | Hash de senha               | `PBKDF2WithHmacSHA256` via `javax.crypto.SecretKeyFactory` | 100% nativo (JDK)                     | `hash_pbkdf2()`                            | Alterado (era BCrypt)   |
| 8  | Templates dinâmicos        | JSP + JSTL                                                     | Jakarta EE                            | Sintaxe alternativa PHP (`<?php if(): ?>`) | Mantido                 |
| 9  | Processamento de imagem     | `Graphics2D`                                                 | Nativo (`java.awt`)                 | GD Library                                   | Mantido                 |
| 10 | Escrita de imagem           | `ImageIO`                                                    | Nativo (`javax.imageio`)            | `imagepng()`, `imagejpeg()`              | Mantido                 |
| 11 | Envio de e-mail             | Jakarta Mail                                                   | Jakarta EE                            | `mail()`                                   | Mantido                 |
| 12 | Identificador único        | `UUID.randomUUID()`                                          | 100% nativo (`java.util`)           | `random_bytes()`                           | Mantido                 |
| 13 | Variáveis de ambiente      | `System.getenv()`                                            | Nativo (JDK)                          | `getenv()`                                 | Mantido                 |
| 14 | Build/empacotamento         | Maven                                                          | Ferramenta de build (fora do runtime) | Composer / OPcache                           | Fora do escopo da regra |
| 15 | Servidor/Container HTTP     | Tomcat 10.1.x (embutido)                                       | Webserver                             | Apache/Nginx/`php -S`                      | Fora do escopo da regra |

---

## Justificativas por Item

### 1-4. HttpServletRequest/Response, HttpSession, Cookie, Part

- Fazem parte da base mínima do Jakarta EE, a "linguagem/plataforma servidor" escolhida — equivalente ao papel do SAPI no PHP.
- Não são bibliotecas adicionais: são a fundação da própria stack, assim como `$_SESSION` não é uma lib no PHP, é parte da linguagem.
- Mapeiam 1:1 com a função nativa do PHP citada, sem necessidade de biblioteca de terceiros.

### 5. PreparedStatement

- Parte do JDBC, núcleo do JDK — não é dependência externa.
- Cumpre exatamente a mesma função de segurança que Prepared Statement do PDO (RN033), sem diferença de comportamento relevante.

### 6. Conexão com banco de dados (`DriverManager`, sem pool)

- Elimina a necessidade de justificar uma biblioteca de pool de conexões (HikariCP) sem equivalente direto na biblioteca padrão do PHP.
- PHP não gerencia pool de conexões nativamente — cada requisição instancia sua própria conexão PDO (fora `PDO::ATTR_PERSISTENT`, um mecanismo simples de reaproveitamento, não um pool configurável).
- `DriverManager.getConnection()` direto reproduz exatamente o modelo "uma conexão por requisição", que é o comportamento real do PHP padrão.
- Trade-off assumido: performance de conexão levemente menor que com HikariCP — aceitável dado o escopo do projeto, e evita abrir discussão sobre "biblioteca sem equivalente" no ponto mais técnico da defesa.

### 7. Hash de senha (PBKDF2 nativo)

- Elimina a necessidade de biblioteca de terceiros (ex: jBCrypt), já que o JDK não traz BCrypt nativamente.
- PHP possui `hash_pbkdf2()` como função nativa — usar `SecretKeyFactory` com PBKDF2 (nativo do JDK) reproduz uma função também nativa no PHP padrão, fechando a equivalência sem qualquer lib externa.
- Continua atendendo RNF006 (algoritmo criptográfico seguro), com salt aleatório e iterações suficientes.

### 8. JSP + JSTL

- JSTL não é um template engine de terceiros (como Twig/Blade seriam) — é especificação padrão do Jakarta EE para expressar lógica de controle dentro do HTML.
- A função que cumpre (embutir condicionais/loops no template) já existe nativamente no PHP via sintaxe alternativa, sem necessidade de lib.

### 9-10. Graphics2D / ImageIO

- Ambos nativos do JDK (`java.awt`, `javax.imageio`), sem dependência externa.
- Cumprem exatamente a função de composição e escrita de imagem que GD Library cumpre no PHP (RN015, RF011).

### 11. Jakarta Mail

- O JDK não implementa SMTP nativamente (diferente de `mail()` no PHP, que já abstrai a chamada ao sendmail/SMTP internamente).
- É a forma mínima e padrão, dentro do ecossistema já adotado, de implementar o protocolo — a alternativa seria implementar SMTP manualmente via `Socket`, desproporcional e sem ganho de conformidade.
- A função cumprida (RF018-RF019) tem equivalente direto no PHP (`mail()`); a biblioteca só substitui a ausência de função nativa equivalente no JDK.

### 12. UUID.randomUUID()

- Nativo do `java.util`, sem biblioteca externa.
- PHP não tem uma função "UUID" formal na biblioteca padrão, mas `random_bytes()` cumpre a mesma função (gerar identificador único não sequencial), ainda que o formato técnico não seja idêntico.

### 13. System.getenv()

- Nativo do JDK, mapeia 1:1 com `getenv()` do PHP.

### 14. Maven

- Ferramenta de build/empacotamento, fora da lógica de runtime da aplicação — equivalente ao papel do Composer no ecossistema PHP.
- Mesmo o PHP moderno tem uma etapa de preparação antes do deploy (`composer dump-autoload --optimize`, OPcache desde o PHP 7, reforçado com JIT no PHP 8) — só que menos visível, por ser linguagem interpretada.
- O Makefile do projeto (`make up`, `make run`, `make debug`) documenta os comandos operacionais, mas orquestra o Maven, não o substitui como gerenciador de dependência/build.

### 15. Tomcat como servidor

- O próprio subject libera explicitamente a escolha de qualquer webserver, citando Apache, Nginx ou o servidor embutido do PHP como exemplos.
- Escolha de infraestrutura, não de função de aplicação — fora do escopo da regra de equivalência.

---

## Versão da Plataforma Java e Servidor

- **JDK:** 21 (LTS)
- **Especificação:** Jakarta EE 10 — sucessora oficial do "Java EE". O namespace `javax.*` foi renomeado para `jakarta.*` a partir da Jakarta EE 9, após a doação do projeto pela Oracle à Eclipse Foundation em 2017.
- **Servlet API:** `jakarta.servlet-api` 6.0.0 (Servlet 6.0)
- **Servidor:** Tomcat 10.1.x, embutido programaticamente via `tomcat-embed-core` + `tomcat-embed-jasper` (para JSP), inicializado por uma classe `Main.java` própria.

---

## Equivalência Arquitetural

| Camada             | PHP                  | Java (Jakarta EE)     |
| ------------------ | -------------------- | --------------------- |
| Cliente            | Browser              | Browser               |
| Interface          | PHP                  | JSP                   |
| Controle           | Controller           | Servlet               |
| Regras de Negócio | Service              | Service               |
| Persistência      | DAO/Repository (PDO) | DAO/Repository (JDBC) |
| Banco de Dados     | PostgreSQL           | PostgreSQL            |

---

## Justificativa da Escolha Tecnológica

A escolha da plataforma Java não altera o escopo nem os requisitos definidos para o projeto.

Toda a lógica funcional permanece aderente à especificação oficial do Camagru, sendo implementada por meio de recursos equivalentes aos disponíveis na biblioteca padrão do PHP.

Além de atender aos requisitos obrigatórios, a utilização do ecossistema Jakarta EE proporciona:

- organização da aplicação em camadas bem definidas;
- separação entre apresentação, regras de negócio e persistência;
- reutilização de componentes;
- maior facilidade para testes e manutenção;
- aderência às práticas utilizadas em aplicações web corporativas.

Dessa forma, a implementação preserva integralmente o comportamento esperado pela especificação, utilizando uma tecnologia diferente, porém tecnicamente equivalente.
A implementação em Java respeita os requisitos técnicos definidos pela especificação do projeto, incluindo:

| Requisito da especificação               | Implementação                                |
| ------------------------------------------ | ---------------------------------------------- |
| Compatibilidade com navegadores suportados | HTML, CSS e JavaScript executados no navegador |
| Validação de formulários                | JavaScript e validações no servidor          |
| Processamento da imagem no servidor        | Java 2D (Graphics2D e ImageIO)                 |
| Segurança contra SQL Injection            | PreparedStatement                              |
| Proteção contra XSS                      | Escape e validação de entradas               |
| Proteção contra CSRF                     | Token CSRF                                     |
| Upload seguro de arquivos                  | Validação por extensão, MIME Type e tamanho |
| Armazenamento seguro de senhas             | BCrypt                                         |
| Containerização                          | Docker e Docker Compose                        |

---

## Bibliografia

**1-4. HttpServletRequest/Response, HttpSession, Cookie, Part**

- Especificação oficial Jakarta Servlet 6.0 — https://jakarta.ee/specifications/servlet/6.0/
- Javadoc HttpServletRequest (Tomcat 10.1) — https://tomcat.apache.org/tomcat-10.1-doc/servletapi/jakarta/servlet/http/HttpServletRequest.html
- PHP Manual — Predefined Variables ($_GET, $_POST, $_SESSION, $_COOKIE, $_FILES) — https://www.php.net/manual/en/reserved.variables.php
- PHP Manual — $_SESSION — https://www.php.net/manual/en/reserved.variables.session.php
- PHP Manual — setcookie() — https://www.php.net/manual/en/function.setcookie.php
- PHP Manual — $_FILES — https://www.php.net/manual/en/reserved.variables.files.php

**5-6. PreparedStatement / DriverManager**

- Javadoc PreparedStatement (Java SE 21) — https://docs.oracle.com/en/java/javase/21/docs/api/java.sql/java/sql/PreparedStatement.html
- Javadoc DriverManager (Java SE 21) — https://docs.oracle.com/en/java/javase/21/docs/api/java.sql/java/sql/DriverManager.html
- PHP Manual — PDO — https://www.php.net/manual/en/book.pdo.php
- PHP Manual — PDO::prepare — https://www.php.net/manual/en/pdo.prepare.php

**7. Hash de senha (PBKDF2)**

- Javadoc SecretKeyFactory (Java SE 21) — https://docs.oracle.com/en/java/javase/21/docs/api/java.base/javax/crypto/SecretKeyFactory.html
- PHP Manual — hash_pbkdf2() — https://www.php.net/manual/en/function.hash-pbkdf2.php

**8. JSP + JSTL**

- Especificação Jakarta Pages (JSP) — https://jakarta.ee/specifications/pages/
- Especificação Jakarta Standard Tag Library 3.0 — https://jakarta.ee/specifications/tags/3.0/
- PHP Manual — Estrutura de controle: sintaxe alternativa — https://www.php.net/manual/en/control-structures.alternative-syntax.php

**9-10. Graphics2D / ImageIO**

- Javadoc pacote javax.imageio (Java SE 21) — https://docs.oracle.com/en/java/javase/21/docs/api/java.desktop/javax/imageio/package-summary.html
- Java 2D (visão geral oficial Oracle) — https://www.oracle.com/java/technologies/java2d.html
- PHP Manual — GD e funções de imagem — https://www.php.net/manual/en/book.image.php
- PHP Manual — imagepng() — https://www.php.net/manual/en/function.imagepng.php

**11. Jakarta Mail**

- Especificação oficial Jakarta Mail — https://jakarta.ee/specifications/mail/
- PHP Manual — mail() — https://www.php.net/manual/en/function.mail.php

**12. UUID.randomUUID()**

- Javadoc java.util.UUID (Java SE 21) — https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/util/UUID.html
- PHP Manual — random_bytes() — https://www.php.net/manual/en/function.random-bytes.php

**13. System.getenv() / variáveis de ambiente**

- PHP Manual — $_ENV / getenv() — https://www.php.net/manual/en/reserved.variables.environment.php

**14. Maven / Composer**

- Site oficial Apache Maven — https://maven.apache.org/
- Site oficial Composer — https://getcomposer.org/

**15. Tomcat / servidor embutido**

- Site oficial Apache Tomcat — https://tomcat.apache.org/
- Tomcat Embed Core (Maven Central) — https://central.sonatype.com/artifact/org.apache.tomcat.embed/tomcat-embed-core
- PHP Manual — Servidor web embutido via linha de comando (php -S) — https://www.php.net/manual/en/features.commandline.webserver.php

**16. Validação de upload por MIME Type**

- PHP Manual — mime_content_type() — https://www.php.net/manual/en/function.mime-content-type.php
- PHP Manual — move_uploaded_file() — https://www.php.net/manual/en/function.move-uploaded-file.php
