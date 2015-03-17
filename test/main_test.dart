library main_test;

import 'package:unittest/unittest.dart';
import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';
//import 'package:citation/component/citation.dart';

import '../web/main.dart';

main()
{
  setUp(()
  {
    setUpInjector();
    module((Module m) => m.install(new MyAppModule()));
  });

  tearDown(tearDownInjector);

}
