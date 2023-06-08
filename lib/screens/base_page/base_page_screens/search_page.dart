import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int currentTabIndex = 0;

  changeTabIndex(int newIndex) {
    setState(() {
      currentTabIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          color: Colors.grey.shade300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    changeTabIndex(0);
                  },
                  child: Text(
                    'data1',
                    style: TextStyle(
                        fontSize: currentTabIndex == 0 ? 18 : 14,
                        fontWeight: currentTabIndex == 0
                            ? FontWeight.bold
                            : FontWeight.w300,
                        color: currentTabIndex == 0
                            ? Colors.black
                            : Colors.grey.shade600),
                  )),
              InkWell(
                  onTap: () {
                    changeTabIndex(1);
                  },
                  child: Text(
                    'data2',
                    style: TextStyle(
                        fontSize: currentTabIndex == 1 ? 18 : 14,
                        fontWeight: currentTabIndex == 1
                            ? FontWeight.bold
                            : FontWeight.w300,
                        color: currentTabIndex == 1
                            ? Colors.black
                            : Colors.grey.shade600),
                  )),
            ],
          ),
        ),
        if (currentTabIndex == 0) ...[
          const Text('This is Tab 1')
        ] else ...[
          const Text('This is Tab 2')
        ]
      ],
    ));
  }
}
