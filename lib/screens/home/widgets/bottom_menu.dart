import 'package:flutter/material.dart';
import 'package:travel_planning_app/constants/colors.dart';

class PinterestButton {
  final IconData icon;
  final VoidCallback onPressed;

  PinterestButton({
    required this.icon,
    required this.onPressed,
  });
}

class BottomMenu extends StatelessWidget {
  final bool mostrar;
  BottomMenu({Key? key, this.mostrar = true}) : super(key: key);
  final List<PinterestButton> items = [
    PinterestButton(
        icon: Icons.home_rounded,
        onPressed: () {
          print('park');
        }),
    PinterestButton(
        icon: Icons.bar_chart_rounded,
        onPressed: () {
          print('work');
        }),
    PinterestButton(
        icon: Icons.location_on,
        onPressed: () {
          print('array');
        }),
    PinterestButton(
        icon: Icons.people_alt_rounded,
        onPressed: () {
          print('language');
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: (mostrar) ? 1 : 0,
      duration: Duration(milliseconds: 300),
      child: _PinterestMenuBackground(
        child: _MenuItems(menuItems: items),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  const _PinterestMenuBackground({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 280,
      height: 50,
      decoration: BoxDecoration(
          color: kPrimaryDark,
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5),
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  const _MenuItems({
    Key? key,
    required this.menuItems,
  }) : super(key: key);

  final List<PinterestButton> menuItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length, (i) => _MenuButton(i: i, item: menuItems[i])),
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({Key? key, required this.i, required this.item})
      : super(key: key);

  final int i;
  final PinterestButton item;

  @override
  Widget build(BuildContext context) {
    // final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    return GestureDetector(
      onTap: () {
        // Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = i;
        // item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          color: kWhite,
          size: 25,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }
}
