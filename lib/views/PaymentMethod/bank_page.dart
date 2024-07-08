import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pink_ribbon/data/app_colors.dart';
import 'package:pink_ribbon/data/typography.dart';
import 'package:pink_ribbon/providers/Transaction_provider.dart';
import 'package:pink_ribbon/providers/User_providers.dart';
import 'package:pink_ribbon/views/Components/Customappbar.dart';
import 'package:pink_ribbon/views/PaymentMethod/components/account_details.dart';

import 'package:pink_ribbon/views/landingpage/landing_page.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class BankPage extends StatefulWidget {
  final String username;
  final String useraccount;
  final String amount;

  const BankPage({
    Key? key,
    required this.username,
    required this.useraccount,
    required this.amount,
  }) : super(key: key);

  @override
  State<BankPage> createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _uploadTransaction() async {
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final transactionProvider =
          Provider.of<TransactionProvider>(context, listen: false);
      final userId = authProvider.userId;
      if (userId != null && _imageFile != null) {
        await transactionProvider.uploadTransaction(
          userId: userId,
          amount: int.parse(_donationAmountController.text),
          username: _nameController.text,
          useraccount: _accountController.text,
          imagePath: _imageFile!.path,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Transaction uploaded successfully')),
        );
      }
    } catch (error) {
      _showErrorDialog(error.toString());
    }
  }

  final TextEditingController _donationAmountController =
      TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  String? _enteredAmount;
  XFile? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imageFile = pickedFile;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Image picked successfully!'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No image selected.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to pick image.'),
        ),
      );
    }
  }

  void _submit() {
    if (_donationAmountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter donation amount before submitting.'),
        ),
      );
    }
    if (_accountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter account number before submitting.'),
        ),
      );
    }
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter name before submitting.'),
        ),
      );
    }
    if (_imageFile == null ||
        _donationAmountController.text.isEmpty ||
        _accountController.text.isEmpty ||
        _nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please upload an image before submitting.'),
        ),
      );
    } else {
      _uploadTransaction();
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0.h, horizontal: 60.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.kPrimary),
                  child: Icon(
                    Icons.done,
                    color: AppColors.kWhite,
                    size: 40,
                  ),
                ),
                SizedBox(height: 30.h),
                Text("Donation done successfully.",
                    style: AppTypography.kSemiBold14
                        .copyWith(color: AppColors.kBlack)),
                SizedBox(height: 20.h),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LandingPage(),
                        ));
                  },
                  child: Text("Back to Home",
                      style: AppTypography.kLight12
                          .copyWith(color: AppColors.kGrey)),
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Donation",
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 50.h),
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
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  widget.username,
                  style: AppTypography.kSemiBold16
                      .copyWith(color: AppColors.kAppBarPink),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              accountDetails(widget.useraccount, 'Account No.', context),
              SizedBox(
                height: 20.h,
              ),
              Container(
                child: widget.amount.isNotEmpty
                    ? accountDetails(widget.amount, 'IBAN', context)
                    : null,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Copy the account/IBAN number, open your banking app, paste the number into the donation field, and complete the transaction. Take a screenshot of the receipt and upload it here. For verification, please enter the donation amount, your account number, and your name (as shown in the banking app).",
                style: AppTypography.kLight10
                    .copyWith(color: AppColors.kBackgroundPink1),
              ),
              SizedBox(
                height: 16.h,
              ),
              DonationTextField(
                  'Enter donation amount (Rs.)', _donationAmountController),
              SizedBox(
                height: 16.h,
              ),
              DonationTextField('Enter your Account No.', _accountController),
              SizedBox(
                height: 16.h,
              ),
              DonationTextField(
                  "Enter your name as per banking app", _nameController),
              SizedBox(height: 16.h),
              InkWell(
                onTap: _pickImage,
                child: Container(
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                    color: AppColors.kWhite,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.upload,
                        color: AppColors.kAppBarPink,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Upload screenshot of transaction',
                        style: AppTypography.kLight12
                            .copyWith(color: AppColors.kAppBarPink),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
              InkWell(
                onTap: _submit,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.kPrimary,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Text("Submit",
                      style: AppTypography.kSemiBold14.copyWith(
                        color: AppColors.kWhite,
                        fontSize: 22,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextField DonationTextField(
      String HintText, TextEditingController controller) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        setState(() {
          _enteredAmount = value;
        });
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 25.w),
        filled: true,
        fillColor: AppColors.kWhite,
        hintText: HintText,
        hintStyle: AppTypography.kLight12
            .copyWith(color: AppColors.kBlack.withOpacity(0.4)),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none),
        disabledBorder: const OutlineInputBorder(),
      ),
    );
  }
}
