import 'package:flutter/material.dart';
import 'package:quick_sup/widgets/app_bar_widget.dart';
import 'package:quick_sup/widgets/card_list_widget.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        key: key,
        title: 'About Us',
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 280),
        child: Column(
          children: [
            CardListWidget(
              title: 'GitHub',
              link: 'https://github.com/Mahipalsinhnakum',
            ),
            CardListWidget(
              title: 'LinkedIn',
              link: 'https://www.linkedin.com/in/nakum-mahipalsinh-256671196/',
            ),
          ],
        ),
      ),
    );
  }
}
