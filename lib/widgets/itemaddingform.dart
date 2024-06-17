import 'package:expenze_manager/model/expenzmodel.dart';
import 'package:expenze_manager/model/incomemodel.dart';
import 'package:expenze_manager/service/expenz_service.dart';
import 'package:expenze_manager/service/income_service.dart';
import 'package:expenze_manager/util/constants.dart';
import 'package:expenze_manager/widgets/form_textfiled.dart';
import 'package:expenze_manager/widgets/shared_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemAddingForm extends StatefulWidget {
  final int checker;

  const ItemAddingForm({super.key, required this.checker});

  @override
  State<ItemAddingForm> createState() => _ItemAddingFormState();
}

class _ItemAddingFormState extends State<ItemAddingForm> {
  //variables
  //key for the form
  final _validationKey = GlobalKey<FormState>();
  //border radious
  final double borderRadius = 30;
  //text feild controllers
  final TextEditingController _titleController = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController _DiscriptionController = TextEditingController();
  final TextEditingController _amountCotroller = TextEditingController();

  //initial date
  //final DateTime _currentDate = DateTime.now();
  final DateTime _firstDate = DateTime(
      DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);
  final DateTime _lastDate = DateTime(
      DateTime.now().year + 1, DateTime.now().month, DateTime.now().day);

  //set the dateformat
  final DateFormat dateFomatter = DateFormat("y,MMMM dd");
  //get enums
  ExpenzCategory exCategory = ExpenzCategory.food;
  incomeCategory inCategory = incomeCategory.freelance;
  //get current time

  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _selecteDate = DateTime.now();
 
  //dispose
  @override
  void dispose() {
    _titleController.dispose();
    _DiscriptionController.dispose();
    _amountCotroller.dispose();
    super.dispose();
  }

  //classes

  int initialId = 0;
  @override
  Widget build(BuildContext context) {
    String _selectedFormateDate = dateFomatter.format(_selecteDate);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: SingleChildScrollView(
        child: Form(
          key: _validationKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //dropdown list
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: kcButtonText,
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(width: 2, color: kcDiscription),
                ),
                child: Expanded(
                  //incomeList
                  child: widget.checker == 0
                      ? DropdownButton<incomeCategory>(
                          value: inCategory,
                          dropdownColor: kcButtonText,
                          borderRadius: BorderRadius.circular(borderRadius),
                          menuMaxHeight: double.infinity,
                          // elevation: 20,
                          isExpanded: true,
                          // menuMaxHeight: 200,
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          iconSize: 28,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: kcHedingBlack),
                          //set the item list
                          items: incomeCategory.values
                              .map(
                                (incomeCategory newCategory) =>
                                    DropdownMenuItem(
                                  value: newCategory,
                                  child: Text(newCategory.name),
                                ),
                              )
                              .toList(),
                          //when select the item
                          onChanged: (value) {
                            setState(() {
                              inCategory = value!;
                            });
                          },
                          //expenz list
                        )
                      : DropdownButton<ExpenzCategory>(
                          value: exCategory,
                          dropdownColor: kcButtonText,

                          borderRadius: BorderRadius.circular(borderRadius),
                          isExpanded: true,
                          menuMaxHeight: double.infinity,
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          iconSize: 28,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: kcHedingBlack),
                          //set the expenz list
                          items: ExpenzCategory.values
                              .map(
                                (ExpenzCategory newCategory) =>
                                    DropdownMenuItem(
                                  value: newCategory,
                                  child: Text(newCategory.name),
                                ),
                              )
                              .toList(),
                          //when select the item
                          onChanged: (value) {
                            setState(() {
                              exCategory = value!;
                            });
                          },
                        ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              UserDetailFormFiled(
                inputType: TextInputType.text,
                borderRad: borderRadius,
                hintText: "Title",
                errorMassage: "pleas fill the record",
                textController: _titleController,
                showText: false,
                isvaild: (value) {
                  if (value!.isEmpty) {
                    return "pleas fill the record";
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              UserDetailFormFiled(
                inputType: TextInputType.text,
                borderRad: borderRadius,
                hintText: "discription",
                errorMassage: "pleas fill the record",
                textController: _DiscriptionController,
                showText: false,
                isvaild: (value) {
                  if (value!.isEmpty) {
                    return "pleas fill the record";
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              UserDetailFormFiled(
                inputType: TextInputType.number,
                borderRad: borderRadius,
                hintText: "amount",
                errorMassage: "pleas fill the record",
                textController: _amountCotroller,
                showText: false,
                isvaild: (value) {
                  if (value!.isEmpty) {
                    return "pleas fill the record";
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              //date picking row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    //show calender
                    onTap: () {
                      _showdatePicker();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kcCardlightblue),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            size: 24,
                            color: kcButtonText,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Pick the Date",
                            style: TextStyle(
                                color: kcButtonText,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //show date
                  Text(
                   _selectedFormateDate,
                    style: TextStyle(
                        color: kcHedingBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              //time picking row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    //show calender
                    onTap: () {
                      _showtimePicker();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kcCardyellow),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            size: 24,
                            color: kcButtonText,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Pick the Time",
                            style: TextStyle(
                                color: kcButtonText,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //show time
                  Text(
                   "${ _selectedTime.hour} : ${_selectedTime.minute}"
                    ,
                    style: TextStyle(
                        color: kcHedingBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              Divider(
                color: kcDiscription,
                height: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   if (widget.checker == 0) {
                  //     wrapper.incomeList.add(Incomes(
                  //         id: initialId,
                  //         catrgory: inCategory,
                  //         title: _titleController.text,
                  //         discription: _DiscriptionController.text,
                  //         amount: _amountCotroller.text,
                  //         date: _selectedFormateDate,
                  //         time:
                  //             "${_selectedTime.hour} : ${_selectedTime.minute}"));
                  //     const HomePage();
                  //   } else {
                  //     wrapper.expenzList.add(
                  //       Expenzes(
                  //           id: initialId,
                  //           catrgory: exCategory,
                  //           title: _titleController.text,
                  //           discription: _DiscriptionController.text,
                  //           amount: _amountCotroller.text,
                  //           date: _selectedFormateDate,
                  //           time:
                  //               "${_selectedTime.hour} : ${_selectedTime.minute}"),
                  //     );
                  //     const HomePage();
                  //   }
                  // });
                },
                //add new item button
                child: GestureDetector(
                  onTap: () async {
                    //save user expenz or income in shared preferrences
                    if (widget.checker == 0) {
                      //add new income
                      List<Incomes>? existingtIncomeList =
                          await IncomeService().loadIncome();

                      //create a expenze to store
                      Incomes income = Incomes(
                          id: existingtIncomeList!.length + 1,
                          catrgory: inCategory,
                          title: _titleController.text,
                          discription: _DiscriptionController.text,
                          amount: _amountCotroller.text,
                          date: _selectedFormateDate,
                          time:  "${ _selectedTime.hour} : ${_selectedTime.minute}");
                      if (context.mounted) {
                        setState(() {
                          IncomeService().saveIncome(income, context);
                        });
                      }
                      //clear the data
                      _DiscriptionController.clear();
                      _amountCotroller.clear();
                      _titleController.clear();
                    } else {
                      //add new expenz
                      List<Expenzes>? existingtExpenzList =
                          await ExpenzeService().loadExpenzes();

                      //create a expenze to store
                      Expenzes expenz = Expenzes(
                          id: existingtExpenzList!.length + 1,
                          catrgory: exCategory,
                          title: _titleController.text,
                          discription: _DiscriptionController.text,
                          amount: _amountCotroller.text,
                          date: _selectedFormateDate,
                          time: "${ _selectedTime.hour} : ${_selectedTime.minute}" );
                      if (context.mounted) {
                        setState(() {
                          ExpenzeService().saveExpenz(expenz, context);
                        });
                      }
                      //clear the data
                      _DiscriptionController.clear();
                      _amountCotroller.clear();
                      _titleController.clear();
                    }

                    //print(ExpenzeService().loadExpenzes());
                  },
                  child: CoustomButton(
                      text: "Add",
                      buttonColor:
                          widget.checker == 0 ? kcCardGreen : kcCardRed),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //functions
  //to show the calender
  Future<void> _showdatePicker() async {
    try {
      final setdate = await showDatePicker(
          context: context,
          firstDate: _firstDate,
          lastDate: _lastDate,
          currentDate: _selecteDate);

      setState(() {
        _selecteDate = setdate!;
      });
    }

    // update the date

    catch (err) {}
  }

  //to show the time
  Future<void> _showtimePicker() async {
    try {
      final settime =
          await showTimePicker(context: context, initialTime: _selectedTime);

      setState(() {
        _selectedTime = settime!;
      });

    } catch (err) {}
  }
}
