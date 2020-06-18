library config.globals;

import 'hive_database.dart';
import 'position_manager.dart';
import 'authenticator.dart';
import 'theme.dart';

final hiveDatabase = HiveDatabase();
final tagDatabase = TagDatabase();
final themeDatabase = ThemeDatabase();
final positionManager = PositionManager();
final authenticator = Authenticator();
final geotagThemeData = GeotagThemeData();