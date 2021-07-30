import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardListWidget extends StatelessWidget {
  final String title;
  final String link;

  _launchUrl(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  const CardListWidget({
    Key? key,
    required this.title,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  color: Colors.transparent,
                  width: 380,
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      _launchUrl(link);
                    },
                    child: Center(child: Text(title)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
