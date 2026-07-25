import 'package:flutter/material.dart';

import 'package:projeto_autonomos/controllers/cadastro_controller.dart';
import 'package:projeto_autonomos/models/usuario.dart';


class CadastroScreen extends StatefulWidget {

  const CadastroScreen({super.key});


  @override
  State<CadastroScreen> createState() =>
      _CadastroScreenState();
}



class _CadastroScreenState extends State<CadastroScreen> {


  final CadastroController controller =
      CadastroController();



  final _formKey =
      GlobalKey<FormState>();


  final nomeController =
      TextEditingController();


  final emailController =
      TextEditingController();


  final telefoneController =
      TextEditingController();


  final senhaController =
      TextEditingController();


  final confirmarSenhaController =
      TextEditingController();



  bool esconderSenha = true;


  bool carregando = false;



  @override
  void dispose() {


    nomeController.dispose();

    emailController.dispose();

    telefoneController.dispose();

    senhaController.dispose();

    confirmarSenhaController.dispose();


    super.dispose();

  }




  Future<void> cadastrar() async {


    if (!_formKey.currentState!.validate()) {

      return;

    }



    if (senhaController.text !=
        confirmarSenhaController.text) {


      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content:
              Text("As senhas não coincidem"),
        ),

      );


      return;

    }



    setState(() {

      carregando = true;

    });



    Usuario usuario = Usuario(

      id: "",

      nome:
          nomeController.text.trim(),


      email:
          emailController.text.trim(),


      telefone:
          telefoneController.text.trim(),


      fotoPerfil:
          "",

    );



    String? erro =
        await controller.cadastrarUsuario(

          usuario: usuario,

          senha:
              senhaController.text.trim(),

        );



    setState(() {

      carregando = false;

    });



    if (erro == null) {


      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content:
              Text("Cadastro realizado com sucesso"),
        ),

      );


      Navigator.pop(context);


    } else {


      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content:
              Text(erro),
        ),

      );


    }


  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title:
            const Text("Criar conta"),

        centerTitle:
            true,

      ),



      body: SingleChildScrollView(


        padding:
            const EdgeInsets.all(20),



        child: Form(


          key:
              _formKey,



          child: Column(


            children: [



              const Icon(

                Icons.person_add,

                size:100,

                color:Colors.blue,

              ),



              const SizedBox(
                height:30,
              ),



              TextFormField(

                controller:
                    nomeController,


                decoration:
                    const InputDecoration(

                  labelText:
                      "Nome completo",

                  prefixIcon:
                      Icon(Icons.person),

                  border:
                      OutlineInputBorder(),

                ),



                validator:(value){


                  if(value == null ||
                     value.isEmpty){


                    return
                    "Informe seu nome";


                  }


                  return null;


                },


              ),




              const SizedBox(
                height:15,
              ),




              TextFormField(


                controller:
                    emailController,


                keyboardType:
                    TextInputType.emailAddress,



                decoration:
                    const InputDecoration(

                  labelText:
                      "E-mail",

                  prefixIcon:
                      Icon(Icons.email),

                  border:
                      OutlineInputBorder(),

                ),




                validator:(value){


                  if(value == null ||
                     value.isEmpty){


                    return
                    "Informe seu e-mail";


                  }


                  return null;


                },


              ),





              const SizedBox(
                height:15,
              ),




              TextFormField(


                controller:
                    telefoneController,



                keyboardType:
                    TextInputType.phone,



                decoration:
                    const InputDecoration(

                  labelText:
                      "Telefone",

                  prefixIcon:
                      Icon(Icons.phone),

                  border:
                      OutlineInputBorder(),

                ),



              ),




              const SizedBox(
                height:15,
              ),





              TextFormField(


                controller:
                    senhaController,



                obscureText:
                    esconderSenha,



                decoration:
                    InputDecoration(


                  labelText:
                      "Senha",


                  prefixIcon:
                      const Icon(Icons.lock),



                  suffixIcon:
                      IconButton(

                    icon:
                    Icon(

                      esconderSenha

                      ? Icons.visibility

                      : Icons.visibility_off,

                    ),



                    onPressed:(){


                      setState(() {

                        esconderSenha =
                        !esconderSenha;


                      });


                    },

                  ),



                  border:
                      const OutlineInputBorder(),


                ),




                validator:(value){


                  if(value == null ||
                     value.length < 6){


                    return
                    "Senha deve ter 6 caracteres";


                  }


                  return null;


                },


              ),






              const SizedBox(
                height:15,
              ),






              TextFormField(


                controller:
                    confirmarSenhaController,



                obscureText:
                    true,



                decoration:
                    const InputDecoration(

                  labelText:
                      "Confirmar senha",

                  prefixIcon:
                      Icon(Icons.lock),

                  border:
                      OutlineInputBorder(),

                ),


              ),





              const SizedBox(
                height:25,
              ),





              SizedBox(


                width:
                    double.infinity,



                height:
                    50,



                child:
                ElevatedButton(



                  onPressed:
                  carregando
                  ? null
                  : cadastrar,



                  child:
                  carregando

                  ? const CircularProgressIndicator()

                  : const Text(

                    "Cadastrar",

                    style:
                    TextStyle(
                      fontSize:18,
                    ),

                  ),



                ),


              ),



            ],


          ),


        ),


      ),


    );


  }

}