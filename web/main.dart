library citation;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'package:citable/component/citation.dart';
import 'package:citable/citable/citable.dart';

class MyAppModule extends Module
{
  MyAppModule()
  {
    bind(CitationComponent);
    bind(Citable);
  }
}

void main()
{
  applicationFactory()
      .addModule(new MyAppModule())
      .run();
}
