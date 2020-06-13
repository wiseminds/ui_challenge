import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ui_challenge/constants/app_assets.dart';
import 'package:ui_challenge/widgets/bar_chart.dart';
import 'package:ui_challenge/widgets/circular_image.dart';
import 'package:websafe_svg/websafe_svg.dart';

class HomeScreen extends StatefulWidget {
  final ZoomDrawerController drawerController;

  const HomeScreen({Key key, this.drawerController}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _shorCutanimation;
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,
    );
    _shorCutanimation =
        CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _controller.addListener(() {
      print(_controller.value?.toString());
    });
    super.initState();
  }

  bool get shoShortCut => _shorCutanimation.value > .6;
  CrossFadeState get fadeState => _shorCutanimation.value > .6
      ? CrossFadeState.showFirst
      : CrossFadeState.showSecond;
  void toggle() {
    // if(_controller.isAnimating) return;
    if (_controller.value > .7)
      _controller.reverse();
    else
      _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Scaffold(
        backgroundColor: Colors.white,
        body: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => SafeArea(
                  child: Container(
                    color: Colors.white,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 30, bottom: 10),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello,',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'Dwight',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Spacer(),
                            // SvgPicture.asset(AppAssets.APPLE_LOGO ),
                            Card(
                              elevation: .5,
                              shape: CircleBorder(),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(300),
                                onTap: toggle,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox.fromSize(
                                      size: Size.square(25),
                                      child: WebsafeSvg.asset(AppAssets.OPTIONS,
                                          width: 20, height: 20)),
                                ),
                              ),
                            ),
                            Material(
                              elevation: 0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(300),
                                onTap: () {
                                  widget.drawerController?.toggle();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2.0, vertical: 10),
                                  child: SizedBox.fromSize(
                                      size: Size.square(25),
                                      child: WebsafeSvg.asset(
                                          AppAssets.ELLIPSIS,
                                          width: 20,
                                          height: 20)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Card(
                                elevation: 0,
                                clipBehavior: Clip.antiAlias,
                                color: Theme.of(context).accentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: InkWell(
                                  onTap: _showBottomSheets,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Dollar Card',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      .copyWith(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    ' *0592',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            fontSize: 14,
                                                            color:
                                                                Colors.black26,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Text(
                                              'cBank',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .copyWith(
                                                      fontSize: 23,
                                                      fontWeight:
                                                          FontWeight.w800),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 70,
                                        ),
                                        Card(
                                          elevation: 13,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 18),
                                            child: Text(
                                              '\$4942.5',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .copyWith(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              Card(
                                elevation: 0,
                                clipBehavior: Clip.antiAlias,
                                color: Theme.of(context).primaryColorDark,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: InkWell(
                                  onTap: _showBottomSheets,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          shoShortCut
                                              ? InkWell(
                                                  onTap: _showBottomSheet,
                                                  child: Material(
                                                    elevation: 0,
                                                    shape: CircleBorder(),
                                                    color: Colors.grey[200],
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12.0),
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    // onPressed: _showBottomSheet,
                                                  ),
                                                )
                                              : CircularImage(
                                                  size: 40,
                                                  url:
                                                      'https://mobileimages.lowes.com/product/converted/694060/6940600720028xl.jpg'),
                                          //  if (shoShortCut)   SizedBox(
                                          //     width: 20,
                                          //   ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Text(
                                                    'Vacation Goal',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Text.rich(
                                                    TextSpan(
                                                        text: '\$728.01',
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                ' from \$2000',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1
                                                                .copyWith(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black26,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                          )
                                                        ]),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            fontSize: 14,
                                                            // color: Colors.black26,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              if (!shoShortCut)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Today',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(
                                                fontSize: 15,
                                                color: Colors.black26,
                                                fontWeight: FontWeight.w600),
                                      ),
                                      Spacer(),
                                      Text(
                                        '-139.2\$',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              AnimatedCrossFade(
                                crossFadeState: fadeState,
                                duration: Duration(milliseconds: 1000),
                                firstCurve: Curves.decelerate,
                                secondCurve: Curves.decelerate,
                                // if (shoShortCut)
                                firstChild: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0),
                                      child: Text(
                                        'Shortcuts',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(
                                                fontSize: 15,
                                                color: Colors.black26,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    if (shoShortCut)
                                      Container(
                                        height: 100,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          physics: BouncingScrollPhysics(),
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  RaisedButton(
                                                    elevation: 0,
                                                    shape: CircleBorder(),
                                                    color: Color(0xff83d39d),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              17.0),
                                                      child: Icon(
                                                        Icons.arrow_forward,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    onPressed: _showBottomSheet,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text(
                                                      'Send',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          .copyWith(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            _profileConpact(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQsr_tkXixxUBtHW2otTR5YV3znyiGAeRQHFEQHxUme5Z7NU9Sz&usqp=CAU',
                                                'Jullie'),
                                            _profileConpact(
                                                'https://cdn-images.zety.com/authors/christian_eilers_1.jpg',
                                                'Macaulay'),
                                            _profileConpact(
                                                'https://www.beautycastnetwork.com/images/banner-profile_pic.jpg',
                                                'Henry'),
                                            _profileConpact(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQsr_tkXixxUBtHW2otTR5YV3znyiGAeRQHFEQHxUme5Z7NU9Sz&usqp=CAU',
                                                'Jullie'),
                                            _profileConpact(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQsr_tkXixxUBtHW2otTR5YV3znyiGAeRQHFEQHxUme5Z7NU9Sz&usqp=CAU',
                                                'Jullie'),
                                            _profileConpact(
                                                'https://www.beautycastnetwork.com/images/banner-profile_pic.jpg',
                                                'Henry'),
                                          ],
                                        ),
                                      ),
                                    // if (shoShortCut)
                                    SizedBox(
                                      height: 30,
                                    ),
                                    // if (shoShortCut)
                                    Container(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: 100,
                                        child: OutlineButton(
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Theme.of(context)
                                                      .accentColor),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 18.0),
                                            child: Text(
                                              'Create',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w800),
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                secondChild:
                                    // if (!shoShortCut)
                                    Column(
                                  children: [
                                    _profileRow(
                                        url:
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQsr_tkXixxUBtHW2otTR5YV3znyiGAeRQHFEQHxUme5Z7NU9Sz&usqp=CAU',
                                        name: 'Jullie Lane',
                                        amount: '-4.99\$',
                                        cost: '10\$ ',
                                        showSend: true,
                                        text: 'for taxi'),
                                    if (!shoShortCut)
                                      _profileRow(
                                        image: Material(
                                          shape: CircleBorder(),
                                          color: Theme.of(context)
                                              .accentColor
                                              .withOpacity(.15),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: CircularImage(
                                              url:
                                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/1200px-Apple_logo_black.svg.png',
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        name: 'App Store',
                                        amount: '-4.99\$',
                                      ),
                                    // if (!shoShortCut)
                                    _profileRow(
                                      url:
                                          'https://cdn-images.zety.com/authors/christian_eilers_1.jpg',
                                      name: 'Macaulay',
                                      amount: '-4.99\$',
                                    ),
                                    // if (!shoShortCut)
                                    Column(
                                      children: [
                                        for (var i = 0; i < 30; i++)
                                          _profileRow(
                                              url:
                                                  'https://www.beautycastnetwork.com/images/banner-profile_pic.jpg',
                                              name: 'From Jullie',
                                              amount: '-4.99\$',
                                              text: 'for luch'),
                                        _profileRow(
                                            url:
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQsr_tkXixxUBtHW2otTR5YV3znyiGAeRQHFEQHxUme5Z7NU9Sz&usqp=CAU',
                                            name: 'Jullie Lane',
                                            amount: '-4.99\$',
                                            cost: '10\$ ',
                                            showSend: true,
                                            text: 'for taxi'),
                                        _profileRow(
                                          url:
                                              'https://cdn-images.zety.com/authors/christian_eilers_1.jpg',
                                          name: 'Macaulay',
                                          amount: '-4.99\$',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              //  _profileRow(url:'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQsr_tkXixxUBtHW2otTR5YV3znyiGAeRQHFEQHxUme5Z7NU9Sz&usqp=CAU',
                              //  name : 'Wande Lane', amount: '-4.99\$' ) ,

                              SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                )),

        // Container(color: Color(0xff83d39d),)
      )
    ]);
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        // clipBehavior: Clip.antiAlias,
        enableDrag: true,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (context) => Container(
              color: Color(0xff3f8275),
              child: Center(
                  child: Text(
                '👍',
                style: TextStyle(fontSize: 70),
              )),
            ));
  }

  void _showBottomSheets() {
    showModalBottomSheet(
      context: context,
      // enableDrag: true,
      isScrollControlled: true,
      // clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.black54,
      // barrierColor: Colors.black87,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //   topLeft: Radius.circular(30),
      //   topRight: Radius.circular(30),
      // )),
      builder: (context) =>

          //  Column(
          //   children: [
          //   Container(color: Colors.white, height: 10, width: 100, ),
          //     BottomSheet(
          //       onClosing: () {},
          //       shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(30),
          //   topRight: Radius.circular(30),
          // )),
          //       builder: (context) =>
          InkWell(
        onTap: () => Navigator.pop(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          //  fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    color: Colors.white,
                    width: 80,
                    height: 7,
                  )),
            ),
            BottomSheet(
              onClosing: () {}, enableDrag: true,
              // isScrollControlled: false,
              clipBehavior: Clip.antiAlias,
              backgroundColor: Colors.white,
              // barrierColor: Colors.black87,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
              builder: (context) => Container(
                height: MediaQuery.of(context).size.height * .6,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Material(
                        shape: CircleBorder(),
                        color: Theme.of(context).accentColor.withOpacity(.15),
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: CircularImage(
                            url:
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/1200px-Apple_logo_black.svg.png',
                            size: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'App Store',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 28, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        'Apple',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        margin: EdgeInsets.only(top: 40),
                        // color: const Color(0xff232040),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: BarChartView(),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10),
                        child: Row(
                          children: [
                            Text(
                              'For August',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      fontSize: 14,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Text(
                              '\$528.21',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),

                      Column(
                        children: [
                          for (var i = 0; i < 30; i++)
                            _profileRow(
                              small: true,
                              image: Material(
                                shape: CircleBorder(),
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(.15),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: CircularImage(
                                    url:
                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/1200px-Apple_logo_black.svg.png',
                                    size: 20,
                                  ),
                                ),
                              ),
                              name: 'App Store',
                              text: '10 oct 2019',
                              amount: '-4.99\$',
                            ),
                          _profileRow(
                              url:
                                  'https://www.beautycastnetwork.com/images/banner-profile_pic.jpg',
                              name: 'From Jullie',
                              amount: '-4.99\$',
                              text: 'for luch'),
                          _profileRow(
                              url:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQsr_tkXixxUBtHW2otTR5YV3znyiGAeRQHFEQHxUme5Z7NU9Sz&usqp=CAU',
                              name: 'Jullie Lane',
                              amount: '-4.99\$',
                              cost: '10\$ ',
                              showSend: true,
                              text: 'for taxi'),
                          _profileRow(
                            url:
                                'https://cdn-images.zety.com/authors/christian_eilers_1.jpg',
                            name: 'Macaulay',
                            amount: '-4.99\$',
                          ),
                        ],
                      ),
                      // _profileRow(
                      //   url:
                      //       'https://cdn-images.zety.com/authors/christian_eilers_1.jpg',
                      //   name: 'Macaulay',
                      //   text: '10 oct 2019',
                      //   amount: '-4.99\$',
                      // ),
                      // _profileRow(
                      //   url:
                      //       'https://www.beautycastnetwork.com/images/banner-profile_pic.jpg',
                      //   name: 'From Jullie',
                      //   text: '10 oct 2019',
                      //   amount: '-4.99\$',
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      //   ),
      // ],
      // ),
    );
  }

  Widget _profileConpact(String url, String name) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularImage(
              url: url,
            ),
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
  Widget _profileRow(
          {String url,
          String name,
          String amount,
          String cost,
          String text,
          bool small = false,
          Widget image,
          bool showSend = false}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              image ??
                  CircularImage(
                    url: url,
                    size: small ? 40 : 50,
                  ),
              // SizedBox(
              //   width: 10,
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: small ? 14 : 15,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    if (cost != null || text != null)
                      Text.rich(
                        TextSpan(text: cost, children: [
                          TextSpan(
                              text: text ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      fontSize: small ? 13 : 14,
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w600))
                        ]),
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 14,
                            // color: Colors.black26,
                            fontWeight: FontWeight.w600),
                      ),
                  ],
                ),
              ),
              Spacer(),
              showSend
                  ? RaisedButton(
                      elevation: 0,
                      shape: CircleBorder(),
                      color: Color(0xff83d39d),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Send',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      onPressed: _showBottomSheet,
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        amount,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: small ? 13 : 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
            ],
          ),
        ),
      );
}

class _BarChart extends StatefulWidget {
  @override
  __BarCartState createState() => __BarCartState();
}

class __BarCartState extends State<_BarChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
