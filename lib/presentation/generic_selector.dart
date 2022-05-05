import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../infrastructures/generic.dart';

class GenericSelector extends StatefulWidget {
  const GenericSelector({
    Key? key,
    required this.genericList,
    required this.title,
    this.isSubtitled,
  }) : super(key: key);

  final String title;
  final List<Generic> genericList;
  final bool? isSubtitled;

  @override
  _GenericSelectorState createState() => _GenericSelectorState();
}

class _GenericSelectorState extends State<GenericSelector> {
  final _lists = <Generic>[];

  @override
  void initState() {
    _lists.addAll(widget.genericList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VxAppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: widget.title.text.black.make(),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        searchBar: true,
        searchBarColorTheme: Colors.black,
        searchTextStyle: const TextStyle(
          color: Colors.black,
        ),
        onChanged: (k) {
          if (k.isEmpty) {
            _lists.clear();
            setState(() {
              _lists.addAll(widget.genericList);
            });
          } else {
            final l = _lists
                .where((e) => e.title.toLowerCase().contains(k.toLowerCase()))
                .toList();
            _lists.clear();
            setState(() {
              _lists.addAll(l);
            });
          }
        },
      ),
      body: ListView.separated(
        itemBuilder: (context, i) => ListTile(
          title: _lists[i].title.text.make(),
          onTap: () => Navigator.pop(context, _lists[i]),
        ),
        separatorBuilder: (context, _) => const Divider(),
        itemCount: _lists.length,
      ),
    );
  }
}
