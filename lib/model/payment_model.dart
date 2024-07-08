import 'package:pink_ribbon/data/app_assets.dart';

class PaymentModel {
  String title;
  String image;
  String accountNo;
  String iban;

  PaymentModel(
      {required this.title,
      required this.image,
      required this.accountNo,
      required this.iban});
}

List<PaymentModel> methodItem = [
  PaymentModel(
      title: "Allied Bank Limited ",
      image: AppAssets.kAllied,
      accountNo: '0010049231990017',
      iban: 'PK33ABPA0010049231990017'),
  PaymentModel(
      title: "MCB Bank Limited ",
      image: AppAssets.kMCB,
      accountNo: '04187-1606-1004997',
      iban: 'PK33MUCB04187-1606-1004997'),
  PaymentModel(
      title: "United Bank Limited ",
      image: AppAssets.kUnited,
      accountNo: '0635218678785',
      iban: 'PK092UNIL0635218678785'),
  PaymentModel(
      title: "National Bank of Pakistan ",
      image: AppAssets.kNBP,
      accountNo: '0372004249641774',
      iban: 'PK92NBPA0372004249641774'),
  PaymentModel(
      title: "Faysal Bank Limited ",
      image: AppAssets.kFaysal,
      accountNo: '3192301900223647',
      iban: 'PK42FAYS3192301900223647'),
  PaymentModel(
      title: "Bank of Punjab ",
      image: AppAssets.kBOP,
      accountNo: '6020032729900013',
      iban: 'PK20BPUN6020032729900013'),
  PaymentModel(
      title: "Jazz Cash ",
      image: AppAssets.kJazzcash,
      accountNo: '131230095',
      iban: ''),
  PaymentModel(
      title: "Easy Paisa ",
      image: AppAssets.kEasypaisa,
      accountNo: '0635-218678785',
      iban: ''),
];
