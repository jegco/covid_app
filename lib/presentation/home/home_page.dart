import 'package:covidapp/presentation/global/global_page.dart';
import 'package:covidapp/presentation/home/home_bloc.dart';
import 'package:covidapp/presentation/home/home_event.dart';
import 'package:covidapp/presentation/home/home_state.dart';
import 'package:covidapp/presentation/localinfo/local_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _navigationBloc;
  int _selectedIndex;
  PageController _pageController;
  final _pages = [
    LocalInfoPage(),
    GlobalPage(),
  ];

  @override
  void initState() {
    _pageController = PageController(keepPage: true, initialPage: 0);
    _navigationBloc = BlocProvider.of<HomeBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder(
      bloc: _navigationBloc,
      builder: (BuildContext context, HomeState state) {
        _selectedIndex = state is Colombia ? state.selectedIndex : 1;
        return Scaffold(
          body: Container(
            color: Colors.orange[700],
            child: PageView(
              controller: _pageController,
              onPageChanged: (int newPage) {
                _onTapItem(newPage);
              },
              children: _pages,
            )
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: SizedBox(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.public),
                title: SizedBox(),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onTapItem,
          ),
        );
      },
    );
  }

  void _onTapItem(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
    _navigationBloc.add(index == 0 ? NavigateToColombia() : NavigateToGlobal());
  }

  @override
  void dispose() {
    _navigationBloc.close();
    super.dispose();
  }
}
