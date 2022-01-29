import 'package:flutter/material.dart';
import 'package:partidopolitico/pages/canidate_list_page.dart';
import 'package:partidopolitico/ui/general/colors.dart';
import 'package:partidopolitico/ui/widget/item_list_home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: COLOR_BRAND_PRIMARY,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: _height * 0.17,
          ),
          SizedBox(
            height: _height * 0.015,
          ),
          //ItemListHomeWidget
          ItemListHomeWidget(
            title: "Candidatos al congreso",
            subtitle: "Contamos con un equipo de verdad",
            leading: 'bx-male-female',
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CandidateListPage()));
            },
          ),
          ItemListHomeWidget(
            title: "Nuestras propuestas",
            subtitle: "Propuestas legislativas - 2022",
            leading: 'bx-spread',
            onPressed: (){

            },
          ),
          ItemListHomeWidget(
            title: "Nuestras Bases",
            subtitle: "Descubre las bases más cercanas",
            leading: 'bx-map',
            onPressed: (){

            },
          ),
        ],
      ),
    );
  }
}


