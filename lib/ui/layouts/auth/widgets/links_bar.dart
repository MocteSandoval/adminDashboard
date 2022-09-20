import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: (size.width > 1000) ? size.height * 0.080 : null,
        color: Colors.black,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            LinkText(text: 'About', onTap: () {}),
            LinkText(text: 'Help Center', onTap: () {}),
            LinkText(text: 'Terms of Service', onTap: () {}),
            LinkText(text: 'Privacy Policy', onTap: () {}),
            LinkText(text: 'Ads Info', onTap: () {}),
            LinkText(text: 'Blogs', onTap: () {}),
            LinkText(text: 'Status', onTap: () {}),
            LinkText(text: 'Careers', onTap: () {}),
            LinkText(text: 'Brand Resources', onTap: () {}),
            LinkText(text: 'Adverstising', onTap: () {}),
            LinkText(text: 'Marketing', onTap: () {}),
            LinkText(text: 'Twitter for Bussiness', onTap: () {}),
            LinkText(text: 'Developers', onTap: () {}),
            LinkText(text: 'Directory', onTap: () {}),
            LinkText(text: 'Settings', onTap: () {}),
          ],
        ));
  }
}
