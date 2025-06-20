import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentPage = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finstagram"),
        actions: [
          GestureDetector(
            onTap: (){

            },
            child: const Icon(Icons.add_a_photo),
          ),
          const Padding(padding:EdgeInsets.only(left: 8.0,right: 8.0) ),
           GestureDetector(
            onTap: (){
              
            },
            child: const Icon(Icons.logout),
          )
        ],
      ),
      bottomNavigationBar:_bottomNavigationBar() ,
    );
  }

  Widget _bottomNavigationBar(){
    return BottomNavigationBar(
currentIndex: _currentPage,
      onTap: (_index){
        setState(() {
          _currentPage = _index;
        });
        print(_index);
      },
      items: const [
      
      BottomNavigationBarItem(
        label: 'Feed',
        icon: Icon(Icons.feed)),
         BottomNavigationBarItem(
        label: 'Profile',
        icon: Icon(Icons.account_box)),
    ]);
  }
}