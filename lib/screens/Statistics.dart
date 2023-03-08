import 'package:finance_app/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  int indexColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Statistics',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(4, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                indexColor = index;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: indexColor == index
                                      ? Colors.black
                                      : Colors.white),
                              alignment: Alignment.center,
                              child: Text(
                                day[index],
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: indexColor == index
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Expense',
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              const Icon(
                                Icons.arrow_downward_sharp,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Chart()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
