import 'package:aayushman_bhaarat/questionarrie/question_complete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/chat_bubble_ui.dart';
import '../utils/custom_progressbar.dart';

class QuestionList extends StatefulWidget {
  const QuestionList({super.key});

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  List<String> questionList = ["Sedentary (Little or no exercise)", "Lightly Active (Exercise 1-3 days/week)", "Moderately Active (Exercise 3-5 days/week)", "Very Active (Exercise 6-7 days/week)"];
  String selectedQuestion = "";
  List<String> questionList2 = ["Low (Rarely stressed)", "Moderate (Manageable stress)", "High (Frequently stressed)", "Very High (Constantly stressed)"];
  List<String> questionList1 = ["Less than 5 hours", "5-7 hours", "7-9 hours", "More than 9 hours"];
  List<String> preferences1 = ["Never", "Occasionally", "Regularly"];
  final Map<String, bool> preferences3 = {"Anxiety": false, "Depression": false, "Not experienced yet": false, "I prefer not to answer": false};
  final Map<String, bool> preferences = {"Vegetarian": false, "Non-Vegetarian": false, "Vegan": false, "Gluten-Free": false, "Other": false};
  int pageNumber = 0, selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (pageNumber == 0) {
          Navigator.pop(context);
          return Future.value(true);
        } else {
          setState(() {
            pageNumber -= 1;
          });
          return Future.value(false);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Padding(
                padding: const EdgeInsets.only(left: 6.0, top: 12, right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (pageNumber == 0) {
                            Navigator.pop(context);
                          } else {
                            setState(() {
                              pageNumber -= 1;
                            });
                          }
                        },
                        icon: const Icon(Icons.arrow_back, color: Colors.black)),
                    Expanded(
                        child: CustomProgressBar(
                            progress: pageNumber == 0
                                ? 0.2
                                : pageNumber == 1
                                    ? 0.35
                                    : pageNumber == 2
                                        ? 0.45
                                        : pageNumber == 3
                                            ? 0.58
                                            : pageNumber == 4
                                                ? 0.70
                                                : pageNumber == 5
                                                    ? 0.82
                                                    : pageNumber == 6
                                                        ? 0.94
                                                        : pageNumber == 7
                                                            ? 1.1
                                                            : pageNumber == 8
                                                                ? 2
                                                                : 0)),
                  ],
                )),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset("asset/question2.png", height: 114, width: 49, fit: BoxFit.fill),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Chat Bubble
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: const Color(0xffEBEFFD), borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          pageNumber == 0
                              ? "How active are you in daily life?"
                              : pageNumber == 1
                                  ? "What are your dietary preferences?"
                                  : pageNumber == 2
                                      ? "How often do you consume alcohol?"
                                      : pageNumber == 3
                                          ? "Do you smoke?"
                                          : pageNumber == 4
                                              ? "How many hours of sleep do you\nusually get?"
                                              : pageNumber == 5
                                                  ? "How would you describe your stress\nlevels?"
                                                  : pageNumber == 6
                                                      ? "How often do you consume caffeine\n(tea/coffee/energy drinks)?"
                                                      : pageNumber == 7
                                                          ? "Have you experienced any mental\nhealth concerns?"
                                                          : pageNumber == 8
                                                              ? "What are your hobbies and interests?"
                                                              : "",
                          style: GoogleFonts.lato(color: const Color(0xff484848), fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                      ),
                      // Triangle Arrow (Using Positioned)
                      Positioned(
                        left: -8, // Adjust position
                        top: 10,
                        child: CustomPaint(painter: ChatBubbleTriangle(const Color(0xffEBEFFD))),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: QuestionWidget(
                details: pageNumber == 0
                    ? questionList
                    : pageNumber == 1
                        ? preferences
                        : pageNumber == 2
                            ? preferences1
                            : pageNumber == 3
                                ? preferences1
                                : pageNumber == 4
                                    ? questionList1
                                    : pageNumber == 5
                                        ? questionList2
                                        : pageNumber == 6
                                            ? preferences1
                                            : pageNumber == 7
                                                ? preferences3
                                                : preferences1,
                selected: selectedQuestion,
                pageIndex: selectedIndex,
                state: (value) => setState(() {
                  if (value is int) {
                    selectedIndex = value;
                  } else if (value is String) {
                    selectedQuestion = value;
                  }
                }),
                isUI: pageNumber == 0
                    ? 'list'
                    : pageNumber == 1
                        ? 'checkbox'
                        : pageNumber == 2
                            ? 'radio'
                            : pageNumber == 3
                                ? 'radio'
                                : pageNumber == 4
                                    ? 'list'
                                    : pageNumber == 5
                                        ? 'list'
                                        : pageNumber == 6
                                            ? 'radio'
                                            : pageNumber == 7
                                                ? 'checkbox'
                                                : pageNumber == 8
                                                    ? 'field'
                                                    : '',
              ),
            )
          ],
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            if (pageNumber == 8) {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) => const QuestionComplete()));
            } else {
              setState(() {
                selectedIndex = -1;
                selectedQuestion = "";
                pageNumber += 1;
              });
            }
          },
          child: Container(
            height: 52,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), gradient: const LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
            child: Text(
              "Continue",
              style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final details;
  String selected;
  int pageIndex;
  Function(dynamic) state;
  String isUI;

  QuestionWidget({super.key, required this.details, required this.pageIndex, required this.selected, required this.state, required this.isUI});

  List<String> listValue = [];
  Map<String, bool> otherValue = {};

  @override
  Widget build(BuildContext context) {
    if (details is List<String>) {
      listValue = details;
    } else if (details is Map<String, bool>) {
      otherValue = details;
    }
    return isUI == "list"
        ? ListView.builder(
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () {
                  state.call(listValue[index]);
                },
                child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                        color: selected == listValue[index] ? const Color(0xff3A63ED).withOpacity(0.2) : null,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: selected == listValue[index] ? const Color(0xff3A63ED) : const Color(0xff8B9399))),
                    child: Text(
                      listValue[index],
                      style: GoogleFonts.lato(color: selected == listValue[index] ? const Color(0xff3A63ED).withOpacity(0.9) : Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
                    )),
              );
            },
            itemCount: listValue.length,
          )
        : isUI == "checkbox"
            ? ListView(
                shrinkWrap: true,
                children: otherValue.entries.map((entry) {
                  bool isSelected = entry.value;
                  return GestureDetector(
                    onTap: () {
                      otherValue[entry.key] = !isSelected;
                      state.call("");
                    },
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.only(left: 16),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xff3A63ED).withOpacity(0.2) : null,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: isSelected ? const Color(0xff3A63ED) : Colors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              entry.key,
                              style: GoogleFonts.lato(color: isSelected ? const Color(0xff3A63ED).withOpacity(0.9) : Colors.black, fontWeight: FontWeight.w400),
                            ),
                            CupertinoCheckbox(
                                value: isSelected,
                                onChanged: (bool? value) {
                                  otherValue[entry.key] = value!;
                                  state.call("");
                                },
                                activeColor: const Color(0xff3A63ED)),
                          ],
                        )),
                  );
                }).toList(),
              )
            : isUI == "radio"
                ? ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          pageIndex = index;
                          state.call(index);
                        },
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: pageIndex == index ? const Color(0xff3A63ED).withOpacity(0.2) : null,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: pageIndex == index ? const Color(0xff3A63ED) : Colors.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  listValue[index],
                                  style: GoogleFonts.lato(color: pageIndex == index ? const Color(0xff3A63ED).withOpacity(0.9) : Colors.black, fontWeight: FontWeight.w400),
                                ),
                                Icon(
                                  pageIndex == index ? Icons.radio_button_checked : Icons.radio_button_off,
                                  color: pageIndex == index ? const Color(0xff3A63ED) : Colors.grey,
                                ),
                              ],
                            )),
                      );
                    },
                    itemCount: listValue.length,
                  )
                : isUI == 'field'
                    ? Container(
                        height: 293,
                        margin: const EdgeInsets.only(bottom: 6),
                        padding: const EdgeInsets.only(left: 16),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintStyle: GoogleFonts.lato(color: const Color(0xff8B9399), fontWeight: FontWeight.w400, fontSize: 16),
                              hintText: "Tell us about your favourite things to do!",
                              border: InputBorder.none),
                        ))
                    : Container();
  }
}
