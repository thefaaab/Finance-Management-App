import 'package:finance_app/data/model/addData.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final box = Hive.box<AddData>('data');
  DateTime date = DateTime.now();
  String? selectedItem;
  String? selectedItemi;
  final TextEditingController explainContainer = TextEditingController();
  FocusNode explain = FocusNode();
  final TextEditingController amountContainer = TextEditingController();
  FocusNode amount = FocusNode();
  final List<String> _item = [
    "Food",
    "Transfer",
    "Transportation",
    "Grocery",
  ];
  final List<String> _itemi = [
    "Income",
    "Expense",
  ];
  @override
  void initState() {
    // TODO: implement initState

    explain.addListener(() {
      setState(() {});
    });
    amount.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 204, 255, 205),
              Color.fromARGB(255, 169, 216, 255)
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            backgroundContainer(context),
            Positioned(
              top: 120,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                height: 650,
                width: 340,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    categoryField(),
                    const SizedBox(
                      height: 40,
                    ),
                    explainField(),
                    const SizedBox(
                      height: 40,
                    ),
                    amountField(),
                    const SizedBox(
                      height: 40,
                    ),
                    iandeField(),
                    const SizedBox(
                      height: 40,
                    ),
                    dateTimeField(context),
                    const Spacer(),
                    saveBtn(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector saveBtn() {
    return GestureDetector(
      onTap: () {
        var add = AddData(selectedItemi!, amountContainer.text, date,
            explainContainer.text, selectedItem!);
        box.add(add);
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          width: 120,
          height: 50,
          child: Text(
            'Save',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget dateTimeField(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: Colors.grey),
      ),
      width: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextButton(
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(1950),
                lastDate: DateTime(2100));
            if (newDate == null) return;
            setState(() {
              date = newDate;
            });
          },
          child: Text(
            'Day: ${date.day}/${date.month}/${date.year}',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Padding iandeField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Colors.grey,
          ),
        ),
        child: DropdownButton<String>(
          value: selectedItemi,
          onChanged: ((value) {
            setState(() {
              selectedItemi = value!;
            });
          }),
          items: _itemi
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          width: 34,
                          child: Image.asset('assets/images/${e}.png'),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          e,
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
          selectedItemBuilder: (BuildContext context) => _itemi
              .map((e) => Row(
                    children: [
                      Container(
                        width: 34,
                        child: Image.asset('assets/images/${e}.png'),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        e,
                        style: GoogleFonts.poppins(
                            fontSize: 16, color: Colors.black),
                      )
                    ],
                  ))
              .toList(),
          hint: Text(
            "Icome / Expense",
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }

  Padding amountField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: amount,
        controller: amountContainer,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Amount',
          labelStyle: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2, color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xFF008172),
            ),
          ),
        ),
      ),
    );
  }

  Padding explainField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        focusNode: explain,
        controller: explainContainer,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Explain',
          labelStyle: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2, color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2, color: Color(0xFF008172)),
          ),
        ),
      ),
    );
  }

  Padding categoryField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Colors.grey,
          ),
        ),
        child: DropdownButton<String>(
          value: selectedItem,
          onChanged: ((value) {
            setState(() {
              selectedItem = value!;
            });
          }),
          items: _item
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          child: Image.asset('assets/images/${e}.png'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          e,
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
          selectedItemBuilder: (BuildContext context) => _item
              .map((e) => Row(
                    children: [
                      Container(
                        width: 30,
                        child: Image.asset('assets/images/${e}.png'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        e,
                        style: GoogleFonts.poppins(
                            fontSize: 16, color: Colors.black),
                      )
                    ],
                  ))
              .toList(),
          hint: Text(
            "Category",
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }

  Column backgroundContainer(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back_rounded),
              ),
              Text(
                'Add',
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const Icon(Icons.attach_file_rounded)
            ],
          ),
        ),
      ],
    );
  }
}
