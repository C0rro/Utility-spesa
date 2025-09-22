import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:utility_spesa/ImpostazioniManager.dart';
import 'Dispensa.dart';
import 'StartPage.dart';
import 'Stat.dart';
import 'mock_alimenti.dart';
import 'theme.dart';
import 'dataManager.dart';
import 'alimento.dart';
import 'categorie.dart';
import 'posizioni.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(AlimentoAdapter());
  Hive.registerAdapter(categorieAdapter());
  Hive.registerAdapter(posizioniAdapter());

  final impostazioniManager = ImpostazioniManager();
  final dataManager = DataManager();
  await dataManager.init();

  if (dataManager.alimenti.isEmpty) {
    for (var a in mockAlimenti) {
      dataManager.addAlimento(a);
    }
  }

  runApp(UtilitySpesaApp(
    dataManager: dataManager,
    impostazioniManager: impostazioniManager,
  ));
}

class UtilitySpesaApp extends StatefulWidget {
  final DataManager dataManager;
  final ImpostazioniManager impostazioniManager;

  const UtilitySpesaApp({
    super.key,
    required this.dataManager,
    required this.impostazioniManager,
  });

  @override
  State<UtilitySpesaApp> createState() => _UtilitySpesaAppState();
}

class _UtilitySpesaAppState extends State<UtilitySpesaApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => widget.dataManager),
        ChangeNotifierProvider(create: (_) => widget.impostazioniManager),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTabIndex = 0;

  final List<Widget> _pages = [
    Startpage(),
    Stat(),
    Dispensa(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: IndexedStack(
        index: _selectedTabIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedTabIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.analytics), label: 'Statistiche'),
          NavigationDestination(icon: Icon(Icons.inventory), label: 'Dispensa'),
        ],
      ),
    );
  }
}
