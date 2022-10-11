import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerOpen extends GetxController with SingleGetTickerProviderMixin {
  Rx<double> xOffset = 0.0.obs;
  Rx<double> yOffset = 0.0.obs;
  Rx<double> scaleFactor = 1.0.obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final Duration duration = const Duration(milliseconds: 300);
  var isChange = false.obs;

  AnimationController animationController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animationController = AnimationController(vsync: this, duration: duration);
  }

  void openDrawer() {
    scaffoldKey.currentState.openDrawer();
    // Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor);
  }

  setQuality({xOffset, yOffset, scaleFactor}) {
    this.xOffset = xOffset;
    this.yOffset = yOffset;
    this.scaleFactor = scaleFactor;
  }
}

class ProfileController extends GetxController {
  final selectedIndex = 0.obs;

  /* set selectedIndex(value) => this._selectedIndex.value = value;

  get selectedIndex => this._selectedIndex.value;*/

  void changeTabIndex(int index) {
    selectedIndex.value = index;
    update();
  }
}
/*
class WrapperController extends GetxController {
  int currentIndex = 0;
  List<BottomNavigationElement> items = [];

  Widget navigationTab({GlobalKey<NavigatorState> naviKey, Widget widget}) {
    return Navigator(
      key: naviKey,
      onGenerateRoute: (routeSettings) {
        return GetPageRoute(page: () => widget);
      },
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Get.theme.accentColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      backgroundColor: Get.theme.primaryColor,
      onTap: (int index) => _selectTab(index),
      items: items.map((e) => e.bottomBarItem).toList(),
    );
  }

  void _selectTab(int index) {
    if (index == currentIndex) {
      items[index]
          .navigationKey
          .currentState
          .popUntil((route) => route.isFirst);
    } else {
      currentIndex = index;
    }
    update();
  }

  Future<bool> onWillPop() async {
    final isFirstRouteInCurrentTab =
    !await items[currentIndex].navigationKey.currentState.maybePop();
    if (isFirstRouteInCurrentTab) {
      if (currentIndex != 0) {
        // _selectTab(1);
        return false;
      }
    }
    return isFirstRouteInCurrentTab;
  }

  @override
  void onInit() {
    super.onInit();
    items = [
      //Каталог
      BottomNavigationElement(
        bottomBarItem: BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Home",
        ),
        bottomBarView: LogInScreen(),
        navigationKey: Get.nestedKey('0'),
      ),
      //Любимое
      BottomNavigationElement(
        bottomBarItem: BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "Favorites",
        ),
        bottomBarView: SignUpScreen(),
        navigationKey: Get.nestedKey('1'),
      ),
      //Корзина
      */
/*BottomNavigationElement(
        bottomBarItem: BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: "Cart",
        ),
        bottomBarView: CartPage(),
        navigationKey: Get.nestedKey('2'),
      ),*/ /*

      //Заказы
      */
/*BottomNavigationElement(
        bottomBarItem: BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: "History",
        ),
        bottomBarView: HistoryPage(),
        navigationKey: Get.nestedKey('3'),
      ),*/ /*

      //Меню
      */
/* BottomNavigationElement(
        bottomBarItem: BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: "Menu",
        ),
        bottomBarView: MenuPage(),
        navigationKey: Get.nestedKey('4'),
      ),*/ /*

    ];
  }
}

class BottomNavigationElement {
  Widget bottomBarView;
  BottomNavigationBarItem bottomBarItem;
  GlobalKey<NavigatorState> navigationKey;

  BottomNavigationElement({
    @required this.bottomBarView,
    @required this.bottomBarItem,
    @required GlobalKey<NavigatorState> navigationKey,
  });
}*/
