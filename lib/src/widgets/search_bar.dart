import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: const Text(
            'Your Cities',
            style: TextStyle(fontSize: 18),
          ),
          margin:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(left: 20, right: 20),
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: const Color(0xffE4E4EE)),
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: InkWell(
            onTap: () {
              // print('Search Clicked');
            },
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Search for more locations...',
                    style: TextStyle(fontSize: 14, color: Color(0xffBDBCE1)),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.search,
                  size: 24,
                  color: Color(0xffBDBCE1),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
