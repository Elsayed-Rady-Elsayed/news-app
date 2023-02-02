import 'package:clipboard/clipboard.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
class fun{
  static Future<void>_openlink(String link)async {
    var urllink=link;
    if(await canLaunch(urllink))
    {
      await launch(urllink);
    }
    else{
      await launch(urllink);
    }
  }
  static Future<void>_sharelink(String link)async {
    Share.share(link);
  }
  static Future<void>_copylink(String link)async {
    FlutterClipboard.copy(link).then(( value ) => print('copied'));
  }



}