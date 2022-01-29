import 'package:flutter/material.dart';
import 'package:partidopolitico/models/candidato_model.dart';
import 'package:partidopolitico/ui/general/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CandidatoDetailPage extends StatefulWidget {
  CandidatoModel candidatoModel;

  CandidatoDetailPage({
    required this.candidatoModel,
  });

  @override
  State<CandidatoDetailPage> createState() => _CandidatoDetailPageState();
}

class _CandidatoDetailPageState extends State<CandidatoDetailPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int valueTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController!.addListener(() {
      valueTab = _tabController!.index;
      setState(() {});
    });
  }

  handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    print("xxxxxx $valueTab");
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: COLOR_BRAND_PRIMARY,
              expandedHeight: _height * 0.4,
              elevation: 0,
              floating: false,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.candidatoModel.nombre),
                centerTitle: true,
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      widget.candidatoModel.foto,
                      fit: BoxFit.cover,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            COLOR_BRAND_PRIMARY.withOpacity(0),
                            COLOR_BRAND_PRIMARY.withOpacity(0.5),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              // floating: false,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  indicatorColor: COLOR_BRAND_PRIMARY,
                  indicatorWeight: 3.0,
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.black26,
                  onTap: (int value) {
                    setState(() {
                      valueTab = value;
                    });
                  },
                  tabs: [
                    Tab(
                      text: "¿Quién soy?",
                      icon: SvgPicture.asset(
                        'assets/images/user.svg',
                        color: valueTab == 0
                            ? COLOR_BRAND_PRIMARY
                            : Colors.black26,
                      ),
                      // child: Text(
                      //   "¿Quién soy?",
                      //   style: TextStyle(
                      //     color: _tabController!.index == 0 ? Colors.black87 : Colors.black26,
                      //   ),
                      // ),
                    ),
                    Tab(
                      text: "Información",
                      icon: SvgPicture.asset(
                        'assets/images/info.svg',
                        color: valueTab == 1
                            ? COLOR_BRAND_PRIMARY
                            : Colors.black26,
                      ),
                      // child: Text(
                      //   "Información",
                      //   style: TextStyle(
                      //     color: _tabController!.index == 1 ? Colors.black87 : Colors.black26,
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            //QUIEN SOY
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Text(
              widget.candidatoModel.resumen,
              style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
            // INFORMACIÓN
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        widget.candidatoModel.nombre,
                        style: TextStyle(
                          color: COLOR_BRAND_PRIMARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Icon(
                        Icons.share,
                        color: COLOR_BRAND_PRIMARY,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Postula por la región:",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(widget.candidatoModel.region),
                    ),
                    ListTile(
                      title: Text(
                        "Número:",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(widget.candidatoModel.numero.toString()),
                    ),
                    ListTile(
                      title: Text(
                        "Prefesión:",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text("widget.candidatoModel.profesion"),
                    ),
                    ListTile(
                      title: Text(
                        "E-mail",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text("idcare.g@gmail.com"),
                    ),
                    ListTile(
                      title: Text(
                        "Experiencia",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                          widget.candidatoModel.experiencia),

                    ),
                    ListTile(
                      title: Text(
                        "Página Web",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "https://www.lipsum.com/",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: COLOR_BRAND_PRIMARY,
                        ),
                      ),
                      trailing: Icon(
                        Icons.link,
                        color: COLOR_BRAND_PRIMARY,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Redes Sociales",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/images/facebook.svg',
                              color: COLOR_BRAND_PRIMARY,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/images/instagram.svg',
                              color: COLOR_BRAND_PRIMARY,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/images/twitter.svg',
                              color: COLOR_BRAND_PRIMARY,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}