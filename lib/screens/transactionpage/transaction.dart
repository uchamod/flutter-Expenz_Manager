import 'package:expenze_manager/model/expenzmodel.dart';
import 'package:expenze_manager/model/incomemodel.dart';
import 'package:expenze_manager/util/constants.dart';
import 'package:expenze_manager/widgets/reusableitem.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  // final Function() addnewExpenzes;
  final List<Expenzes>? expenzList;
  final List<Incomes>? IncomeList;

  const TransactionPage({
    super.key,
    required this.expenzList,
    required this.IncomeList,
  });

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "See your financial report",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kcButtonBlue),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Expenzes",
                style: TextStyle(
                    color: kcHedingBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: widget.expenzList?.length,
                          itemBuilder: (context, index) {
                            //  fetchExpenzes();
                            final Expenzes? expenz =
                                widget.expenzList?[index];
          
                            return ReusableItem(
                                color: expenzColors[expenz!.catrgory]!,
                                title: expenz.title,
                                discription: expenz.discription,
                                amount: expenz.amount,
                                time: expenz.time,
                                image:
                                    "imageassets/anya-taylor-joy-najlepsze-filmy-i-seriale-z-gwiazda.jpeg");
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Incomes",
                style: TextStyle(
                    color: kcHedingBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: widget.IncomeList?.length,
                          itemBuilder: (context, index) {
                            //  fetchExpenzes();
                            Incomes incomes = widget.IncomeList![index];
                            return ReusableItem(
                                color: incomeColors[incomes.catrgory]!,
                                title: incomes.title,
                                discription:  incomes.discription,
                                amount:  incomes.amount,
                                time: incomes.time,
                                image:
                                    "imageassets/anya-taylor-joy-najlepsze-filmy-i-seriale-z-gwiazda.jpeg");
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
