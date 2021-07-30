import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_sup/widgets/app_bar_widget.dart';
import 'package:quick_sup/widgets/custom_text_field_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  _launchUrl(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  showError({error, context}) {
    final errorBar = SnackBar(
      content: Text(error),
    );
    ScaffoldMessenger.of(context).showSnackBar(errorBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Quick Sup',
        key: key,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20.0,
                    ),
                    CustomTextFieldWidget(
                      width: 0.20,
                      title: 'Prefix',
                      hint: 'Ex: +91',
                      controller: codeController,
                      keyboard: TextInputType.number,
                    ),
                    Spacer(),
                    CustomTextFieldWidget(
                      controller: numberController,
                      width: 0.6,
                      title: 'whatsapp number',
                      hint: '9876543210',
                      keyboard: TextInputType.number,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 22),
                  child: CustomTextFieldWidget(
                    controller: messageController,
                    width: 1,
                    title: 'Message',
                    hint: 'Your Message',
                    line: 3,
                    keyboard: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                    bottom: 20.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (codeController.text.isEmpty) {
                        showError(
                          error: 'Enter Country Code',
                          context: context,
                        );
                      } else if (numberController.text.isEmpty) {
                        showError(
                          error: 'Enter Country Code',
                          context: context,
                        );
                      } else {
                        var message = Uri.parse(messageController.text);
                        print(message);
                        _launchUrl(
                            'https://wa.me/${codeController.text.trim()}${numberController.text.trim()}/?text=$message');
                      }
                    },
                    child: Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.teal,
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Open Chat',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'The WhatsApp name and logos are trademarks of WhatsApp',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
