import 'dart:html' as html;

class WebBackHelper {
  void disableBackButton() {
    html.window.onPopState.listen((event) {
      html.window.history.pushState(null, 'blocked', html.window.location.href);
    });
  }
}

