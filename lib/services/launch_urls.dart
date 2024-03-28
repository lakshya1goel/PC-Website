import 'dart:js' as js;

void launchURL(String url){
  js.context.callMethod('open', [url]);
}