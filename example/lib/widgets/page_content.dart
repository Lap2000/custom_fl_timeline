import 'package:flutter/material.dart';

const double mobileBreakpoint = 700;

class PageContent extends StatelessWidget {
  const PageContent({
    super.key,
    required this.title,
    this.child,
  });

  final String title;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < mobileBreakpoint;
    return Center(
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: isMobile ? 0 : 10, horizontal: 10),
        constraints: const BoxConstraints(
          maxWidth: 800,
          maxHeight: 800,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Flexible(child: child ?? const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
