import 'package:expenze_manager/model/expenzmodel.dart';
import 'package:expenze_manager/model/incomemodel.dart';
import 'package:expenze_manager/util/constants.dart';
import 'package:expenze_manager/widgets/reusableitem.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  // final Function() addnewExpenzes;
  final List<Expenzes>? expenzList;
  final List<Incomes>? incomeList;
  final void Function(Expenzes) deleteExpenz;
  final void Function(Incomes) deleteIncome;
  const TransactionPage({
    super.key,
    required this.expenzList,
    required this.incomeList,
    required this.deleteExpenz,
    required this.deleteIncome,
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
                      widget.expenzList!.isEmpty
                          ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 80),
                            child: Center(
                              
                                child: Text(
                                  "add some expenzes",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: kcDiscription),
                                ),
                              ),
                          )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: widget.expenzList?.length,
                              itemBuilder: (context, index) {
                                //  fetchExpenzes();
                                final Expenzes? expenz =
                                    widget.expenzList?[index];
                                //convet to dismisable
                                return Dismissible(
                                  key: ValueKey(expenz),
                                  direction: DismissDirection.startToEnd,
                                  onDismissed: (direction) {
                                    setState(() {
                                      widget.deleteExpenz(expenz);
                                    });
                                  },
                                  child: ReusableItem(
                                      color: expenzColors[expenz!.catrgory]!,
                                      title: expenz.title,
                                      discription: expenz.discription,
                                      amount: expenz.amount,
                                      time: expenz.date,
                                      image: expenzCategoryImages[
                                          expenz.catrgory]!),
                                );
                              }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
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
                        widget.incomeList!.isEmpty
                          ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 80),
                            child: Center(
                              
                                child: Text(
                                  "add some incomes",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: kcDiscription),
                                ),
                              ),
                          ):
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: widget.incomeList?.length,
                          itemBuilder: (context, index) {
                            //  fetchExpenzes();
                            Incomes incomes = widget.incomeList![index];
                            return Dismissible(
                              key: ValueKey(incomes),
                              direction: DismissDirection.startToEnd,
                              onDismissed: (direction) {
                                widget.deleteIncome(incomes);
                              },
                              background: Container(
                                color: kccardShadow.withOpacity(0.5),
                              ),
                              child: ReusableItem(
                                  color: incomeColors[incomes.catrgory]!,
                                  title: incomes.title,
                                  discription: incomes.discription,
                                  amount: incomes.amount,
                                  time: incomes.date,
                                  image:
                                      incomeCategoryImages[incomes.catrgory]!),
                            );
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
