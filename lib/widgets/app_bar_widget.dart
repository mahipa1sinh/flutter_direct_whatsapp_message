import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // foregroundColor: Colors.black,
      title: Row(
        children: [
          Image.asset(
            'assets/whatsapp.png',
            height: 35.0,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
      leadingWidth: 40.0,
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      actions: [
        PopupMenuButton(
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            PopupMenuItem(
              value: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: Text('About'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
