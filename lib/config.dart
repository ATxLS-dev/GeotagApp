library config.globals;

import 'hive_db_manager.dart';
import 'theme.dart';
import 'position_manager.dart';
import 'authenticator.dart';


var currentTheme = CurrentTheme();
final hiveDBManager = HiveDBManager();
final positionManager = PositionManager();
final authenticator = Authenticator();
final geotagThemeData = GeotagThemeData();