import 'package:covidapp/di/modules/modules.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class ModuleContainer {

  Injector initialise(Injector injector) {
    var inject = ServiceModule().initialise(injector);
    inject = RepositoryModule().initialise(injector);
    inject = UseCaseModule().initialise(inject);
    inject = BlocModule().initialise(inject);
    return inject;
  }
}