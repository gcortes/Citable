library citation_component;

import 'package:angular/angular.dart';
import 'package:citable/citable/citable.dart' show CitableModel;

@Component(
    selector: 'citation',
    template: '<span class="cite-text" citable="citableForCitation()">{{citationText}}</span>',
    cssUrl: 'citation.css')

class CitationComponent
{
  @NgAttr('bibliographicEntry')
  int bibliographicEntry;

  @NgAttr('citationText')
  String citationText;

  // Set up the decorator
  static final citable = new Expando<CitableModel>();

  CitableModel citableForCitation()
  {
    if (citable[this] == null)
    {
      citable[this] = new CitableModel(bibliographicEntry);
    }
    return citable[this];
  }
}

