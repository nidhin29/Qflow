import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital/Application/doctor/doctor_cubit.dart';
import 'package:hospital/Domain/doctor/doctor_model.dart';
import 'package:hospital/Domain/doctor/doctor_service.dart';
import 'package:hospital/Presentation/Member/payment.dart';
import 'package:hospital/Presentation/common/book_widget.dart';
import 'package:hospital/constants/const.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DoctorCubit>(context).getDoctor();
    });
    ValueNotifier<String?> selectedDepartment = ValueNotifier<String?>(null);
    TextEditingController symptomsController = TextEditingController();
    TextEditingController additionalDetailsController = TextEditingController();
    DoctorModel? selectedDoctor;
    ValueNotifier<DateTime> selectedDate =
        ValueNotifier<DateTime>(DateTime.now());

    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color.fromRGBO(66, 132, 156, 1),
                onPrimary: Colors.white,
                onSurface: Color.fromRGBO(66, 132, 156, 1),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromRGBO(66, 132, 156, 1),
                ),
              ),
            ),
            child: child!,
          );
        },
      );
      if (picked != null && picked != selectedDate.value) {
        selectedDate.value = picked;
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 25.h, right: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight20,
              kheight10,
              kheight20,
              kheight20,
              kheight20,
              kheight10,
              Container(
                width: 350.w,
                height: 339.h,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/icon/hospital.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(21.r),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 7,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ]),
              ),
              kheight20,
              kheight15,
              kheight20,
              BlocConsumer<DoctorCubit, DoctorState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    width: 350.w,
                    height: 510.w,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(28.r),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 7,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.h, right: 20.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              kheight20,
                              kheight5,
                              kheight10,
                              Text(
                                'Book your Slot',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'TestSohne',
                                  fontSize: 19.sp,
                                  color: const Color.fromRGBO(39, 39, 39, 1),
                                ),
                              ),
                              kheight20,
                              state.doctors.fold(
                                () => const SizedBox(),
                                (a) => a.fold(
                                  (l) => const SizedBox(),
                                  (r) => BookFieldWidget(
                                    selectedDepartment: selectedDepartment,
                                    onChanged: (selectedName) {
                                      selectedDoctor = r.firstWhere(
                                          (doctor) =>
                                              doctor.name == selectedName);
                                    },
                                    title: 'Doctors',
                                    list: r.map((e) => e.name!).toList(),
                                  ),
                                ),
                              ),
                              kheight10,
                              kheight10,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Date',
                                      style: GoogleFonts.dmSans(
                                          textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp,
                                        color: const Color.fromRGBO(
                                            39, 39, 39, 1),
                                      ))),
                                  InkWell(
                                    onTap: () => selectDate(context),
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromRGBO(
                                                    210, 210, 210, 1)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.77.r)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromRGBO(
                                                    210, 210, 210, 1)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.77.r)),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromRGBO(
                                                    210, 210, 210, 1)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.77.r)),
                                          ),
                                          fillColor: const Color.fromRGBO(
                                              246, 246, 246, 1),
                                          filled: true),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: ValueListenableBuilder(
                                          valueListenable: selectedDate,
                                          builder: (context, value, child) {
                                            return Text(
                                              "${value.day}/${value.month}/${value.year}",
                                              style: GoogleFonts.dmSans(
                                                  textStyle: TextStyle(
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              kheight20,
                              TextFormField(
                                style: GoogleFonts.dmSans(
                                    textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                )),
                                controller: symptomsController,
                                decoration: InputDecoration(
                                  labelText: 'Symptoms',
                                  labelStyle: GoogleFonts.dmSans(
                                      textStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(39, 39, 39, 1),
                                  )),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(210, 210, 210, 1)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.77.r)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(210, 210, 210, 1)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.77.r)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(210, 210, 210, 1)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.77.r)),
                                  ),
                                  fillColor:
                                      const Color.fromRGBO(246, 246, 246, 1),
                                  filled: true,
                                ),
                              ),
                              kheight20,
                              TextFormField(
                                style: GoogleFonts.dmSans(
                                    textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                )),
                                controller: additionalDetailsController,
                                decoration: InputDecoration(
                                  labelText: 'Additional Details',
                                  labelStyle: GoogleFonts.dmSans(
                                      textStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(39, 39, 39, 1),
                                  )),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(210, 210, 210, 1)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.77.r)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(210, 210, 210, 1)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.77.r)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(210, 210, 210, 1)),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.77.r)),
                                  ),
                                  fillColor:
                                      const Color.fromRGBO(246, 246, 246, 1),
                                  filled: true,
                                ),
                              ),
                              kheight20,
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final formattedDate =
                                "${selectedDate.value.year}-${selectedDate.value.month.toString().padLeft(2, '0')}-${selectedDate.value.day.toString().padLeft(2, '0')}";
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PaymentScreen(
                                      doctor: Doctor(
                                          doctor: selectedDoctor!.email!,
                                          symptoms: symptomsController.text,
                                          details: additionalDetailsController
                                              .text,
                                          date: formattedDate),
                                    )));
              
                            // BlocProvider.of<BookingCubit>(context)
                            //     .bookAppointment(Doctor(
                            //         doctor: selectedDoctor!.email!,
                            //         symptoms: symptomsController.text,
                            //         details: additionalDetailsController.text,
                            //         date: formattedDate));
                          },
                          style: ButtonStyle(
                            minimumSize:
                                WidgetStateProperty.all(Size(330.w, 52.h)),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.black),
                            overlayColor:
                                WidgetStateProperty.all(Colors.transparent),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.2.r),
                              ),
                            ),
                          ),
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.ptSans(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.sp,
                                    color: Colors.white)),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              kheight20,
              kheight20,
              kheight20
            ],
          ),
        ),
      ),
    );
  }
}
