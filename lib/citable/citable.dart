library citable;

import 'dart:html';
import 'package:angular/angular.dart';

@Decorator(selector: '[citable]')

class Citable
{
  final Element element;

  @NgOneWay('citable')
  CitableModel displayModel;

  Element citableElem;
  Element entry;          // Bibliographic entry: div in the index.html

  Citable(this.element)
  {
    element..onMouseEnter.listen((_) => _createTemplate())
           ..onMouseLeave.listen((_) => _destroyTemplate());
  }

  void _createTemplate()
  {
    assert(displayModel != null);

    citableElem = new DivElement();

    // Get the html for the entry from the dom
    // All entries must have the id 'bex' where x is an integer

    entry = querySelector('#be${displayModel.entryRef.toString()}');
    String htmlText = entry.innerHtml;

    if (displayModel.entryRef != null)
    {
      DivElement textSpan = new DivElement()
          ..appendHtml('<hr>')
          ..appendHtml(htmlText);
      citableElem.append(textSpan);
    }
    citableElem.className = 'bibliographic-entry';
    citableElem.style.visibility = 'hidden';

    // Add the citable to the document body as a hidden element.
    // This allow the borderedge call to return values.
    // Calling it before it's added returns zero as height and width.
    document.body.append(citableElem);

    // position the citable.

    int windowHeight = window.innerHeight;
    int windowWidth = window.innerWidth;
    var elTopRight = element.offset.topRight;
    var elBottomLeft = element.offset.bottomLeft;
    int top = elTopRight.y;
    int bottom = elBottomLeft.y;
    int left = elBottomLeft.x;
    int right = elTopRight.x;
    CssRect borderEdge = citableElem.borderEdge;
    int height = borderEdge.height;
    int width = borderEdge.width;

    // Place it above
    int y = top - height - 20;
    // If y < 0 then part of the citable will be outside the display area
    if (y < 0) y = bottom + 10;   // If it doesn't fit, put it below
    // Start with it aligned with the left of the element
    int x = left;
    // If x + entryWidth > windowWidth then the right part of the element will be outside the display area.
    // If so then right justify to the window edge plus a little padding.
    if (x + width > windowWidth) x = windowWidth - width - 5;

    // Now place and show it
    citableElem.style
        ..visibility = 'visible'
        ..position = "absolute"
        ..top = "${y}px"
        ..left = "${x}px";

}

  void _destroyTemplate()
  {
    citableElem.remove();
  }
}

class CitableModel
{
  final int entryRef;

  CitableModel(this.entryRef);
}
