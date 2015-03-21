library citation_component;

import 'dart:html';
import 'package:angular/angular.dart';
import 'package:citable/citable/citable.dart' show CitableModel;

@Component(
    selector: 'citation',
    template: '<span class="cite-text" citable="citableForCitation()">{{citationText}}</span>',
    cssUrl: 'citation.css')

class CitationComponent
{
  @NgAttr('bentry')
  int bentry;

  // Set up the decorator
  static final citable = new Expando<CitableModel>();

  final Element element;
  String citationText;
  
  CitationComponent(this.element)
  {
    citationText = element.innerHtml;
  }

  CitableModel citableForCitation()
  {
    if (citable[this] == null)
    {
      citable[this] = new CitableModel(bentry);
    }
    return citable[this];
  }
}

