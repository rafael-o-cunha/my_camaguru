## Criar, configurar e iniciar o projeto (1)

### Setup base

- [X] criar projeto

```Shell
cd ..
mvn archetype:generate \
  -DgroupId=com.camaguru \
  -DartifactId=app \
  -DarchetypeArtifactId=maven-archetype-webapp \
  -DarchetypeVersion=1.4 \
  -DinteractiveMode=false
```

- [ ] configurar containers (aplicação e banco de dados)
- [ ] iniciar projeto webapp
- [ ] configurar pom.xml  [1]
- [ ] rodar projeto para validar
- [ ] iniciar projeto webapp
- [X] configurar pom.xml
