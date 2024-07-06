import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  Future<void> _handleRefresh() async {
    // Simulate a delay for refresh
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // Reset any variables or states that need to be refreshed
      index = 0; // Reset index for the IndexedStack
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'TO DO LIST',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                background: Image.network(
                  'https://as1.ftcdn.net/v2/jpg/05/59/26/68/500_F_559266834_5AB7JDKaGhnjdPZ5ogBKmU3NHk0kidpk.jpg', // Replace with your image URL
                  fit: BoxFit.cover,
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 202, 111, 141),
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.maximize),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.restore),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (index == 0) {
                      return GridView.count(
                        crossAxisCount: 8,
                        shrinkWrap: true,
                        children: [
                          for (int i = 0; i < 8; i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                color: const Color.fromRGBO(156, 94, 123, 1),
                              ),
                            ),
                          Center(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 100,
                                width: 200,
                              ),
                            ),
                          ),
                          Center(
                            child: IndexedStack(
                              index: index,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 100,
                                    width: 200,
                                    color: const Color.fromARGB(
                                        255, 192, 122, 171),
                                    child: const Center(
                                      child: Text(
                                        '0',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color:
                                      const Color.fromARGB(255, 134, 80, 118),
                                  child: const Center(
                                    child: Text(
                                      '1',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    color: const Color.fromARGB(
                                        255, 192, 122, 171),
                                    child: const Center(
                                      child: Text(
                                        '2',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: FloatingActionButton(
                              child: const Icon(Icons.change_circle),
                              onPressed: () {
                                setState(() {
                                  index = (index + 1) % 3;
                                });
                              },
                            ),
                          ),
                        ],
                      );
                    } else if (index == 1) {
                      return Container(
                        height: 500,
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            Container(
                              height: 50,
                              color: const Color.fromARGB(255, 178, 160, 209),
                              child: const Center(
                                child: Text('Assignment Compiler Construction'),
                              ),
                            ),
                            Container(
                              height: 50,
                              color: const Color.fromARGB(255, 143, 197, 145),
                              child: const Center(
                                child: Text('Quiz Operating System'),
                              ),
                            ),
                            Container(
                              height: 50,
                              color: const Color.fromARGB(255, 156, 216, 206),
                              child: const Center(
                                child: Text('Open ended Lab'),
                              ),
                            ),
                            Container(
                              height: 50,
                              color: const Color.fromARGB(255, 148, 184, 172),
                              child: const Center(
                                child: Text('DAA assignment'),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (index == 2) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('Subject')),
                            DataColumn(label: Text('Assignment')),
                            DataColumn(label: Text('Due Date')),
                          ],
                          rows: const [
                            DataRow(cells: [
                              DataCell(Text('Compiler Construction')),
                              DataCell(Text('Assignment 1')),
                              DataCell(Text('2024-07-10')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Operating System')),
                              DataCell(Text('Quiz 2')),
                              DataCell(Text('2024-07-11')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('DAA')),
                              DataCell(Text('Assignment 2')),
                              DataCell(Text('2024-07-12')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Open ended Lab')),
                              DataCell(Text('Lab Report 1')),
                              DataCell(Text('2024-07-13')),
                            ]),
                          ],
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                  childCount: 3, // Adjust based on the number of sections
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: MyPersistentHeaderDelegate(),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 200,
                color: Colors.blueGrey,
                child: Center(
                  child: Text(
                    'Additional Section',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 60;
  @override
  double get maxExtent => 60;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Text(
        'Persistent Header',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
