import 'package:hive/hive.dart';

part 'posizioni.g.dart';

@HiveType(typeId: 2)
enum posizioni {

  @HiveField(0)
  frigo,

  @HiveField(1)
  freezer,

  @HiveField(2)
  scaffali,

}

extension categorieExtension on posizioni {
  String get label {
    switch (this) {
      case posizioni.frigo:
        return 'Frigo';
      case posizioni.freezer:
        return 'Freezer';
      case posizioni.scaffali:
        return 'Scaffali';

    }
  }
}