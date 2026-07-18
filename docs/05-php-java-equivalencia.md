# Equivalência Tecnológica entre PHP e Java

# Objetivo

A especificação oficial do projeto Camagru permite que a aplicação seja desenvolvida utilizando qualquer linguagem no servidor, desde que cada funcionalidade empregada possua um recurso equivalente disponível na biblioteca padrão do PHP.

Dessa forma, a tecnologia utilizada na implementação não constitui um requisito obrigatório. O requisito consiste em preservar a compatibilidade funcional com os recursos que poderiam ser implementados utilizando PHP Standard Library, mantendo o comportamento esperado pela especificação oficial do projeto.

Neste projeto optou-se pela implementação utilizando **Java (Jakarta EE)**, por ser a plataforma utilizada profissionalmente pelo autor e por proporcionar aprofundamento em tecnologias de desenvolvimento web corporativo, sem comprometer os requisitos funcionais, técnicos e de segurança estabelecidos pela especificação oficial.S

---

# Equivalência de Recursos

| Capacidade | PHP Standard Library | Java (Jakarta EE) |
|------------|----------------------|-------------------|
| Requisição HTTP | `$_GET`, `$_POST` | `HttpServletRequest` |
| Resposta HTTP | `header()` | `HttpServletResponse` |
| Sessão | `$_SESSION` | `HttpSession` |
| Cookies | `setcookie()` | `Cookie` |
| Upload de arquivos | `$_FILES` | `Part` |
| Persistência | PDO | JDBC |
| Consultas parametrizadas | Prepared Statement | PreparedStatement |
| Templates | PHP | JSP + JSTL |
| Criptografia de senhas | `password_hash()` | BCrypt |
| Envio de e-mail | `mail()` | Jakarta Mail |
| Manipulação de arquivos | `move_uploaded_file()` | `Files.copy()` |
| Validação de MIME Type | `mime_content_type()` | `Files.probeContentType()` |
| Processamento de imagens | GD Library | BufferedImage |
| Composição de imagens | `imagecopy()` | Graphics2D |
| Escrita de imagens | `imagepng()`, `imagejpeg()` | ImageIO |
| Variáveis de ambiente | `getenv()` | `System.getenv()` |

---

# Equivalência Arquitetural

| Camada | PHP | Java (Jakarta EE) |
|---------|-----|-------------------|
| Cliente | Browser | Browser |
| Interface | PHP | JSP |
| Controle | Controller | Servlet |
| Regras de Negócio | Service | Service |
| Persistência | DAO (PDO) | DAO (JDBC) |
| Banco de Dados | PostgreSQL | PostgreSQL |

---

# Compatibilidade com a Especificação

A implementação em Java respeita os requisitos técnicos definidos pela especificação do projeto, incluindo:

| Requisito da especificação | Implementação |
|----------------------------|---------------|
| Compatibilidade com navegadores suportados | HTML, CSS e JavaScript executados no navegador |
| Validação de formulários | JavaScript e validações no servidor |
| Processamento da imagem no servidor | Java 2D (Graphics2D e ImageIO) |
| Segurança contra SQL Injection | PreparedStatement |
| Proteção contra XSS | Escape e validação de entradas |
| Proteção contra CSRF | Token CSRF |
| Upload seguro de arquivos | Validação por extensão, MIME Type e tamanho |
| Armazenamento seguro de senhas | BCrypt |
| Containerização | Docker e Docker Compose |

---

# Justificativa da Escolha Tecnológica

A escolha da plataforma Java não altera o escopo nem os requisitos definidos para o projeto.

Toda a lógica funcional permanece aderente à especificação oficial do Camagru, sendo implementada por meio de recursos equivalentes aos disponíveis na biblioteca padrão do PHP.

Além de atender aos requisitos obrigatórios, a utilização do ecossistema Jakarta EE proporciona:

- organização da aplicação em camadas bem definidas;
- separação entre apresentação, regras de negócio e persistência;
- reutilização de componentes;
- maior facilidade para testes e manutenção;
- aderência às práticas utilizadas em aplicações web corporativas.

Dessa forma, a implementação preserva integralmente o comportamento esperado pela especificação, utilizando uma tecnologia diferente, porém tecnicamente equivalente.