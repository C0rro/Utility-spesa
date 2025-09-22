import 'package:hive/hive.dart';
import 'package:utility_spesa/categorie.dart';
import 'package:utility_spesa/posizioni.dart';


part 'alimento.g.dart';

@HiveType(typeId: 0)
class Alimento extends HiveObject {

  @HiveField(0)
  String nome;

  @HiveField(1)
  String marca;

  @HiveField(2)
  int quantita;

  @HiveField(3)
  double costo;

  @HiveField(4)
  DateTime dataDiAcquisto;

  @HiveField(5)
  DateTime dataDiScadenza;

  @HiveField(6)
  categorie categoria;

  @HiveField(7)
  posizioni posizione;



  Alimento(this.nome, this.marca, this.quantita, this.costo, this.dataDiAcquisto, this.dataDiScadenza, this.categoria, this.posizione);


  String dataScadenzaToString(){
    return "${this.dataDiScadenza?.day}/${this.dataDiScadenza?.month}/${this.dataDiScadenza?.year}";
  }
  String dataAcquistoToString(){
    return "${this.dataDiAcquisto?.day}/${this.dataDiAcquisto?.month}/${this.dataDiAcquisto?.year}";
  }
}
