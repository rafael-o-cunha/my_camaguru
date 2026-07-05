# Capacidades Técnicas

```text
Camagru
│
├── Autenticação
├── Envio de E-mail
├── Segurança
├── CRUD
├── Upload
├── Webcam
├── Processamento de Imagem
├── Persistência
├── Interface Web
├── HTTP
├── DevOps
├── AJAX (Bônus)
└── Administração (Bônus)
```

---

# Arquitetura em camadas

- Browser
- JSP (Views)
- Servlets (Controllers)
- Services
- DAO
- PostgreSQL
- Storage

---

# Estrutura do Projeto

```text
camagru/
├── app/
│   ├── pom.xml
│   └── src/
│       └── main/
│           ├── java/
│           │   └── com/
│           │       └── rafade-o/
│           │           └── camagru/
│           │               ├── controller/
│           │               ├── service/
│           │               ├── dao/
│           │               ├── model/
│           │               ├── dto/
│           │               ├── validation/
│           │               ├── security/
│           │               ├── config/
│           │               ├── util/
│           │               └── exception/
│           │
│           ├── resources/
│           └── webapp/
│               │
│               ├── assets/
│               │   ├── css/
│               │   ├── js/
│               │   ├── images/
│               │   └── stickers/
│               │
│               ├── uploads/
│               │
│               ├── views/
│               │   ├── auth/
│               │   ├── gallery/
│               │   ├── editor/
│               │   ├── profile/
│               │   ├── admin/
│               │   ├── error/
│               │   └── shared/
│               │
│               └── WEB-INF/
│                   └── web.xml
│
├── docs/
│   ├── 01-requisitos.md
│   ├── 02-regras-negocio.md
│   ├── 03-modelagem.md
│   ├── 04-capacidades-e-arquitetura.md
│   └── 05-php-java-equivalencia.md
│
├── infra/
│   │
│   ├── app/
│   │   └── Dockerfile
│   │
│   ├── postgres/
│   │   ├── init.sql
│   │   ├── schema.sql
│   │   ├── seed.sql
│   │   └── data/
│   │
│   └── docker-compose.yml
│
├── Makefile
├── README.md
└── notas.md
```