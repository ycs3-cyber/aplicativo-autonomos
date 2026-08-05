import 'package:flutter/material.dart';

class CategoriaCard extends StatelessWidget {

  final IconData icone;
  final String titulo;

  const CategoriaCard({
    super.key,
    required this.icone,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 10),

      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Icon(
            icone,
            size: 35,
            color: Colors.blue,
          ),

          SizedBox(height: 10),

          Text(
            titulo,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}