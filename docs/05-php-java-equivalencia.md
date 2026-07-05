# Equivalência PHP x Java EE

| Capacidade     | PHP                  | Java EE                  |
| -------------- | -------------------- | ------------------------ |
| HTTP           | $_GET / $_POST       | HttpServletRequest       |
| Resposta       | header()             | HttpServletResponse      |
| Sessão        | $_SESSION            | HttpSession              |
| Cookies        | setcookie()          | Cookie                   |
| Upload         | $_FILES              | Part                     |
| Persistência  | PDO                  | JDBC                     |
| SQL Seguro     | Prepared Statement   | PreparedStatement        |
| Templates      | PHP                  | JSP + JSTL               |
| Senhas         | password_hash()      | BCrypt                   |
| E-mail         | mail()               | Jakarta Mail             |
| Upload         | move_uploaded_file() | Files.copy()             |
| MIME Type      | mime_content_type()  | Files.probeContentType() |
| Imagens        | GD Library           | BufferedImage            |
| Composição   | imagecopy()          | Graphics2D               |
| PNG/JPEG       | imagepng()           | ImageIO                  |
| Configuração | getenv()             | System.getenv()          |

---

# Equivalência Arquitetural

| Camada | PHP | Java EE / Jakarta EE |
|---------|-----|----------------------|
| Cliente | Browser | Browser |
| View | PHP | JSP |
| Controller | Controller | Servlet |
| Regras de Negócio | Service | Service |
| Persistência | DAO (PDO) | DAO (JDBC) |
| Banco de Dados | Database | Database |
---

# Justificativa

A implementação será realizada utilizando Java EE/Jakarta EE (JSP + Servlets + JDBC), mantendo equivalência funcional com os recursos previstos na especificação do projeto.
Cada funcionalidade utilizada possui um recurso equivalente disponível na plataforma Java, preservando o comportamento esperado da aplicação.
A escolha do Java tem como objetivo aprofundar os conhecimentos na plataforma utilizada profissionalmente, sem alterar os requisitos funcionais definidos pelo projeto.
