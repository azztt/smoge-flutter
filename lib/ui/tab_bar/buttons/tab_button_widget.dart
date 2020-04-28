import 'package:flutter/material.dart';
import 'package:smoge/ui/common_widget/circular_icon_button.dart';
import 'package:smoge/ui/tab_bar/navigation_tab.dart';
import 'package:smoge/utils/decorations.dart';

class TabButtonWidget extends StatefulWidget {
  const TabButtonWidget({@required this.tab, this.onPressed})
      : assert(tab != null);

  final NavigationTab tab;
  final VoidCallback onPressed;

  @override
  State<StatefulWidget> createState() => _TabButtonWidgetState();
}

class _TabButtonWidgetState extends State<TabButtonWidget> {
  Alignment _alignment;

  @override
  void initState() {
    super.initState();

    _alignment = Alignment.bottomRight;
  }

  @override
  Widget build(BuildContext context) => AnimatedAlign(
        duration: Duration(milliseconds: 150),
        alignment: _alignment,
        curve: Curves.easeInOut,
        onEnd: _animationDidEnd,
        child: CircularIconButton(
          margin: EdgeInsets.only(left: 25.0),
          icon: widget.tab.icon,
          onPressed: () => setState(() => _alignment = Alignment.topRight),
        ),
      );

  void _animationDidEnd() {
    if (_alignment == Alignment.bottomRight) {
      widget.onPressed?.call();
    } else {
      setState(() => _alignment = Alignment.bottomRight);
    }
  }
}
