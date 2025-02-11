import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicalProfile extends StatefulWidget {
  const MedicalProfile({super.key});

  @override
  State<MedicalProfile> createState() => _MedicalProfileState();
}

class _MedicalProfileState extends State<MedicalProfile> {
  String? selectedVaccine; // Stores the selected vaccine option
  bool hadSurgery = false; // Tracks whether the user had surgery
  bool hadHospitalVisit = false; // Tracks whether the user had a hospital visit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medical Profile", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Navigate back when pressed
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Different sections of the medical profile
              buildQuestion("Do you have any current health conditions?", "Tell us about your current health"),
              buildQuestion("Have you had any surgeries or operations?", "Please provide details",
                  isRadio: true,
                  value: hadSurgery,
                  onChanged: (val) => setState(() => hadSurgery = val)),
              buildQuestion("Do you have any allergies?", "Tell us about your allergies"),
              buildQuestion("Are you currently taking any medications?", "Tell us about your medicines"),
              buildDropdownQuestion("Which vaccines have you received?", ["Flu", "Covid-19","Tetanus", "Hepatitis","Measles","Other"],
                  selectedVaccine, (val) => setState(() => selectedVaccine = val)),
              buildQuestion("Have you had any recent hospital visits?", "Please provide details",
                  isRadio: true,
                  value: hadHospitalVisit,
                  onChanged: (val) => setState(() => hadHospitalVisit = val)),
              buildQuestion("What is your blood pressure?", ""),
              buildQuestion("What is your blood sugar level?", ""),
              SizedBox(height: 20),
              Container(
                height: 50,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text("Clear", style: TextStyle(color: Color(0xff3A63ED), fontSize: 16)),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xff3A63ED)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff11842E)),
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: Text('Save',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Function to build a question field with optional radio buttons
  Widget buildQuestion(String question, String hint, {bool isRadio = false, bool? value, Function(bool)? onChanged}) {
    TextEditingController _controller = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        if (isRadio && value != null && onChanged != null)
          Row(
            children: [
              Radio(value: true, groupValue: value, activeColor:Color(0xff3A63ED), onChanged: (val) => onChanged(true)),
              Text("Yes"),
              SizedBox(width: 10),
              Radio(value: false, groupValue: value,activeColor:Color(0xff3A63ED), onChanged: (val) => onChanged(false)),
              Text("No"),
            ],
          ),
        if (!isRadio)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _controller,
                maxLength: 500, // Character limit
                decoration: InputDecoration(
                  hintText: hint,
                  border: UnderlineInputBorder(),
                  counterText: "", // Hide default counter
                ),
                onChanged: (text) {
                  setState(() {});
                },
              ),
              Text("${_controller.text.length}/500", style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        SizedBox(height: 15),
      ],
    );
  }

  // Function to build a dropdown that opens a bottom sheet
  Widget buildDropdownQuestion(String question, List<String> options, String? selectedValue, Function(String) onSelect) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 5),
        GestureDetector(
          onTap: () => _showBottomSheet(options, onSelect),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
           /* decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),*/

            child: TextField(enabled: false,
              decoration: InputDecoration(
                hintText: "Select an option",
                border: UnderlineInputBorder(),
                suffixIcon:  Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }


  Map<String, bool> selectedOptions = {};

  // Function to display a bottom sheet for selecting options
  void _showBottomSheet(List<String> options, Function(String) onSelect) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
      return StatefulBuilder(
        builder: (context, setModalState) {
          return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff11842E)),
                  width: 50,
                  height: 8,
                  alignment: Alignment.center,

                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0,top: 10),
                child: Text("Select Vaccines",style: TextStyle(color:Color(0xff3A63ED),fontSize: 16,fontWeight: FontWeight.bold ),),
              ),
              Container(
                height: 320,
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: options.map((option) => Container(
                      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5,),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: selectedOptions[option] == true ? Color(0x1a4a73ff) : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey, // Change color based on selection
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(option,style: TextStyle(color:selectedOptions[option] == true ?Color(0xff3A63ED) : Colors.black,fontSize: 14),),
                          Checkbox(value:selectedOptions[option]?? false, onChanged: (bool? value) {
                            setModalState(() {
                              selectedOptions[option] = value ?? false;
                            });

                          } ,checkColor: Colors.white,activeColor:Color(0xff3A63ED) ,)
                        ],
                      ),
                    )).toList(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff11842E)),
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: Text('Continue',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                    )),
              )
            ],
          ),
        );
      },);
      }
    );
  }
}

