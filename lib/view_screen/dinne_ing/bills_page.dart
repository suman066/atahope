import 'package:atahope/Constants/constants.dart';
import 'package:atahope/helper/navigation_helper/app_routes.dart';
import 'package:atahope/helper/navigation_helper/navigation_helper.dart';
import 'package:atahope/view_screen/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillsPage extends StatelessWidget {
  const BillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bills = [
      {
        "image":"assets/images/caffe_paris.png",
        "title": "Cafe de Paris",
        "amount": "29.38 AED",
        "date": "17.07.24",
        "time": "12:30 PM",
        "location": "AE. Marina",
        "summary": "S: 2.5 AED",
        "location1": "Canal",
        "summary1": "T: 5 AED",
        "status": "red"
      },
      {
        "image":"assets/images/caffe_paris.png",
        "title": "Cafe de Paris",
        "amount": "19.38 \$",
        "date": "17.07.24",
        "time": "12:30 PM",
        "location": "US. Bronx",
        "summary": "S: 22.0\$ ",
        "location1": "J.Street",
        "summary1": "T: 8.1\$",
        "status": "red"
      },
      {
        "image":"assets/images/globe1.png",
        "title": "Inter. Transfer",
        "amount": "145 \$",
        "date": "17.07.24",
        "time": "12:30 PM",
        "location": "US. Bronx",
        "summary": "S: 10\$",
        "location1": "J.Street",
        "summary1": "F: 10\$",
        "status": "green"
      },
      {
        "image":"assets/images/tower.png",
        "title": "Nat. Transfer",
        "amount": "548 \$",
        "date": "17.07.24",
        "time": "12:30 PM",
        "location": "US. Bronx",
        "summary": "S: 10\$",
        "location1": "J.Street",
        "summary1": "F: 6\$",
        "status": "green"
      }
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: AppBar(
            scrolledUnderElevation: 0,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            elevation: 0,
            titleSpacing: 0,
            leading: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () {
                NavigationHelper.pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0), // optional to give some spacing
                child: Image.asset(
                  "assets/images/back.png",      // <-- your asset path
                  width: 22,
                  height: 22,
                ),
              ),
            ),
            title: Text(
                'Menu',
                style: GoogleFonts.libreFranklin(
                  textStyle: TextStyle(color: AppColors.textBlack,fontStyle: FontStyle.normal,fontSize: 25,
                    fontWeight: FontWeight.w400,),
                )
            ),
            actions: [
              IconButton(
                onPressed: () {
                  //NavigationHelper.push(AppRoutes.atahope_screen1);
                  Navigator.of(context).pushNamed(AppRoutes.atahope_screen1);
                },
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey[200], // circular background
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(6),
                  minimumSize: const Size(24, 24),
                ),
                icon: const Icon(Icons.add, size: 24, color: Colors.black),
              ),
              const SizedBox(width: 10),
              CustomSwitch(
                value: false,
                onChanged: (val) {
                  // setState(() => isDark = val);
                  debugPrint('Dark mode: $val');
                },
              ),

              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Bills",
              style: GoogleFonts.libreFranklin(
                textStyle: TextStyle(color: AppColors.textBlack,fontStyle: FontStyle.normal,fontSize: 35,
                  fontWeight: FontWeight.w400,),
              ),
            ),
            SizedBox(height: 40,),
            Expanded(
              child: ListView.builder(
                itemCount: bills.length,
                itemBuilder: (context, index) {
                  final bill = bills[index];
                  return BillCard(
                    image: bill["image"]!,
                    title: bill["title"]!,
                    date: bill["date"]!,
                    time: bill["time"]!,
                    location: bill["location"]!,
                    amount: bill["amount"]!,
                    summary: bill["summary"]!,
                    location1: bill["location1"]!,
                    summary1: bill["summary1"]!,
                    showNotificationDot: bill["status"] == "green",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}






class BillCard extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String time;
  final String location;
  final String amount;
  final String summary;
  final String location1;
  final String summary1;
  final bool showNotificationDot;

  const BillCard({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.amount,
    required this.summary,
    required this.summary1,
    required this.location1,
    this.showNotificationDot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.gray,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 13,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/note.png",
                      width: 40,
                      height: 40,
                    ),
                  ],
                ),
              ),
              // 🧾 Column 1 — Icon + Title + Amount
              Expanded(
                flex: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Image.asset(
                           image,
                            width: 20,
                            height: 20,
                          ),
                        ),
                        const SizedBox(width: 3),
                        Flexible(
                          child: Text(
                            title,
                            style: GoogleFonts.secularOne(
                              textStyle: const TextStyle(fontStyle: FontStyle.normal,color:AppColors.textBlack,fontSize: 15,
                                fontWeight: FontWeight.w400,),
                            ),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        amount,
                        style: GoogleFonts.libreFranklin(
                          textStyle: const TextStyle(fontStyle: FontStyle.normal,color:AppColors.textBlack,fontSize: 15,
                            fontWeight: FontWeight.w400,),
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 2),
              // 📅 Column 2 — Date + Time
              Expanded(
                flex: 18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: GoogleFonts.libreFranklin(
                        textStyle: const TextStyle(fontStyle: FontStyle.normal,color:AppColors.textBlack,fontSize: 15,
                          fontWeight: FontWeight.w400,),
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      time,
                      style: GoogleFonts.libreFranklin(
                        textStyle: const TextStyle(fontStyle: FontStyle.normal,color:AppColors.textBlack,fontSize: 15,
                          fontWeight: FontWeight.w400,),
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 2),
              // 📍 Column 3 — Location + Summary
              Expanded(
                flex: 22,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      location,
                      style: GoogleFonts.libreFranklin(
                        textStyle: const TextStyle(fontStyle: FontStyle.normal,color:AppColors.textBlack,fontSize: 15,
                          fontWeight: FontWeight.w400,),
                      ),
                      softWrap: true,
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      summary,
                      style: GoogleFonts.libreFranklin(
                        textStyle: const TextStyle(fontStyle: FontStyle.normal,color:AppColors.textBlack,fontSize: 15,
                          fontWeight: FontWeight.w400,),
                      ),
                      softWrap: true,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 2),
              Expanded(
                flex: 18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      location1,
                      style: GoogleFonts.libreFranklin(
                        textStyle: const TextStyle(fontStyle: FontStyle.normal,color:AppColors.textBlack,fontSize: 15,
                          fontWeight: FontWeight.w400,),
                      ),
                      softWrap: true,
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      summary1,
                      style: GoogleFonts.libreFranklin(
                        textStyle: const TextStyle(fontStyle: FontStyle.normal,color:AppColors.textBlack,fontSize: 15,
                          fontWeight: FontWeight.w400,),
                      ),
                      softWrap: true,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: showNotificationDot?AppColors.green:AppColors.red,
              shape: BoxShape.circle,
            ),
          ),
        ),

      ],
    );
  }
}




