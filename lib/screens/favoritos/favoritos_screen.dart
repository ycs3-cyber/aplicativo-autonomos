import 'package:flutter/material.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Favoritos"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Card(
            margin: EdgeInsets.only(bottom: 15),
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                child: Icon(Icons.person),
              ),

              title: Text(
                "Carlos Henrique",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 5),

                  Text("Eletricista"),

                  SizedBox(height: 5),

                  Row(
                    children: [

                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.red,
                      ),

                      SizedBox(width: 4),

                      Text("Maceió - AL"),
                    ],
                  ),

                  SizedBox(height: 5),

                  Row(
                    children: [

                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),

                      SizedBox(width: 4),

                      Text("4.8"),
                    ],
                  ),
                ],
              ),

              trailing: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}