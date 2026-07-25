import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController senhaController = TextEditingController();

  bool esconderSenha = true;

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  void realizarLogin() {

    if (_formKey.currentState!.validate()) {

      String email = emailController.text.trim();

      String senha = senhaController.text.trim();

      print(email);
      print(senha);

      //Aqui chamaremos o AuthController futuramente

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(20),

          child: Form(

            key: _formKey,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [

                const SizedBox(height: 40),

                const Icon(
                  Icons.person,
                  size: 120,
                  color: Colors.blue,
                ),

                const SizedBox(height: 40),

                TextFormField(

                  controller: emailController,

                  keyboardType: TextInputType.emailAddress,

                  decoration: const InputDecoration(

                    labelText: "E-mail",

                    border: OutlineInputBorder(),

                    prefixIcon: Icon(Icons.email),

                  ),

                  validator: (value){

                    if(value == null || value.isEmpty){

                      return "Informe o e-mail";

                    }

                    return null;

                  },

                ),

                const SizedBox(height:20),

                TextFormField(

                  controller: senhaController,

                  obscureText: esconderSenha,

                  decoration: InputDecoration(

                    labelText: "Senha",

                    border: const OutlineInputBorder(),

                    prefixIcon: const Icon(Icons.lock),

                    suffixIcon: IconButton(

                      icon: Icon(

                        esconderSenha
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),

                      onPressed: (){

                        setState(() {

                          esconderSenha = !esconderSenha;

                        });

                      },

                    ),

                  ),

                  validator: (value){

                    if(value == null || value.isEmpty){

                      return "Informe a senha";

                    }

                    return null;

                  },

                ),

                const SizedBox(height:25),

                SizedBox(

                  height: 50,

                  child: ElevatedButton(

                    onPressed: realizarLogin,

                    child: const Text(

                      "Entrar",

                      style: TextStyle(fontSize:18),

                    ),

                  ),

                ),

                const SizedBox(height:15),

                TextButton(

                  onPressed: () {

                    //Ir para Recuperar Senha

                  },

                  child: const Text("Esqueci minha senha"),

                ),

                TextButton(

                  onPressed: () {

                    //Ir para Cadastro

                  },

                  child: const Text("Criar uma conta"),

                ),

              ],

            ),

          ),

        ),

      ),

    );

  }

}