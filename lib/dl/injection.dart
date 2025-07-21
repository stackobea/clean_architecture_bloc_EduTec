import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart'; // generated

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

//dart run build_runner build