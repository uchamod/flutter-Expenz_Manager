import 'package:expenze_manager/model/onboardsreen_model.dart';

//onboarddata according to the model
class OnBoardScreenData {
  List<OnboardScreenmodel> onboardData = [
    OnboardScreenmodel(
      imagePath: "imageassets/money_432086.png",
      title: "Gain total control of your money",
      diacription: "Become your own money manager and make every cent count",
    ),
    OnboardScreenmodel(
      imagePath: "imageassets/money-bag_5545053.png",
      title: "Know where your money goes",
      diacription:
          "Track your transaction easily with categories and financial report ",
    ),
    OnboardScreenmodel(
      imagePath: "imageassets/task_2098276.png",
      title: "Planning ahead",
      diacription: "Setup your budget for each category so you in control",
    ),
  ];
}
