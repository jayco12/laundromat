import 'package:flutter/material.dart';
import 'package:haysters_laundromat/Database/order_database.dart';
import 'package:haysters_laundromat/components/order_database.dart';
import 'package:haysters_laundromat/order/Edit_order.dart';
import 'package:haysters_laundromat/order/order_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firestore Modeling',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(title: 'Dashboard'),
        '/add': (context) => const OrderScreen(),
        '/edit': (context) => const EditOrderScreen()
      },
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DatabaseService service = DatabaseService();
  Future<List<Order>>? orderList;
  List<Order>? retrievedOrderList;

  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: orderList,
            builder:
                (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.separated(
                    itemCount: retrievedOrderList!.length,
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemBuilder: (context, index) {
                      return Dismissible(
                        onDismissed: ((direction) async {
                          await service.deleteOrder(
                              retrievedOrderList![index].id.toString());
                          _dismiss();
                        }),
                        background: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(16.0)),
                          padding: const EdgeInsets.only(right: 28.0),
                          alignment: AlignmentDirectional.centerEnd,
                          child: const Text(
                            "DELETE",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        resizeDuration: const Duration(milliseconds: 200),
                        key: UniqueKey(),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 83, 80, 80),
                              borderRadius: BorderRadius.circular(16.0)),
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, "/edit",
                                  arguments: retrievedOrderList![index]);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            title: Text(retrievedOrderList![index].name),
                            subtitle: Text(
                                "${retrievedOrderList![index].address.cityName.toString()}, ${retrievedOrderList![index].address.streetName.toString()}"),
                            trailing: const Icon(Icons.arrow_right_sharp),
                          ),
                        ),
                      );
                    });
              } else if (snapshot.connectionState == ConnectionState.done &&
                  retrievedOrderList!.isEmpty) {
                return Center(
                  child: ListView(
                    children: const <Widget>[
                      Align(
                          alignment: AlignmentDirectional.center,
                          child: Text('No data available')),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.pushNamed(context, '/add');
        }),
        tooltip: 'add',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _refresh() async {
    orderList = service.retrieveOrder();
    retrievedOrderList = await service.retrieveOrder();
    setState(() {});
  }

  void _dismiss() {
    orderList = service.retrieveOrder();
  }

  Future<void> _initRetrieval() async {
    orderList = service.retrieveOrder();
    retrievedOrderList = await service.retrieveOrder();
  }
}
