import 'package:url_launcher/url_launcher_string.dart';

Future<void> launchUrl(String url) async {
  try {
    await launchUrlString(url);
  } catch (_) {}
}
