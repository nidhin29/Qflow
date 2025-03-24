import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital/Application/home/home_cubit.dart';
import 'package:hospital/Application/prescription/prescription_cubit.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Presentation/Home/prescripiton.dart';
import 'package:hospital/Presentation/common/snackbar.dart';
import 'package:intl/intl.dart';
import 'package:hospital/constants/const.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeCubit>().getBookings();
      context.read<HomeCubit>().getPrevBookings();
    });
    // PageController to handle swiping
    final PageController pageController = PageController();
    // ValueNotifier to track the current page index
    final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: BlocConsumer<PrescriptionCubit, PrescriptionState>(
        listener: (context, state) {
          state.prescription.fold(
            () {},
            (either) => either.fold(
              (failure) {
                if (!state.isLoading) {
                  if (failure == const MainFailure.serverFailure()) {
                    displaySnackBar(context: context, text: "Server is down");
                  } else if (failure == const MainFailure.clientFailure()) {
                    displaySnackBar(
                        context: context,
                        text: "Something wrong with your network");
                  } else {
                    displaySnackBar(
                        context: context,
                        text: "Something Unexpected Happened");
                  }
                }
              },
              (r) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PrescripitonPage(
                      symptoms: r[0].symptoms!,
                      disease: r[0].diseaseIdentified!,
                      remarks: r[0].remarks!,
                      medicines: r[0].medicines!,
                      consultationDate: r[0].consultationDate!),
                ));
              },
            ),
          );
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 30.w,
                top: 81.h,
                right: 10.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          BlocBuilder<HomeCubit, HomeState>(
                            builder: (context, state) {
                              return state.bookings.fold(
                                () => Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    width: 100.w,
                                    height: 20.h,
                                    color: Colors.white,
                                  ),
                                ),
                                (either) => either.fold(
                                  (failure) => const Text(''),
                                  (r) {
                                    return Text(
                                      r.name!,
                                      style: GoogleFonts.dmSans(
                                        textStyle: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          color: const Color.fromRGBO(
                                            125,
                                            125,
                                            125,
                                            1,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  kheight10,
                  kheight20,
                  Text('My Appointments',
                      style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(125, 125, 125, 1),
                      ))),
                  kheight20,
                  // Sliding Carousel
                  BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {
                      state.bookings.fold(
                        () {},
                        (either) => either.fold(
                          (failure) {
                            if (!state.isLoading) {
                              if (failure ==
                                  const MainFailure.serverFailure()) {
                                displaySnackBar(
                                    context: context, text: "Server is down");
                              } else if (failure ==
                                  const MainFailure.clientFailure()) {
                                displaySnackBar(
                                    context: context,
                                    text: "Something wrong with your network");
                              } else {
                                displaySnackBar(
                                    context: context,
                                    text: "Something Unexpected Happened");
                              }
                            }
                          },
                          (r) {},
                        ),
                      );
                    },
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return state.bookings.fold(
                        () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        (either) => either.fold(
                          (failure) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          (r) => r.bookings == []
                              ? Text('No Appointments')
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: 250.h,
                                      child: PageView.builder(
                                        controller: pageController,
                                        itemCount: r.bookings!.length,
                                        onPageChanged: (index) {
                                          currentPageNotifier.value = index;
                                        },
                                        itemBuilder: (context, index) =>
                                            _buildCard(
                                                r.bookings![index]
                                                    .appointmentDate!,
                                                r.bookings![index].time!,
                                                r.bookings![index].doctor!,
                                                r.bookings![index]
                                                    .opticketNumber!
                                                    .toString(),
                                                r.bookings![index].startedsts!,
                                                r.bookings![index]
                                                        .currentConsultNo ??
                                                    0),
                                      ),
                                    ),
                                    const SizedBox(height: 20),

                                    // Page Indicator using ValueListenableBuilder
                                    Center(
                                      child: ValueListenableBuilder<int>(
                                        valueListenable: currentPageNotifier,
                                        builder: (context, currentPage, _) {
                                          return Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: List.generate(
                                                r.bookings!.length, (index) {
                                              return AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                width: currentPage == index
                                                    ? 30
                                                    : 15,
                                                height: 6,
                                                decoration: BoxDecoration(
                                                  color: currentPage == index
                                                      ? const Color.fromRGBO(
                                                          147, 147, 147, 1)
                                                      // ignore: deprecated_member_use
                                                      : const Color.fromRGBO(
                                                          230, 230, 230, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      );
                    },
                  ),
                  kheight10,
                  Text('Previous Appointments',
                      style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(125, 125, 125, 1),
                      ))),
                  kheight20,
                  BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {
                      state.prevBookings.fold(
                        () {},
                        (either) => either.fold(
                          (failure) {
                            if (!state.isLoading) {
                              if (failure ==
                                  const MainFailure.serverFailure()) {
                                displaySnackBar(
                                    context: context, text: "Server is down");
                              } else if (failure ==
                                  const MainFailure.clientFailure()) {
                                displaySnackBar(
                                    context: context,
                                    text: "Something wrong with your network");
                              } else {
                                displaySnackBar(
                                    context: context,
                                    text: "Something Unexpected Happened");
                              }
                            }
                          },
                          (r) {},
                        ),
                      );
                    },
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return state.prevBookings.fold(
                        () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        (either) => either.fold(
                          (failure) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          (r) => r.bookings!.isEmpty
                              ? Center(
                                  child: Text(
                                    'No Previous Appointments',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              : ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<PrescriptionCubit>(
                                                  context)
                                              .getPrescription(r
                                                  .bookings![index]
                                                  .opticketNumber!);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 20.h),
                                          child: Container(
                                            width: 348.w,
                                            height: 125.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              border: Border.all(
                                                color: const Color.fromRGBO(
                                                    209, 209, 209, 1),
                                              ),
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1),
                                            ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20.w),
                                                  child: const CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        'assets/icon/hospital.jpg'),
                                                    radius: 23,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 25.w,
                                                            vertical: 8.w),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Hospital',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '${DateFormat('d').format(DateTime.now())}${DateTime.now().day == 1 || DateTime.now().day == 21 || DateTime.now().day == 31 ? 'st' : DateTime.now().day == 2 || DateTime.now().day == 22 ? 'nd' : DateTime.now().day == 3 || DateTime.now().day == 23 ? 'rd' : 'th'} ${DateFormat('MMM y').format(DateTime.now())}',
                                                          style: TextStyle(
                                                            fontSize: 13.sp,
                                                            fontFamily:
                                                                'CabinetGrotesk',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        Text(
                                                            r.bookings![index]
                                                                .doctor!,
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    textStyle:
                                                                        TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 13.sp,
                                                              color: const Color
                                                                  .fromRGBO(145,
                                                                  145, 145, 1),
                                                            ))),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  separatorBuilder: (context, index) =>
                                      kheight20,
                                  itemCount: r.bookings!.length),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Card Builder for Carousel
  Widget _buildCard(String date, String time, String doctor, String ticket,
      int status, int currentNo) {
    return Container(
      width: 318.w,
      height: 320.h,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: const Color.fromRGBO(209, 209, 209, 1),
        ),
        color: const Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kheight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [
                          Color.fromRGBO(38, 91, 138, 1),
                          Color.fromRGBO(88, 135, 177, 1),
                          Color.fromRGBO(148, 188, 224, 1),
                          Color.fromRGBO(182, 219, 251, 1),
                          Color.fromRGBO(38, 91, 138, 1),
                        ],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds),
                      child: Text(
                        'Out Patient\nTICKET',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'CabinetGrotesk',
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${DateFormat('d').format(DateTime.parse(date))}${DateTime.parse(date).day == 1 || DateTime.parse(date).day == 21 || DateTime.parse(date).day == 31 ? 'st' : DateTime.parse(date).day == 2 || DateTime.parse(date).day == 22 ? 'nd' : DateTime.parse(date).day == 3 || DateTime.parse(date).day == 23 ? 'rd' : 'th'} ${DateFormat(' MMM').format(DateTime.parse(date))}',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'CabinetGrotesk',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          DateFormat('y').format(DateTime.parse(date)),
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontFamily: 'CabinetGrotesk',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                kheight5,
                Text(
                  doctor,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: 'CabinetGrotesk',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                kheight5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BookTileWidget(
                      heading: 'Estimated Time',
                      content: time,
                    ),
                    kwidth5,
                    kwidth5,
                    kwidth5,
                    kwidth5,
                    kwidth5,
                    kwidth5,
                    kwidth5,
                    kwidth5,
                    BookTileWidget(
                        heading: 'OP Ticket Number', content: ticket),
                    kwidth5,
                    kwidth5,
                  ],
                ),
                kheight5,
                (status != 0)
                    ? Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: BookTileWidget(
                            heading: 'Current No',
                            content: currentNo.toString()),
                      )
                    : SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BookTileWidget extends StatelessWidget {
  final String heading;
  final String content;
  const BookTileWidget({
    super.key,
    required this.heading,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: GoogleFonts.dmSans(
            textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 10.sp,
              color: const Color.fromRGBO(
                191,
                191,
                191,
                1,
              ),
            ),
          ),
        ),
        Text(
          content,
          style: TextStyle(
            fontSize: 20.sp,
            fontFamily: 'CabinetGrotesk',
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
