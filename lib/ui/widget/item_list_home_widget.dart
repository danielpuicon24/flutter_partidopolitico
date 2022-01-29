import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:partidopolitico/ui/general/colors.dart';

class ItemListHomeWidget extends StatelessWidget {

  String title;
  String subtitle;
  String leading;
  Function onPressed;

  ItemListHomeWidget({
    required this.title,
    required this.subtitle,
    required this.leading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: COLOR_BRAND_PRIMARY,
        boxShadow: [
          BoxShadow(
            color: Color(0xff0D48C1),
            blurRadius: 12,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: ListTile(
        onTap: (){
          onPressed();
        },
        minLeadingWidth: 0,
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(
          'assets/images/$leading.svg',
          color: Colors.white,
          height: 34,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
        trailing: SvgPicture.asset(
          'assets/images/bx-chevron-right.svg',
          color: Colors.white,
          height: 34,
        ),
      ),
    );
  }
}