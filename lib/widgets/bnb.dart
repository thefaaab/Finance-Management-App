import 'package:finance_app/screens/Statistics.dart';
import 'package:flutter/material.dart';

import '../screens/Home.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int indexColor = 0;
  List listScreen = [Home(), Statistics(), Home(), Statistics()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listScreen[indexColor],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      indexColor = 0;
                    },
                  );
                },
                child: Icon(
                  Icons.home_filled,
                  size: 30,
                  color: indexColor == 0 ? Colors.black : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      indexColor = 1;
                    },
                  );
                },
                child: Icon(
                  Icons.bar_chart_rounded,
                  size: 30,
                  color: indexColor == 1 ? Colors.black : Colors.grey,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      indexColor = 2;
                    },
                  );
                },
                child: Icon(
                  Icons.wallet,
                  size: 30,
                  color: indexColor == 2 ? Colors.black : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      indexColor = 3;
                    },
                  );
                },
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: indexColor == 3 ? Colors.black : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
