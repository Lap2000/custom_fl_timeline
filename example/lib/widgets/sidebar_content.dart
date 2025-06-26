import 'package:flutter/material.dart';

class SidebarItem {
  final int id;
  final String title;
  final IconData icon;
  final Widget content;

  const SidebarItem({
    required this.id,
    required this.title,
    required this.icon,
    required this.content,
  });
}

class SidebarContent extends StatelessWidget {
  const SidebarContent({
    super.key,
    required this.isExpanded,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.isMobile,
    required this.sidebarItems,
  });

  final bool isExpanded;
  final int selectedIndex;
  final Function(int) onItemTapped;
  final bool isMobile;
  final List<SidebarItem> sidebarItems;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: isExpanded
                ? const Text(
                    'Custom FL Timeline',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.lightBlueAccent,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                  )
                : const SizedBox.shrink(),
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: sidebarItems.length,
            itemBuilder: (context, index) {
              final item = sidebarItems[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Material(
                  color: selectedIndex == index
                      ? Colors.blueAccent.shade700
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => onItemTapped(index),
                    hoverColor: selectedIndex == index
                        ? Colors.blueAccent.shade700
                        : Colors.blueGrey.shade700,
                    highlightColor: selectedIndex == index
                        ? Colors.blueAccent.shade700
                        : Colors.blueGrey.shade600,
                    splashColor: Colors.blue.shade300,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            item.icon,
                            color: Colors.white,
                            size: 28,
                          ),
                          if (isExpanded)
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  item.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
