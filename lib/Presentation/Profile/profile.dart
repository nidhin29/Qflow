import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital/Application/edit_profile/editprofile_cubit.dart';
import 'package:hospital/Application/profile/profile_cubit.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Domain/Profile/profile_service.dart';
import 'package:hospital/Domain/TokenManager/token_manager.dart';
import 'package:hospital/Presentation/Auth/sign_in.dart';
import 'package:hospital/Presentation/Profile/feedback.dart';
import 'package:hospital/Presentation/Profile/health.dart';
import 'package:hospital/Presentation/common/snackbar.dart';
import 'package:hospital/constants/const.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late PageController _pageController;
  bool _isEditMode = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).getProfile();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.31,
    );
  }

  void _toggleEditMode() {
    setState(() {
      _isEditMode = !_isEditMode;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Stack(
            children: [
              // Background Gradient
              Container(
                height: 337.h,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Color(0xFFCEDFEF),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              // Foreground Gradient and Text
              Container(
                height: 350.h,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF81BDFC),
                      Colors.white,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.h),
                  child: Center(
                    child: Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 32.17.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Bottom Content with Avatar
          Container(
            margin: EdgeInsets.only(top: 290.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(47.r),
                topRight: Radius.circular(47.r),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Flexible(
                  child: _isEditMode
                      ? _buildEditUI(_toggleEditMode, _isEditMode)
                      : _buildAvatarTab(_toggleEditMode),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildAvatarTab(Function() onTap) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 31.w),
    child: BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        state.isFailureOrSuccessForDelete.fold(
          () {},
          (either) => either.fold(
            (failure) {},
            (r) {},
          ),
        );
        state.isFailureOrSuccessForGet.fold(
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
                      context: context, text: "Something Unexpected Happened");
                }
              }
            },
            (r) {
              TokenManager.instance.setModel(ProfileModel(
                  username: r.username!,
                  email: r.email!,
                  phoneNumber: r.phoneNumber!,
                  address: r.address!,
                  password: r.password!,
                  firstName: r.firstName!,
                  lastName: r.lastName!,
                  dateOfBirth: r.dateOfBirth!));
            },
          ),
        );

        state.isFailureOrSuccessForDelete.fold(
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
                      context: context, text: "Something Unexpected Happened");
                }
              }
            },
            (r) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => SignInScreen(),
              ));
            },
          ),
        );
      },
      builder: (context, state) {
        if (state.isLoading) {
          Center(
            child: CircularProgressIndicator(),
          );
        }
        return state.isFailureOrSuccessForGet.fold(
            () => Center(
                  child: CircularProgressIndicator(),
                ), (either) {
          if (either.isLeft()) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 45.r,
                        backgroundColor:
                            const Color.fromARGB(255, 104, 162, 191),
                        child: Text(
                          state.profileModel!.username![0].toUpperCase(),
                          style: TextStyle(
                            fontSize: 40.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        state.profileModel!.username ?? '',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        state.profileModel!.email ?? '',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        state.profileModel!.phoneNumber ?? '',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        state.profileModel!.address ?? '',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(165.w, 21.h),
                          backgroundColor:
                              const Color.fromRGBO(225, 225, 225, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ProfileCubit>(context).deleteEmail();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(325.w, 41.h),
                  backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Log Out",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14.sp,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              kheight5,
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FeedbackPage()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(325.w, 41.h),
                  backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Feedback",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14.sp,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              kheight5,
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HealthPage(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(325.w, 41.h),
                  backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Health Data",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14.sp,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          );
        });
      },
    ),
  );
}

Widget _buildEditUI(Function() onTap, bool iseditMode) {
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstController = TextEditingController();
  final TextEditingController lastController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  return BlocConsumer<EditprofileCubit, EditprofileState>(
    listener: (context, state) {
      state.isFailureOrSuccessForUpdate.fold(
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
                    context: context, text: "Something Unexpected Happened");
              }
            }
          },
          (r) {
            BlocProvider.of<ProfileCubit>(context).getProfile();
            onTap();
          },
        ),
      );
    },
    builder: (context, state) {
      if (state.isLoading) {
        return Center(child: const CircularProgressIndicator());
      }
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 29.w, right: 29.w, top: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(165.w, 25.h),
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<EditprofileCubit>(context)
                              .updateProfile(
                                  profileModel: ProfileModel(
                                      username: userController.text,
                                      email: emailController.text,
                                      phoneNumber: phoneController.text,
                                      address: addressController.text,
                                      password: '',
                                      firstName: firstController.text,
                                      lastName: lastController.text,
                                      dateOfBirth: dateController.text));
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(165.w, 25.h),
                          backgroundColor: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                      child: _buildEditableField(
                          "First Name",
                          TokenManager.instance.model!.firstName,
                          firstController)),
                  SizedBox(width: 10.w),
                  Expanded(
                      child: _buildEditableField(
                          "Last Name",
                          TokenManager.instance.model!.lastName,
                          lastController)),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                      child: _buildEditableField(
                          "Phone Number",
                          TokenManager.instance.model!.phoneNumber,
                          phoneController)),
                  SizedBox(width: 10.w),
                  Expanded(
                      child: _buildEditableField(
                          "Date of Birth",
                          TokenManager.instance.model!.dateOfBirth,
                          dateController)),
                ],
              ),
              SizedBox(height: 20.h),
              _buildEditableField("Address",
                  TokenManager.instance.model!.address, addressController),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildEditableField(
    String label, String value, TextEditingController controller) {
  controller.text = value;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 0.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 1.h),
        SizedBox(
          height: 35.h,
          child: TextFormField(
            controller: controller,
            onChanged: (value) {
              controller.text = value;
            },
            style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(116, 116, 116, 1)),
            decoration: InputDecoration(
              fillColor: const Color.fromRGBO(248, 248, 248, 1),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            ),
          ),
        ),
      ],
    ),
  );
}
