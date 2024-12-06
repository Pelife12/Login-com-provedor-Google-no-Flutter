<b>Alunos:</b> André Ramos da Silva, Felipe Bogo e Thierry Augusto Busnardo

Desenvolvido um aplicativo em Flutter para autenticação de usuários utilizando o provedor Google junto do Firebase.




# Listagem de funções por tela

* Tela de login: 

<b>1. Função _checkIfUserIsLoggedIn():</b>

Função para verificar se o usuário já está logado na aplicação e caso esteja já o envia para tela inicial, se não mantém na tela de login.
Cria uma instância do Firebase “final FirebaseAuth _auth = FirebaseAuth.instance” e busca o usuário da instância criada “User? user = _auth.currentUser”, caso “user” não seja nulo redireciona para tela inicial.



<b>2. Função _signInWithGoogle():</b>

Função para realizar o login com o provedor Google utilizando sua API. 

Inicia o fluxo de login com a API de login do Google “final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn()”, caso o “googleUser” sege nulo, irá retornar uma mensagem de erro. Após isso obtém todas as credências necessárias de autenticação do Google “final GoogleSignInAuthentication googleAuth = await googleUser.authentication”, se as credências não forem nulas irá realizar a autenticação do Firebase utilizando estás credências do token de acesso e ID do token
“final AuthCredential credential = GoogleAuthProvider.credential( 
  accessToken: googleAuth.accessToken, 
  idToken: googleAuth.idToken, 
);”. 
Com isso será feito a o login no Firebase passando como parâmetro as credências criadas na variável “credential” e se no login não ocorrer nenhum erro será redirecionado para a tela inicial do aplicativo exibindo o e-mail que realizou o login. 

* Tela Inicial (Home): 

Buscas as informações do usuário logado e exibe o e-mail cadastrado na tela.
Cria uma instância do Firebase buscando pelo usuário que está autenticado após a realização do login “User? user = FirebaseAuth.instance.currentUser;”, caso o “user” não retorne nulo, irá exibir na tela o e-mail cadastrado do usuário.




# Listagem de tipos de erros do provedor Google

 <b>1. ERROR_ABORTED_BY_USER:</b> O login foi interrompido pelo usuário. Isso ocorre quando o usuário cancela o processo de login antes de ser concluído. 

 <b>2. ERROR_CANCELED:</b> O fluxo de autenticação foi cancelado. Pode ocorrer quando o usuário escolhe não autenticar sua conta no Google. 

 <b>3. ERROR_FAILED:</b> Um erro geral ocorre durante o processo de login. Pode ser causado por vários fatores, como falha na rede, erros temporários no servidor, etc. 

 <b>4. ERROR_NETWORK_REQUEST_FAILED:</b> Falha de rede durante a solicitação de login, como problemas com a conectividade da internet. 

 <b>5. ERROR_USER_DISABLED:</b> O usuário foi desabilitado no Firebase, talvez por violação de políticas de uso. 

 <b>6. ERROR_USER_NOT_FOUND:</b> O usuário não foi encontrado no Firebase ao tentar autenticar. 

 <b>7. ERROR_WRONG_PASSWORD:</b> Erro de senha ao tentar realizar o login com um provedor de autenticação. 

 <b>8. ERROR_INVALID_CREDENTIAL:</b> As credenciais fornecidas são inválidas. Esse erro pode ocorrer se a autenticação não foi feita corretamente, como um accessToken ou idToken inválido.


# Listagem de dependências utilizadas e suas versões

 * cupertino_icons: ^1.0.8 
 * firebase_core: ^2.8.0 
 * cloud_firestore: ^4.8.0 
 * google_sign_in: ^6.0.2 
 * firebase_auth: ^4.16.4



# Instruções para configuração

<b>1. Pré-requisitos</b>

Antes de iniciar, certifique-se de que o ambiente está pronto: 

* Flutter SDK: Instalado e configurado no PATH. 
* Dart SDK: Integrado ao Flutter. 
* Git: Instalado e configurado. 
* IDE recomendada: VS Code ou Android Studio, com os plugins Flutter e Dart instalados. 
* Acesse o terminal e execute o comando flutter doctor para garantir que tudo está funcionando.

<b>2. Clonando o Projeto do GitHub</b>

* Acesse o repositório no GitHub. 
* Copie a URL do repositório (HTTPS ou SSH). 
* No terminal, execute:

![image](https://github.com/user-attachments/assets/291f7d1e-cbea-4e45-a075-a9296271ce50)

* Entre na pasta do projeto:

![image](https://github.com/user-attachments/assets/cc5c679c-f09a-42a8-a36f-5feb501048f3)

<b>3. Configurando o SDK Flutter</b>

Verifique a versão requerida pelo projeto:

* Geralmente, está no arquivo pubspec.yaml, na seção environment:

  ![image](https://github.com/user-attachments/assets/84ab3e59-999d-465a-b5f6-193e1081d289)


<b>4. Instalando as Dependências</b>

* Instale os pacotes do projeto:

![image](https://github.com/user-attachments/assets/5ceb94fe-6fd3-4186-b2e8-9d8bc48a5ebc)


* Se o projeto usar arquivos específicos (como .env ou assets), configure-os conforme a documentação do repositório.


<b>5. Configurando o Ambiente</b>

Certifique-se de que um emulador ou dispositivo físico está conectado. 

* Para garantir a compatibilidade, execute:

![image](https://github.com/user-attachments/assets/dca7c32b-9a77-4fd6-b74c-6a4ffd105de9)


<b>6. Executando o Projeto</b>

* Inicie a aplicação no dispositivo: 

![image](https://github.com/user-attachments/assets/56b6ae58-1508-48d4-a80b-110c168ca043)

* Para debugar, abra a IDE preferida e selecione Run ou Debug.

<b>7. Versões Mais Recentes do Flutter e Dart</b>

Você pode verificar as versões mais atuais diretamente no site oficial Flutter SDK Releases. Porém, aqui estão as versões mais recentes (atualizadas até dezembro de 2024): 

* Flutter: 3.13.0 (ou superior).
* Dart: 3.1.0 (integrado ao Flutter).

Para verificar e atualizar o Flutter:

![image](https://github.com/user-attachments/assets/9684b938-d70e-428a-98ea-870126aa2edd)







  






