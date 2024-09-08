import 'package:balancee_app/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

class ShimmerPage extends StatefulWidget {
  final Color? color;
  const ShimmerPage({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  State<ShimmerPage> createState() => _ShimmerPageState();
}

int _index = 0;

class _ShimmerPageState extends State<ShimmerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: -3, end: 3).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Scaffold(
            body: Container(
              height: height(context),
              width: width(context),
              color: widget.color ?? Theme.of(context).primaryColorLight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.3,
                    child: Skeleton(),
                  ),
                  10.0.sbH,
                  Expanded(child: Skeleton()),
                  20.0.sbH
                ],
              ),
            ),
          );
        });
  }
}

class ShimmerUser extends StatefulWidget {
  const ShimmerUser({
    Key? key,
  }) : super(key: key);

  @override
  State<ShimmerUser> createState() => _ShimmerUserState();
}

class _ShimmerUserState extends State<ShimmerUser>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  child: Skeleton(),
                ),
                10.0.sbW,
                Container(
                  width: 20,
                  height: 20,
                  child: Skeleton(),
                ),
                10.0.sbW,
                Container(
                  width: 20,
                  height: 20,
                  child: Skeleton(),
                )
              ],
            ),
          );
        });
  }
}

class Skeleton extends StatefulWidget {
  const Skeleton({Key? key, this.height, this.width, this.color = Colors.grey})
      : super(key: key);

  final double? height, width;
  final Color? color;

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // *****************************dispose*********************  ***

  @override
  Widget build(BuildContext context) {
    double defaultPadding = 16.0;

    return Container(
        height: widget.height,
        width: widget.width,
        padding: EdgeInsets.all(defaultPadding / 2),
        decoration: radiusBoxDecoration(
          colors: [Colors.red, Colors.green, Colors.purple, Colors.white],
          animation: _animation,
        ));
  }
}

class CircleSkeleton extends StatefulWidget {
  const CircleSkeleton({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  State<CircleSkeleton> createState() => _CircleSkeletonState();
}

class _CircleSkeletonState extends State<CircleSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // *****************************dispose*********************  ***

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      decoration: radiusBoxDecoration(
        radius: widget.size!,
        colors: [Colors.red, Colors.green, Colors.purple, Colors.white],
        animation: _animation,
      ),
    );
  }
}

class ShimmerCard extends StatefulWidget {
  const ShimmerCard({
    Key? key,
  }) : super(key: key);

  @override
  State<ShimmerCard> createState() => _ShimmerCardState();
}

class _ShimmerCardState extends State<ShimmerCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Container(
            height: size.height,
            width: size.width,
            child: Skeleton(),
          );
        });
  }
}

class ShimmerCart extends StatefulWidget {
  const ShimmerCart({
    Key? key,
  }) : super(key: key);

  @override
  State<ShimmerCart> createState() => _ShimmerCartState();
}

class _ShimmerCartState extends State<ShimmerCart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Container(
            height: size.height,
            // width: width(context),
            margin: EdgeInsets.only(left: 16, right: 16),
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: 10,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  height: 160,
                  width: size.width,
                  child: Skeleton(),
                );
              },
            ),
          );
        });
  }
}

class ErrandsShimmerCart extends StatefulWidget {
  const ErrandsShimmerCart({
    Key? key,
  }) : super(key: key);

  @override
  State<ErrandsShimmerCart> createState() => _ErrandsShimmerCartState();
}

class _ErrandsShimmerCartState extends State<ErrandsShimmerCart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Container(
            height: size.height,
            // width: width(context),
            margin: EdgeInsets.only(left: 16, right: 16),
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: 5,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  height: 69.h,
                  width: size.width,
                  child: Skeleton(),
                );
              },
            ),
          );
        });
  }
}

class HistoryShimmerCart extends StatefulWidget {
  const HistoryShimmerCart({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryShimmerCart> createState() => _HistoryShimmerCartState();
}

class _HistoryShimmerCartState extends State<HistoryShimmerCart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Container(
            height: size.height,
            // width: width(context),
            margin: EdgeInsets.only(left: 16, right: 16),
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: 5,
              itemBuilder: (_, index) {
                return index == 4
                    ? Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        height: 40.h,
                        width: size.width,
                        child: Skeleton(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            height: 40.h,
                            width: size.width,
                            child: Skeleton(),
                          ),
                          16.0.sbH,
                          Divider(height: 0.5.h),
                        ],
                      );
              },
            ),
          );
        });
  }
}

class HorizontalShimmerCart extends StatefulWidget {
  const HorizontalShimmerCart({
    Key? key,
  }) : super(key: key);

  @override
  State<HorizontalShimmerCart> createState() => _HorizontalShimmerCartState();
}

class _HorizontalShimmerCartState extends State<HorizontalShimmerCart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Container(
            height: 160,
            // margin: EdgeInsets.only(left: 16,right: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(0),
              itemCount: 5,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.only(right: 16),
                  height: 160,
                  width: 292.w,
                  child: Skeleton(),
                );
              },
            ),
          );
        });
  }
}

class TabShimmerCart extends StatefulWidget {
  const TabShimmerCart({
    Key? key,
  }) : super(key: key);

  @override
  State<TabShimmerCart> createState() => _TabShimmerCartState();
}

class _TabShimmerCartState extends State<TabShimmerCart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Container(
            height: 34.h,
            // margin: EdgeInsets.only(left: 16,right: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(0),
              itemCount: 5,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.only(right: 16),
                  height: 34.h,
                  width: 130.w,
                  child: Skeleton(),
                );
              },
            ),
          );
        });
  }
}

class FlatShimmerCart extends StatefulWidget {
  const FlatShimmerCart({
    Key? key,
  }) : super(key: key);

  @override
  State<FlatShimmerCart> createState() => _FlatShimmerCartState();
}

class _FlatShimmerCartState extends State<FlatShimmerCart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Container(
            height: 160,
            // margin: EdgeInsets.only(left: 16,right: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(0),
              itemCount: 5,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.only(right: 16),
                  height: 184.h,
                  width: 390.w,
                  child: Skeleton(),
                );
              },
            ),
          );
        });
  }
}

class ShimmerWallet extends StatefulWidget {
  const ShimmerWallet({
    Key? key,
  }) : super(key: key);

  @override
  State<ShimmerWallet> createState() => _ShimmerWalletState();
}

class _ShimmerWalletState extends State<ShimmerWallet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Container(
            height: size.height,
            margin: EdgeInsets.only(left: 16, right: 16),
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: 10,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  height: 50,
                  width: size.width,
                  child: Skeleton(),
                );
              },
            ),
          );
        });
  }
}

class ShimmerPharm extends StatefulWidget {
  const ShimmerPharm({
    Key? key,
  }) : super(key: key);

  @override
  State<ShimmerPharm> createState() => _ShimmerPharmState();
}

class _ShimmerPharmState extends State<ShimmerPharm>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(
        curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Container(
            height: size.height,
            width: size.width,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: 10,
              itemBuilder: (_, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 10, bottom: 10, right: 10, left: 10),
                        height: 200,
                        width: 160,
                        child: Skeleton(),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 10, bottom: 10, right: 10, left: 10),
                        height: 200,
                        width: 160,
                        child: Skeleton(),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        });
  }
}
