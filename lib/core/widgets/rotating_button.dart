import 'package:flutter/material.dart';

class IconDropdownItem {
  final IconData icon;
  final VoidCallback onTap;

  const IconDropdownItem({
    required this.icon,
    required this.onTap,
  });
}

class IconDropdownMenu extends StatefulWidget {
  const IconDropdownMenu({
    super.key,
    required this.items,
    this.size = 50,
    this.spacing = 8,
    this.mainIcon = Icons.menu,
    this.backgroundColor,
    this.iconColor,
    this.animationDuration = const Duration(milliseconds: 450),
  });

  final List<IconDropdownItem> items;
  final double size;
  final double spacing;
  final IconData mainIcon;
  final Color? backgroundColor;
  final Color? iconColor;
  final Duration animationDuration;

  @override
  State<IconDropdownMenu> createState() => _IconDropdownMenuState();
}

class _IconDropdownMenuState extends State<IconDropdownMenu>
    with SingleTickerProviderStateMixin {
  final LayerLink _link = LayerLink();
  OverlayEntry? _entry;
  bool _open = false;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _entry?.remove();
    super.dispose();
  }

  void _toggleMenu() {
    if (_open) {
      _controller.reverse().then((_) {
        _entry?.remove();
        _entry = null;
        setState(() => _open = false);
      });
    } else {
      _entry = _createOverlay();
      Overlay.of(context).insert(_entry!);
      setState(() => _open = true);
      _controller.forward(from: 0);
    }
  }

  OverlayEntry _createOverlay() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          width: widget.size,
          child: CompositedTransformFollower(
            link: _link,
            offset: Offset(0, widget.size + 5), // under the main button
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < widget.items.length; i++) ...[
                    _buildAnimatedDropdownIcon(
                      item: widget.items[i],
                      index: i,
                      total: widget.items.length,
                    ),
                    if (i != widget.items.length - 1)
                      SizedBox(height: widget.spacing),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedDropdownIcon({
    required IconDropdownItem item,
    required int index,
    required int total,
  }) {
    final colors = Theme.of(context).colorScheme;
    final bg = widget.backgroundColor ?? colors.primary;
    final fg = widget.iconColor ?? colors.onPrimary;
    // Staggered interval for "falling" effect
    final double start = (index / (total + 1)) * 0.7; // from 0 to ~0.7
    final animation = CurvedAnimation(
      parent: _controller,
      curve: Interval(
        start,
        1.0,
        curve: Curves.easeOutBack,
      ),
    );

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -0.4),
          end: Offset.zero,
        ).animate(animation),
        child: GestureDetector(
          onTap: () {
            // close menu first
            _toggleMenu();
            // then run the callback
            item.onTap();
          },
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: bg,
              shape: BoxShape.circle,
            ),
            child: Icon(
              item.icon,
              color: fg,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final bg = widget.backgroundColor ?? colors.primary;
    final fg = widget.iconColor ?? colors.onPrimary;

    return CompositedTransformTarget(
      link: _link,
      child: GestureDetector(
        onTap: _toggleMenu,
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: bg,
            shape: BoxShape.circle,
          ),
          child: AnimatedRotation(
            turns: _open ? 0.5 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Icon(
              widget.mainIcon,
              color: fg,
            ),
          ),
        ),
      ),
    );
  }
}
