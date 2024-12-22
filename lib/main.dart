import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipto_task/Ratnadeep/ratnadeep_bloc.dart';
import 'package:recipto_task/Ratnadeep_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => RatnadeepBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Ratnadeep_Screen(),
      ),
    );
  }
}




class GridViewWithScrollBehavior extends StatefulWidget {
  @override
  _GridViewWithScrollBehaviorState createState() =>
      _GridViewWithScrollBehaviorState();
}

class _GridViewWithScrollBehaviorState
    extends State<GridViewWithScrollBehavior> with SingleTickerProviderStateMixin {
  bool _isAtTop = true;
  late TabController _tabController;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification) {
                  if (scrollNotification.metrics.pixels <= 0) {
                    setState(() {
                      _isAtTop = true;
                    });
                  } else {
                    setState(() {
                      _isAtTop = false;
                    });
                  }
                }
                return true;
              },
      
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        if (_isAtTop) Icon(Icons.arrow_back),
                        if (_isAtTop) Text("Back"),
                        if (!_isAtTop) Icon(Icons.arrow_forward),
                        if (!_isAtTop) Text("Magnolia Bakery"),
                      ],
                    ),
                    if(_isAtTop)...[
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset(
                                'assets/images/Store Logo.png',
                                height: 50,
                                width: 50,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ratnadeep Supermarket',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins-SemiBold',
                                        fontWeight: FontWeight.w600,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '3% cashback * ₹250 Welcome Bonus',
                                    style: TextStyle(
                                        fontFamily: 'Poppins-Regular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      TabBar(
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicator: UnderlineTabIndicator(
                          borderSide:
                          BorderSide(color: Colors.blue, width: 4),
                          insets: EdgeInsets.symmetric(
                              horizontal: 0.0), // Fixed width adjustment
                        ),
                        tabs: [
                          Tab(
                            child: Text(
                              "Store Visit",
                              style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                fontWeight: FontWeight.w600,
                                color: Color(0xff5764DA),
                              ),
                            ),
                          ),
                          Tab(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Online ",
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF8EFFC),
                                      borderRadius:
                                      BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "10% BACK",
                                      style: TextStyle(
                                        color: Color(0xffE40C81),
                                        fontFamily: 'Poppins-Regular',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ] else ...[

                      ],

                    Expanded(
                      child: GridView.builder(
                        itemCount: 30,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return Card(
                            child: Center(child: Text("Item $index")),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}





