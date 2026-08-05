import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../controllers/busca_controller.dart';
import '../../widgets/home/custom_search_bar.dart';
import '../../widgets/home/profissional_card.dart';

class BuscaScreen extends StatefulWidget {
  const BuscaScreen({super.key});

  @override
  State<BuscaScreen> createState() => _BuscaScreenState();
}

class _BuscaScreenState extends State<BuscaScreen> {
  final BuscaController _controller = BuscaController();

  final TextEditingController _searchController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.carregarProfissionais();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _controller.dispose();
    super.dispose();
  }

  Widget _categoriaChip(String categoria) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ActionChip(
        label: Text(categoria),
        onPressed: () {
          if (categoria == "Todos") {
            _controller.carregarProfissionais();
          } else {
            _controller.pesquisarCategoria(categoria);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Buscar profissionais"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppSizes.padding),
            child: Column(
              children: [
                HomeSearchBar(
                  controller: _searchController,
                  hintText: "Pesquisar por nome ou profissão",
                  onChanged: (value) {
                    _controller.pesquisar(value);
                  },
                ),

                const SizedBox(height: 16),

                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _categoriaChip("Todos"),
                      _categoriaChip("Eletricista"),
                      _categoriaChip("Pedreiro"),
                      _categoriaChip("Pintor"),
                      _categoriaChip("Diarista"),
                      _categoriaChip("Encanador"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: _controller.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : _controller.profissionais.isEmpty
                          ? const Center(
                              child: Text(
                                "Nenhum profissional encontrado.",
                              ),
                            )
                          : ListView.builder(
                              itemCount:
                                  _controller.profissionais.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 12),
                                  child: ProfissionalCard(
                                    profissional:
                                        _controller.profissionais[index],
                                  ),
                                );
                              },
                            ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}