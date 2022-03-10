import 'package:flutter/material.dart';
import 'package:flutterfire_demo/utils/fade_animation.dart';

class PickTimePage extends StatefulWidget {
  const PickTimePage({Key? key}) : super(key: key);

  @override
  _PickTimePageState createState() => _PickTimePageState();
}

class _PickTimePageState extends State<PickTimePage> {
  int? selectedDate;
  int? selectedTime;
  bool isColored = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF1F1F1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Select Date and Time',
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimation(
                    delay: 0,
                    child: Text(
                      'Select Date',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return FadeAnimation(
                          delay: 600,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDate = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  color: selectedDate == index
                                      ? Colors.blue.shade50
                                      : Colors.white,
                                  border: Border.all(
                                      color: selectedDate == index
                                          ? Colors.blue
                                          : Colors.grey.shade300,
                                      width: 3),
                                  borderRadius: BorderRadius.circular(12)),
                              height: 100,
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${index + 1}',
                                  ),
                                  Text(
                                    'Dec',
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  FadeAnimation(
                    delay: 200,
                    child: Text(
                      'Select Time',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 13,
                      itemBuilder: (context, index) {
                        return FadeAnimation(
                          delay: 600,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTime = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: selectedTime == index
                                      ? Colors.blue.shade50
                                      : Colors.white,
                                  border: Border.all(
                                      color: selectedTime == index
                                          ? Colors.blue
                                          : Colors.grey.shade300,
                                      width: 2)),
                              height: 50,
                              width: 100,
                              child: Center(
                                child: Text(
                                  '${index + 6}:00',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  FadeAnimation(
                    delay: 400,
                    child: Text(
                      'Color Preference',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  FadeAnimation(
                    delay: 600,
                    child: Container(
                        padding: const EdgeInsets.all(12),
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isColored = true;
                                    });
                                  },
                                  child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isColored
                                              ? Colors.blue
                                              : Colors.grey.shade300),
                                      child: const Center(
                                          child: Icon(
                                        Icons.check_sharp,
                                        size: 14,
                                        color: Colors.white,
                                      ))),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Color Clothes',
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isColored = false;
                                    });
                                  },
                                  child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: !isColored
                                              ? Colors.blue
                                              : Colors.grey.shade300),
                                      child: const Center(
                                          child: Icon(
                                        Icons.check_sharp,
                                        size: 14,
                                        color: Colors.white,
                                      ))),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'White Clothes',
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                  const SizedBox(height: 12),
                  FadeAnimation(
                    delay: 800,
                    child: Text(
                      'Additional Notes',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  FadeAnimation(
                    delay: 1000,
                    child: Container(
                        padding: const EdgeInsets.all(12),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: TextField(
                            maxLines: 6,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                isCollapsed: true,
                                isDense: true,
                                hintText: 'Your notes here'),
                          ),
                        )),
                  ),
                ],
              )),
        ),
        bottomNavigationBar: FadeAnimation(
          delay: 1200,
          child: Container(
            height: 60,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Done',
                ),
              ),
            ),
          ),
        ));
  }
}
