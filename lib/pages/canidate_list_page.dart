import 'package:flutter/material.dart';
import 'package:partidopolitico/models/candidato_model.dart';
import 'package:partidopolitico/pages/candidate_detail_page.dart';
import 'package:partidopolitico/services/api_services.dart';
import 'package:partidopolitico/ui/general/colors.dart';
import 'package:partidopolitico/ui/widget/item_list_candidate_widget.dart';

class CandidateListPage extends StatefulWidget {
  const CandidateListPage({Key? key}) : super(key: key);

  @override
  State<CandidateListPage> createState() => _CandidateListPageState();
}

class _CandidateListPageState extends State<CandidateListPage> {
  final APIServices _apiServices = APIServices();

  List<String> regionList = [
    "Lima",
    "Arequipa",
    "Tacna",
    "Cusco",
    "La Libertad",
  ];
  String regionValue = "";
  List<CandidatoModel> candidatos = [];
  List<CandidatoModel> listCandidateAux = [];

  getData() async {
    _apiServices.getCandidatoList().then((value) {
      candidatos = value;
      listCandidateAux = value;
      changedRegion(regionValue);

      setState(() {

      });
    });
  }

  changedRegion(String region) {
    candidatos = listCandidateAux;
    candidatos =
        candidatos.where((element) => element.region == region).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
    regionValue = regionList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLOR_BRAND_PRIMARY,
        title: Theme(
          data: Theme.of(context).copyWith(canvasColor: COLOR_BRAND_PRIMARY),
          child: DropdownButton(
            underline: Container(),
            value: regionValue,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            items: regionList
                .map((e) => DropdownMenuItem(
                      child: Container(
                        color: COLOR_BRAND_PRIMARY,
                        child: Text(
                          e,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      value: e,
                    ))
                .toList(),
            onChanged: (String? value) {
              regionValue = value!;
              changedRegion(regionValue);
            },
          ),
        ),
        /*title: DropdownButtonFormField(
          dropdownColor: COLOR_BRAND_PRIMARY,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            value: regionValue,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            items: regionList
                .map((e) => DropdownMenuItem(
                      child: Container(
                        color: COLOR_BRAND_PRIMARY,
                        child: Text(
                          e,
                          style:
                              TextStyle(color: Colors.white,),
                        ),
                      ),
                      value: e,
                    ))
                .toList(),
            onChanged: (String? value) {
              regionValue = value!;
              setState(() {});
            },

        ),*/
      ),
      body:


      ListView.builder(
        itemCount: candidatos.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ItemListCandidateWidget(
            image: candidatos[index].foto,
            name: candidatos[index].nombre,
            region: candidatos[index].region,
            resume: candidatos[index].resumen,
            number: candidatos[index].numero.toString(),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CandidatoDetailPage(candidatoModel: candidatos[index],)));
            },
          );
        },
      ),
    );
  }
}
