import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utility_spesa/ImpostazioniManager.dart';


class Impostazioni extends StatefulWidget {
  const Impostazioni({super.key});

  @override
  State<Impostazioni> createState() => _ImpostazioniState();
}

class _ImpostazioniState extends State<Impostazioni> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _budgetController;
  late TextEditingController _giorniController;

  @override
  void initState() {
    super.initState();
    final settings = context.read<ImpostazioniManager>();
    _budgetController = TextEditingController(text: settings.budgetMensile.toString());
    _giorniController = TextEditingController(text: settings.giorniAvvisoScadenza.toString());
  }

  @override
  void dispose() {
    _budgetController.dispose();
    _giorniController.dispose();
    super.dispose();
  }

  void _salva() {
    if (_formKey.currentState!.validate()) {
      final settings = context.read<ImpostazioniManager>();
      settings.setBudgetMensile(double.parse(_budgetController.text));
      settings.setGiorniAvvisoScadenza(int.parse(_giorniController.text));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Impostazioni')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _budgetController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Budget mensile (€)',
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v == null || double.tryParse(v) == null ? 'Inserisci un numero valido' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _giorniController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Giorni avviso scadenza',
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v == null || int.tryParse(v) == null ? 'Inserisci un numero valido' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _salva,
                icon: const Icon(Icons.save),
                label: const Text('Salva'),
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
