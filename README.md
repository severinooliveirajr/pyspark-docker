Criar um ambiente PySpark para desenvolvimento, testes e aprendizado, utilizando Docker.

1. Pré-requisitos
   Esse projeto foi montado no Ubuntu. Até o momento não foi testado no Windows.
   Para utilizar o ambiente, é preciso ter os seguites recursos instalado na máquina:
   - Docker: para gerenciar os containers.
   - Docker Composo: para definir e rodar aplicações multi-container.
  
2. Dockerfile
   O Dockerfile define a imagem Docker que será usada para o ambiente de desenvolvimento Pyspark.

3. docker-compose.yml
   O arquivo 'docker-compose,yml' define os serviços, redes e volumes que a aplicação precisa.

4. Estruturade diretórios

  meu_projeto_pyspark/
  │
  ├── Dockerfile
  ├── docker-compose.yml
  └── src/
      └── seu_codigo.py
  └── data/

5. Construir e iniciar o Container
  - Construir a imagem Docker:
    docker-compose build

  Iniciar o serviço Pyspark
    docker-compose up -d

  Acessar o container PySpark:
    Listar Containers em execução:
      docker ps
    Executar o comando 'docker exec' para acessar o shell do container Pyspark.Substitua <nome_do_container_ou_id> pelo nome ou ID do container do PySpark que você encontrou no passo anterior:
      docker exec -it <nome_do_container_ou_id> /bin/bash
    Executar o shell PySpark:
      pyspark      

6. Acessar o Jupyter
  No navegador, acesse http://localhost:8888
  Para acessar o Jupyter Notebook, geralmente é necessário um token de autenticação.Esse token é gerado automaticamente quando o Jupyter Notebook é iniciado e é usado para autenticação inicial no navegador.
  Para obter o token nesse projeto, pode seguir os passos abaixo:
    - Listar Containers em execução:
        docker ps
    - Procure pelo nome do serviço ou imagem que está executando o Jupyter. Ex. 'jupyter', 'notebook', etc.
    - Use o comando abaixo para visualizar os logs do container Jupyter, substituindo '<nome_do_container_ou_id> pelo nome ou ID do container encontrado anteriormente:
        docker logs <nome_do_container_ou_id>
    - Procurar pelo token
        Nos logs, você verá uma linha parecida com essa abaixo, que contém o token:
          http://127.0.0.1:8888/?token=abc123def456ghi789
        O token é a sequência de caracteres após '?token='.

8. Desenvolvimento e Testes
  Com o container rodando, é possível colocar os scripts Python na pasta 'src' e testá-los diretamente no ambiente Pyspark configurado, permitindo uma forma eficaz de desenvolver e testar os códigos em ambiente isolado e consistente.
  Os arquivos para processamento devem ser colocados no diretório 'data'.

10. Parar e Remover Containers
  Para parar o serviço, usar 'Ctrl + c' no terminal onde o 'docker-compose up' está sendo executado.
  Para remover os containers e volumes, execute:
    docker-compose down
