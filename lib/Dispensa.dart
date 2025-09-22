import 'package:flutter/material.dart';
import 'package:utility_spesa/Freezer.dart';
import 'package:utility_spesa/Frigo.dart';
import 'package:utility_spesa/Scaffali.dart';

import 'Stat.dart';

class Dispensa extends StatefulWidget {
  const Dispensa({super.key});

  @override
  State<Dispensa> createState() => _DispensaState();
}

class _DispensaState extends State<Dispensa> {

  void navigateTo(String tipo) {
    Widget page;
    switch (tipo) {
      case 'Frigo':
        page = FrigoPage();
        break;
      case 'Freezer':
        page = FreezerPage();
        break;
      case 'Scaffali':
        page = ScaffaliPage();
        break;
      default:
        page = Scaffold();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Widget buildCard(String title, IconData icon) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: InkWell(
        onTap: () => navigateTo(title),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Icon(icon, size: 32),
              SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("La tua dispensa"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildCard('Frigo', Icons.kitchen),
          buildCard('Freezer', Icons.ac_unit),
          buildCard('Scaffali', Icons.inventory),
        ],
      ),
    );
  }
}

