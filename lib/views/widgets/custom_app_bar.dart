import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title, required this.icon, this.onPressed})
      : super(key: key);

  final String title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 28),
        ),
        const Spacer(),
        CustomIcon(icon: icon,onPressed: onPressed),
      ],
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.icon, this.onPressed}) : super(key: key);

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
          iconSize: 28,
        ),
      ),
    );
  }
}
