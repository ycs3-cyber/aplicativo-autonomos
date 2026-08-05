import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/usuario.dart';


class UsuarioRepository {


  final FirebaseAuth _auth =
      FirebaseAuth.instance;


  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;



  // ============================
  // CADASTRAR USUÁRIO
  // ============================

  Future<void> cadastrarUsuario({

    required Usuario usuario,

    required String senha,

  }) async {


    try {


      // Cria usuário no Firebase Authentication

      UserCredential credencial =
          await _auth.createUserWithEmailAndPassword(

        email: usuario.email,

        password: senha,

      );



      // Pega o ID criado pelo Firebase

      String uid =
          credencial.user!.uid;



      // Cria usuário atualizado com o ID correto

      Usuario novoUsuario = Usuario(

        id: uid,

        nome: usuario.nome,

        email: usuario.email,

        telefone: usuario.telefone,

        fotoPerfil: usuario.fotoPerfil,

        endereco: usuario.endereco,

        favoritos: usuario.favoritos,

      );



      // Salva no Firestore

      await _firestore
          .collection("usuarios")
          .doc(uid)
          .set(
            novoUsuario.toMap(),
          );



    } on FirebaseAuthException catch(e) {


      throw Exception(
        e.message ?? "Erro ao cadastrar usuário",
      );


    } catch(e) {


      throw Exception(
        "Erro inesperado ao cadastrar usuário",
      );


    }

  }




  // ============================
  // BUSCAR USUÁRIO LOGADO
  // ============================

  Future<Usuario?> buscarUsuarioLogado() async {


    try {


      User? usuarioFirebase =
          _auth.currentUser;



      if(usuarioFirebase == null){

        return null;

      }



      DocumentSnapshot doc =
          await _firestore
              .collection("usuarios")
              .doc(usuarioFirebase.uid)
              .get();



      if(!doc.exists){

        return null;

      }



      return Usuario.fromMap(

        doc.data()
            as Map<String,dynamic>,

      );



    } catch(e) {


      throw Exception(
        "Erro ao buscar usuário",
      );


    }

  }





  // ============================
  // ATUALIZAR PERFIL
  // ============================

  Future<void> atualizarUsuario(
      Usuario usuario) async {


    try {


      await _firestore
          .collection("usuarios")
          .doc(usuario.id)
          .update(

            usuario.toMap(),

          );



    } catch(e){


      throw Exception(
        "Erro ao atualizar usuário",
      );


    }

  }





  // ============================
  // LOGOUT
  // ============================

  Future<void> logout() async {


    await _auth.signOut();


  }



}