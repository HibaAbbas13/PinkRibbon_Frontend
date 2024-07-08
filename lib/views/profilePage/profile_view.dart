import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pink_ribbon/data/App_colors.dart';
import 'package:pink_ribbon/data/Typography.dart';
import 'package:pink_ribbon/providers/User_providers.dart';
import 'package:pink_ribbon/views/profilePage/components/custom_text_field.dart';
import 'package:pink_ribbon/views/profilePage/components/custom_text_form_field.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _storage = FlutterSecureStorage();
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _bloodgroupController = TextEditingController();
  final _genderController = TextEditingController();
  final _mobileController = TextEditingController();
  final _surnameController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _imageFile;
  double? _bmi;
  String? _uploadedImageUrl;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUserProfileFromProvider();
    });
  }

  void _loadUserProfileFromProvider() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    _setControllers(authProvider.userProfile);
  }

  Future<void> _fetchUserProfile() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      await authProvider.fetchUserProfile(authProvider.userId ?? '');
      _setControllers(authProvider.userProfile);
    } catch (error) {
      print('Error fetching user profile: $error');
    }
  }

  void _setControllers(Map<String, dynamic>? userProfile) {
    if (userProfile != null) {
      setState(() {
        _nameController.text = userProfile['name'] ?? '';
        _surnameController.text = userProfile['surname'] ?? '';
        _mobileController.text = userProfile['mobileNumber'] ?? '';
        _genderController.text = userProfile['gender'] ?? '';
        _bloodgroupController.text = userProfile['bloodGroup'] ?? '';
        _dobController.text = userProfile['dob'] ?? '';
        _bmi = userProfile['bmi'] as double?;
        if (userProfile['profileImage'] != null) {
          _imageFile = File(userProfile['profileImage']);
        }
      });
    }
  }

  Future<void> _getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path); // Convert XFile to File
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: CircleAvatar(
              radius: 50, // adjust the size as needed
              backgroundImage: FileImage(_imageFile!),
            ),
          );
        },
      );
    } else {
      // User canceled the picker
      print('No image selected.');
    }
  }

  void _calculateBMI() {
    double? heightFeet = double.tryParse(_heightController.text);
    double? weight = double.tryParse(_weightController.text);

    if (heightFeet != null && weight != null && heightFeet > 0 && weight > 0) {
      double heightMeters = heightFeet * 0.3048;

      double bmi = weight / (heightMeters * heightMeters);

      setState(() {
        _bmi = bmi;
      });
    }
  }

  Future<void> _updateUserProfile() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final userId = authProvider.userId;
    if (userId != null) {
      final userProfileData = {
        'userId': userId,
        'name': _nameController.text,
        'surname': _surnameController.text,
        'mobileNumber': _mobileController.text,
        'gender': _genderController.text,
        'bloodGroup': _bloodgroupController.text,
        'dob': _dobController.text,
        'bmi': _bmi,
        'profileImage': _imageFile != null ? _imageFile!.path : null,
      };

      try {
        await authProvider.updateUserProfile(userId, userProfileData);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully')),
        );
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile: $error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kBackgroundPink2,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 28,
            color: AppColors.kBlack,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Profile",
          style: AppTypography.kSemiBold18.copyWith(color: AppColors.kPrimary),
        ),
      ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(24.h),
        child: Container(
          padding: EdgeInsets.all(24.h),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.kBackgroundPink1.withOpacity(0.4),
                AppColors.kBackgroundPink2.withOpacity(0.5),
                AppColors.kWhite,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _getImageFromGallery(context);
                      },
                      child: Container(
                        width: 96.w,
                        height: 96.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.kPrimary,
                          border:
                              Border.all(color: AppColors.kWhite, width: 3.w),
                        ),
                        child: _imageFile != null
                            ? CircleAvatar(
                                radius: 50, // adjust the size as needed
                                backgroundImage: FileImage(_imageFile!),
                              )
                            : Icon(
                                Icons.add_photo_alternate,
                                size: 48,
                                color: AppColors.kWhite,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.kPrimary,
                          border:
                              Border.all(color: AppColors.kWhite, width: 3.w),
                        ),
                        child: Icon(
                          Icons.edit_outlined,
                          color: AppColors.kWhite,
                          size: 14.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Personal Details',
                  style: AppTypography.kSemiBold18
                      .copyWith(color: AppColors.kBlack),
                ),
              ),
              SizedBox(height: 20.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    ProfileTextFormField(
                      controller: _nameController,
                      label: 'name',
                    ),
                    SizedBox(height: 28.h),
                    ProfileTextFormField(
                      label: 'surname',
                      controller: _surnameController,
                    ),
                    SizedBox(height: 28.h),
                    ProfileTextFormField(
                      controller: _mobileController,
                      label: 'Mobile',
                    ),
                    SizedBox(height: 28.h),

                    ProfileTextFormField(
                        label: 'Gender', controller: _genderController),
                    SizedBox(height: 24.h),

                    ProfileTextFormField(
                      controller: _bloodgroupController,
                      label: 'Blood Group',
                    ),
                    SizedBox(height: 28.h),
                    ProfileTextFormField(
                      label: 'Date of Birth',
                      controller: _dobController,
                    ),

                    SizedBox(height: 24.h),
                    Divider(
                      thickness: 1,
                      color: AppColors.kAppBarGrey,
                    ),
                    SizedBox(height: 24.h),
                    ProfileTextFormField(
                      controller: _heightController,
                      label: 'Height (ft)',
                    ),
                    SizedBox(height: 24.h),

                    // Text field for weight
                    ProfileTextFormField(
                      controller: _weightController,
                      label: 'Weight (kg)',
                    ),
                    SizedBox(height: 28.h),

                    // Button to calculate BMI
                    InkWell(
                      onTap:
                          // Call function to calculate BMI
                          _calculateBMI,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.kPrimary,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          "Calculate BMI",
                          style: AppTypography.kBold18.copyWith(
                            color: AppColors.kWhite,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 34.h),
                    // Display calculated BMI
                    if (_bmi != null)
                      Text(
                        'BMI: ${_bmi?.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18),
                      ),

                    SizedBox(height: 34.h),
                    InkWell(
                      onTap: _updateUserProfile,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.kPrimary,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          "Save",
                          style: AppTypography.kBold18.copyWith(
                            color: AppColors.kWhite,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 57.h),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
