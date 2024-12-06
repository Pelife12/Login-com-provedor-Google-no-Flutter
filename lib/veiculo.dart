import 'package:cloud_firestore/cloud_firestore.dart';

class Veiculo {
  final String id;
  final String marca;
  final String modelo;
  final String placa;

  Veiculo({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.placa,
  });

  Map<String, dynamic> toMap() {
    return {
      'marca': marca,
      'modelo': modelo,
      'placa': placa,
    };
  }

  factory Veiculo.fromMap(String id, Map<String, dynamic> map) {
    return Veiculo(
      id: id,
      marca: map['marca'],
      modelo: map['modelo'],
      placa: map['placa'],
    );
  }

  // Método para criar uma instância de Veiculo a partir de um DocumentSnapshot
  factory Veiculo.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>; // Verifica se o tipo é Map
    return Veiculo(
      id: doc.id, // O ID do documento
      marca: data['marca'] ?? '', // Substitua 'marca' pelo nome correto do campo
      modelo: data['modelo'] ?? '', // Substitua 'modelo' pelo nome correto do campo
      placa: data['placa'] ?? '', // Substitua 'placa' pelo nome correto do campo
    );
  }
}
