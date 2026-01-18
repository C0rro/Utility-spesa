import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utility_spesa/categorie.dart';
import 'package:utility_spesa/dataManager.dart';
import 'package:utility_spesa/alimento.dart';
import 'package:utility_spesa/barCodeHandler.dart';
import 'package:utility_spesa/posizioni.dart';

class AggiungiScansionePage extends StatefulWidget {

  final String? codiceABarre;
  final Alimento? alimento;
  const AggiungiScansionePage({super.key, this.codiceABarre, this.alimento});

  @override
  State<AggiungiScansionePage> createState() => _AggiungiScansionePageState();
}

class _AggiungiScansionePageState extends State<AggiungiScansionePage> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _marcaController = TextEditingController();
  final _quantitaController = TextEditingController();
  final _costoController = TextEditingController();
  DateTime? _dataDiAcquisto;
  String? _dataDiAcquistoEtichetta;
  DateTime? _dataDiScadenza;
  String? _dataDiScadenzaEtichetta;
  categorie? _categoriaSelezionata;
  posizioni? _posizioneSelezionata;

  @override
  void initState() {
    super.initState();
    if (widget.codiceABarre != null) {
      _caricaDati(widget.codiceABarre!);
    }
    if(widget.alimento != null){
      final a = widget.alimento!;
      _nomeController.text = a.nome;
      _marcaController.text = a.marca;
      _quantitaController.text = a.quantita.toString();
      _costoController.text = a.costo.toString();
      _dataDiAcquisto = a.dataDiAcquisto;
      _dataDiScadenza = a.dataDiScadenza;
      _dataDiAcquistoEtichetta = "${a.dataDiAcquisto.day}/${a.dataDiAcquisto.month}/${a.dataDiAcquisto.year}";
      _dataDiScadenzaEtichetta = "${a.dataDiScadenza.day}/${a.dataDiScadenza.month}/${a.dataDiScadenza.year}";
      _categoriaSelezionata = a.categoria;
      _posizioneSelezionata = a.posizione;
    }
  }

  Future<void> _caricaDati(String codice) async {
    setState(() {
      _isLoading = true;
    });

    final nome = await getNomeAlimento(codice);
    final marca = await getMarcaAlimento(codice);

    setState(() {
      _nomeController.text = nome;
      _marcaController.text = marca;
      _isLoading = false;
    });
  }



  Future<void> _selezionaDataAcquisto(inContext) async {
    _dataDiAcquisto = await showDatePicker(
      context: inContext,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );
    if (_dataDiAcquisto != null) {
      setState(() {
        _dataDiAcquistoEtichetta = "${_dataDiAcquisto?.day}/${_dataDiAcquisto?.month}/${_dataDiAcquisto?.year}";
      });
    }
  }
  Future<void> _selezionaDataScadenza(inContext) async {
    _dataDiScadenza = await showDatePicker(
      context: inContext,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );
    if (_dataDiScadenza != null) {
      setState(() {
        _dataDiScadenzaEtichetta = "${_dataDiScadenza?.day}/${_dataDiScadenza?.month}/${_dataDiScadenza?.year}";
      });
    }
  }

  void _salvaAlimento() {
    if (_formKey.currentState!.validate() && _dataDiScadenza != null && _dataDiAcquisto != null) {
      if (widget.alimento != null) {

        final a = widget.alimento!;
        a.nome = _nomeController.text.trim();
        a.marca = _marcaController.text.trim();
        a.quantita = int.parse(_quantitaController.text);
        a.costo = double.parse(_costoController.text);
        a.dataDiAcquisto = _dataDiAcquisto!;
        a.dataDiScadenza = _dataDiScadenza!;
        a.categoria = _categoriaSelezionata!;
        a.posizione = _posizioneSelezionata!;
        Provider.of<DataManager>(context, listen: false).modificaAlimento(a);
      } else {

        final nuovoAlimento = Alimento(
          _nomeController.text.trim(),
          _marcaController.text.trim(),
          int.parse(_quantitaController.text),
          double.parse(_costoController.text),
          _dataDiAcquisto!,
          _dataDiScadenza!,
          _categoriaSelezionata!,
          _posizioneSelezionata!,
        );
        Provider.of<DataManager>(context, listen: false).addAlimento(nuovoAlimento);
      }

      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _quantitaController.dispose();
    _costoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.alimento == null ? 'Aggiungi Alimento' : 'Modifica ${_nomeController.text}'),
      ),
      body: _isLoading
        ? const Center(child: CircularProgressIndicator(),)

      : Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.trim().isEmpty ? 'Inserisci un nome' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _marcaController,
                decoration: const InputDecoration(
                  labelText: 'Marca',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.trim().isEmpty ? 'Inserisci una marca' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _quantitaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantità',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || int.tryParse(value) == null ? 'Inserisci una quantità valida' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _costoController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Prezzo',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || double.tryParse(value) == null ? 'Inserisci un prezzo valido' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<categorie>(
                value: _categoriaSelezionata,
                decoration: const InputDecoration(
                  labelText: 'Categoria',
                  border: OutlineInputBorder(),
                ),
                items: categorie.values.map((cat) {
                  return DropdownMenuItem(
                    value: cat,
                    child: Text(cat.nome),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    _categoriaSelezionata = val;
                  });
                },
                validator: (value) => value == null ? 'Seleziona una categoria' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<posizioni>(
                value: _posizioneSelezionata,
                decoration: const InputDecoration(
                  labelText: 'Posizione',
                  border: OutlineInputBorder(),
                ),
                items: posizioni.values.map((cat) {
                  return DropdownMenuItem(
                    value: cat,
                    child: Text(cat.label),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    _posizioneSelezionata = val;
                  });
                },
                validator: (value) => value == null ? 'Seleziona una posizione' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: (){
                    _selezionaDataAcquisto(context);
                  },
                  child: Text(_dataDiAcquistoEtichetta ?? "Seleziona la data di acquisto")
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: (){
                    _selezionaDataScadenza(context);
                  },
                  child: Text(_dataDiScadenzaEtichetta ?? "Seleziona la data di scadenza")
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _salvaAlimento,
                icon: const Icon(Icons.save),
                label: const Text('Salva Alimento'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
