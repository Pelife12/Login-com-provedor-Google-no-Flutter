Alunos: André Ramos da Silva, Felipe Bogo e Thierry Augusto Busnardo

Desenvolvido um aplicativo em Flutter para autenticação de usuários utilizando o provedor Google junto do Firebase.




* Listagem de funções por tela

Tela de login: 

- Função _checkIfUserIsLoggedIn(): 

Função para verificar se o usuário já está logado na aplicação e caso esteja já o envia para tela inicial, se não mantém na tela de login.
Cria uma instância do Firebase “final FirebaseAuth _auth = FirebaseAuth.instance” e busca o usuário da instância criada “User? user = _auth.currentUser”, caso “user” não seja nulo redireciona para tela inicial.

- Função _signInWithGoogle(): 

Função para realizar o login com o provedor Google utilizando sua API. 

Inicia o fluxo de login com a API de login do Google “final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn()”, caso o “googleUser” sege nulo, irá retornar uma mensagem de erro. Após isso obtém todas as credências necessárias de autenticação do Google “final GoogleSignInAuthentication googleAuth = await googleUser.authentication”, se as credências não forem nulas irá realizar a autenticação do Firebase utilizando estás credências do token de acesso e ID do token
“final AuthCredential credential = GoogleAuthProvider.credential( 
  accessToken: googleAuth.accessToken, 
  idToken: googleAuth.idToken, 
);”. 
Com isso será feito a o login no Firebase passando como parâmetro as credências criadas na variável “credential” e se no login não ocorrer nenhum erro será redirecionado para a tela inicial do aplicativo exibindo o e-mail que realizou o login. 

Tela Inicial (Home): 

Buscas as informações do usuário logado e exibe o e-mail cadastrado na tela.
Cria uma instância do Firebase buscando pelo usuário que está autenticado após a realização do login “User? user = FirebaseAuth.instance.currentUser;”, caso o “user” não retorne nulo, irá exibir na tela o e-mail cadastrado do usuário.




* Listagem de tipos de erros do provedor Google

 - ERROR_ABORTED_BY_USER: O login foi interrompido pelo usuário. Isso ocorre quando o usuário cancela o processo de login antes de ser concluído. 

 - ERROR_CANCELED: O fluxo de autenticação foi cancelado. Pode ocorrer quando o usuário escolhe não autenticar sua conta no Google. 

 - ERROR_FAILED: Um erro geral ocorre durante o processo de login. Pode ser causado por vários fatores, como falha na rede, erros temporários no servidor, etc. 

 - ERROR_NETWORK_REQUEST_FAILED: Falha de rede durante a solicitação de login, como problemas com a conectividade da internet. 

 - ERROR_USER_DISABLED: O usuário foi desabilitado no Firebase, talvez por violação de políticas de uso. 

 - ERROR_USER_NOT_FOUND: O usuário não foi encontrado no Firebase ao tentar autenticar. 

 - ERROR_WRONG_PASSWORD: Erro de senha ao tentar realizar o login com um provedor de autenticação. 

 - ERROR_INVALID_CREDENTIAL: As credenciais fornecidas são inválidas. Esse erro pode ocorrer se a autenticação não foi feita corretamente, como um accessToken ou idToken inválido.


* Listagem de dependências utilizadas e suas versões

 - cupertino_icons: ^1.0.8 
 - firebase_core: ^2.8.0 
 - cloud_firestore: ^4.8.0 
 - google_sign_in: ^6.0.2 
 - firebase_auth: ^4.16.4



* Instruções para configuração

1. Pré-requisitos 

Antes de iniciar, certifique-se de que o ambiente está pronto: 

- Flutter SDK: Instalado e configurado no PATH. 
- Dart SDK: Integrado ao Flutter. 
- Git: Instalado e configurado. 
- IDE recomendada: VS Code ou Android Studio, com os plugins Flutter e Dart instalados. 
- Acesse o terminal e execute o comando flutter doctor para garantir que tudo está funcionando.

2. Clonando o Projeto do GitHub 

- Acesse o repositório no GitHub. 
- Copie a URL do repositório (HTTPS ou SSH). 
- No terminal, execute:
![image](https://github.com/user-attachments/assets/291f7d1e-cbea-4e45-a075-a9296271ce50)

- Entre na pasta do projeto:
![image](https://github.com/user-attachments/assets/cc5c679c-f09a-42a8-a36f-5feb501048f3)

3. Configurando o SDK Flutter 

Verifique a versão requerida pelo projeto:
Geralmente, está no arquivo pubspec.yaml, na seção environment:

![image](https://github.com/user-attachments/assets/84ab3e59-999d-465a-b5f6-193e1081d289)






