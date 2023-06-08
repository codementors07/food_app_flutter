import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TabBar(tabs: [
                Tab(
                  // text: 'Tab1',
                  child: Text(
                    'Tab 1',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  // text: 'Tab2',
                  child: Text(
                    'Tab 2',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  // text: 'Tab3',
                  child: Text(
                    'Tab 3',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ]),
              Expanded(
                child: TabBarView(children: [
                  SingleChildScrollView(
                    child: Column(
                      children:
                          List.generate(100, (index) => const Text('data 223')),
                    ),
                  ),
                  const Center(
                    child: Text('data2'),
                  ),
                  const Center(
                    child: Text('data3'),
                  ),
                ]),
              )
            ],
          )),
    ));
  }
}


//DefaultTabController , tabbar, tabbaview
//tabbar and tabbarview, initial index 
//custom tabbar  