import 'package:polymer/polymer.dart';
import 'dart:js' as js;

/**
 * A Polymer click counter element.
 */
@CustomTag('bs-accordion-item')
class BSAccordian extends PolymerElement {
  @published bool open = false;

  bool get applyAuthorStyles => true;

  BSAccordian.created() : super.created() {
  }

  void openChanged() {
    open ? collapseAction('show') : collapseAction('hide');
  }

  void toggleAll() {
    var items = parent.querySelectorAll(localName);
    items.forEach((n) {
      n.open = (n == this);
    });
  }

  void toggle() {
    collapseAction('toggle');
  }

  void collapseAction(action) {
    // JS version
    // $(this.$.collapseTarget).collapse(action);

    var target = $["collapseTarget"];
    var jsnode = new js.JsObject.fromBrowserObject(target);
    var jqobject = new js.JsObject(js.context["jQuery"], [jsnode]);

    jqobject.callMethod("collapse", [action]);
  }
}

