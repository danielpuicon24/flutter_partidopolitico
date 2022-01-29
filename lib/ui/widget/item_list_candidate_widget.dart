import 'package:flutter/material.dart';
import 'package:partidopolitico/ui/general/colors.dart';

class ItemListCandidateWidget extends StatelessWidget {
  String image;
  String name;
  String region;
  String resume;
  String number;
  Function onPressed;

  ItemListCandidateWidget({
    required this.name,
    required this.image,
    required this.region,
    required this.resume,
    required this.number,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.08),
                blurRadius: 12,
                offset: Offset(4, 4),
              ),
            ]),
        child: Row(
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: COLOR_BRAND_PRIMARY,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    Text(
                      region,
                      style: TextStyle(
                        color: Color(0xff1b1b1b),
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      resume,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xff1b1b1b).withOpacity(0.6),
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 70,
              height: 90,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                color: COLOR_BRAND_PRIMARY,
              ),
              child: Text(
                number,
                style:
                TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}