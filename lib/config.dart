library config.globals;

import 'hive_database.dart';
import 'authenticator.dart';
import 'theme.dart';

final hiveDatabase = HiveDatabase();
final tagDatabase = TagDatabase();
final themeDatabase = ThemeDatabase();
final authenticator = Authenticator();
final geotagThemeData = GeotagThemeData();