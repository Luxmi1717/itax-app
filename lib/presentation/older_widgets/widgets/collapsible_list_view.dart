import 'package:flutter/material.dart';

class CollapsibleListView extends StatefulWidget {
  final String title;
  final Map<String, String?> data;

  const CollapsibleListView({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  CollapsibleListViewState createState() => CollapsibleListViewState();
}

class CollapsibleListViewState extends State<CollapsibleListView> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.title),
            trailing: IconButton(
              icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: widget.data.entries.map((entry) {
                  final label = entry.key;
                  final value = entry.value;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text('$label: $value'),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
