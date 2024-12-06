import 'package:cloud_firestore/cloud_firestore.dart';
import 'veiculo.dart';

class FirebaseService {
  // Referência para a coleção de veículos no Firestore
  final CollectionReference _veiculos = FirebaseFirestore.instance.collection('veiculos');

  Future<void> cadastrarVeiculo(Veiculo veiculo) async {
    await _veiculos.add(veiculo.toMap());
  }

  Future<List<Veiculo>> buscarVeiculos() async {
    final snapshot = await _veiculos.get();
    return snapshot.docs.map((doc) => Veiculo.fromMap(doc.id, doc.data() as Map<String, dynamic>)).toList();
  }

  Future<void> registrarManutencao(String veiculoId, Map<String, dynamic> manutencao) async {
    await _veiculos.doc(veiculoId).collection('manutencoes').add(manutencao);
  }

  Future<Veiculo> buscarVeiculoPorId(String veiculoId) async {
    try {
      DocumentSnapshot doc = await _veiculos.doc(veiculoId).get();

      if (doc.exists) {
        // Supondo que você tenha um método `fromFirestore` na sua classe Veiculo
        return Veiculo.fromFirestore(doc);
      } else {
        throw Exception('Veículo não encontrado');
      }
    } catch (e) {
      throw Exception('Erro ao buscar veículo: $e');
    }
  }
  
  Future<void> salvarChecklist(String veiculoId, String tipo, Map<String, bool> checklist, String observacao) async {
    await _veiculos
        .doc(veiculoId)
        .collection(tipo) // Subcoleção baseada no tipo de checklist
        .add({
      'checklist': checklist,
      'observacao': observacao,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

    Future<void> editarVeiculo(String id, Map<String, dynamic> dadosAtualizados) async {
    await _veiculos.doc(id).update(dadosAtualizados);
  }

  Future<void> deletarVeiculo(String id) async {
    await _veiculos.doc(id).delete();
  }
    Future<void> atualizarVeiculo(Veiculo veiculo) async {
    try {
      await _veiculos.doc(veiculo.id).update(veiculo.toMap());
    } catch (e) {
      print("Erro ao atualizar veículo: $e");
    }
  }

  Future<void> salvarChecklistServicos(String veiculoId, Map<String, dynamic> checklistData) async {
    try {
      await _veiculos.doc(veiculoId).collection('checklist_servicos').add(checklistData);
    } catch (e) {
      print("Erro ao salvar checklist de serviços: $e");
    }
  }

  Future<void> salvarChecklistManutencao(String veiculoId, Map<String, dynamic> checklistData) async {
    try {
      await _veiculos.doc(veiculoId).collection('checklist_manutencao').add(checklistData);
    } catch (e) {
      print("Erro ao salvar checklist de manutenção: $e");
    }
  }
}

