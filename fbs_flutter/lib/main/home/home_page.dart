import 'package:common/common.dart';
import 'package:fbs_flutter/main/home/widgets/home_widget.dart';
import 'package:fbs_flutter/main/widgets/title_view.dart';
import 'package:fbs_flutter/theme/bloc/theme_mode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() {
    const int count = 2;

    listViews.add(
      TitleView(
        titleTxt: 'Home',
        subTxt: 'Details',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      HomeWidget(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
            animation: widget.animationController!,
            builder: (BuildContext context, Widget? child) {
              return BlocBuilder<ThemeModeBloc, ThemeModeState>(
                builder: (BuildContext context, ThemeModeState themeState) {
                  return FadeTransition(
                    opacity: topBarAnimation!,
                    child: Transform(
                      transform: Matrix4.translationValues(
                          0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Palette.white.withOpacity(topBarOpacity),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Palette.grey
                                    .withOpacity(0.4 * topBarOpacity),
                                offset: const Offset(1.1, 1.1),
                                blurRadius: 10.0),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).padding.top,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 16 - 8.0 * topBarOpacity,
                                  bottom: 12 - 8.0 * topBarOpacity),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Home',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: Palette.fontName,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22 + 6 - 6 * topBarOpacity,
                                          letterSpacing: 1.2,
                                          color: Palette.darkerText,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0.0, 5.0, 5.0, 0.0),
                                    child: SizedBox(
                                      height: 40,
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(32.0)),
                                        onTap: () {
                                          context
                                              .read<ThemeModeBloc>()
                                              .add(const ThemeModeChanged());
                                        },
                                        child: Center(
                                          child: SvgPicture.asset(
                                            'assets/eva_icons/fill/svg/moon.svg',
                                            color: Palette.lightColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
      ],
    );
  }
}
