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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        leading: InkWell(
        onTap:(){
          NavigationHelper.pop();
        },
        child: const Icon(Icons.arrow_back, color: Colors.black,)),
        title: Text(
            'Menu',
            style: GoogleFonts.secularOne(
              textStyle: const TextStyle(letterSpacing: 1.0,color:AppColors.textBlack,fontSize: 16,
                fontWeight: FontWeight.w200,),
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
              padding: const EdgeInsets.all(6), // 👈 smaller tap area
              minimumSize: const Size(24, 24),  // 👈 controls overall button size
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Bills",
              style: GoogleFonts.secularOne(
                textStyle: const TextStyle(letterSpacing: 1.0,color:AppColors.textBlack,fontSize: 18,
                  fontWeight: FontWeight.w300,),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: bills.length,
                itemBuilder: (context, index) {
                  final bill = bills[index];
                  return BillCard(
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
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.receipt_long,
                      color: AppColors.black87,
                      size: 35,
                    ),
                  ],
                ),
              ),
              // 🧾 Column 1 — Icon + Title + Amount
              Expanded(
                flex: 2,
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
                          child: const Icon(Icons.local_cafe,
                              color: AppColors.red, size: 14),
                        ),
                        const SizedBox(width: 3),
                        Flexible(
                          child: Text(
                            title,
                            style: GoogleFonts.secularOne(
                              textStyle: const TextStyle(letterSpacing: .5,color:AppColors.textBlack,fontSize: 13,
                                fontWeight: FontWeight.w500,),
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
                        style: GoogleFonts.secularOne(
                          textStyle: const TextStyle(letterSpacing: 1.0,color:AppColors.black87,fontSize: 11,
                            fontWeight: FontWeight.w100,),
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),

              // 📅 Column 2 — Date + Time
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: GoogleFonts.secularOne(
                        textStyle: const TextStyle(letterSpacing: 1.0,color:AppColors.black87,fontSize: 11,
                          fontWeight: FontWeight.w100,),
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      time,
                      style: GoogleFonts.secularOne(
                        textStyle: const TextStyle(letterSpacing: 1.0,color:AppColors.black87,fontSize: 11,
                          fontWeight: FontWeight.w100,),
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // 📍 Column 3 — Location + Summary
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      location,
                      style: GoogleFonts.secularOne(
                        textStyle: const TextStyle(letterSpacing: 1.0,color:AppColors.black87,fontSize: 11,
                          fontWeight: FontWeight.w100,),
                      ),
                      softWrap: true,
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      summary,
                      style: GoogleFonts.secularOne(
                        textStyle: const TextStyle(letterSpacing: 1.0,color:AppColors.black87,fontSize: 11,
                          fontWeight: FontWeight.w100,),
                      ),
                      softWrap: true,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      location1,
                      style: GoogleFonts.secularOne(
                        textStyle: const TextStyle(letterSpacing: 1.0,color:AppColors.black87,fontSize: 11,
                          fontWeight: FontWeight.w100,),
                      ),
                      softWrap: true,
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      summary1,
                      style: GoogleFonts.secularOne(
                        textStyle: const TextStyle(letterSpacing: 1.0,color:AppColors.black87,fontSize: 11,
                          fontWeight: FontWeight.w100,),
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




