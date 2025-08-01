import 'package:url_launcher/url_launcher.dart';

Future<void> launchAppStore(String appStoreUrl) async {
  final url = Uri.parse(appStoreUrl);
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Uygulama sayfası açılamadı';
  }
}
