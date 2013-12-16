import 'package:polymer/polymer.dart';
import 'package:js/js.dart' as js;

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
    // $(this.$.collapseTarget).collapse(action);
    var collapsetarget = js.context.jQuery("#collapseTarget");
    collapsetarget.collapse(action);
  }
}

