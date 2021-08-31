import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/parts.dart';
import 'package:places/ui/res/style.dart';
import 'package:places/ui/res/text_styles.dart';

class AddSightScreen extends StatefulWidget {
  const AddSightScreen({Key? key}) : super(key: key);

  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

TextEditingController opisanie = TextEditingController();
TextEditingController nazvanie = TextEditingController();
TextEditingController latitude = TextEditingController(); // широта
TextEditingController longitude = TextEditingController(); // долгота

class _AddSightScreenState extends State<AddSightScreen> {
  bool isSaveBtn = false;
  late FocusNode opisanieFocus;
  late FocusNode nazvanieFocus;
  late FocusNode latitudeFocus;
  late FocusNode longitudeFocus;

  @override
  void initState() {
    super.initState();

    opisanieFocus = FocusNode();
    nazvanieFocus = FocusNode();
    latitudeFocus = FocusNode();
    longitudeFocus = FocusNode();

    opisanie.addListener(_printLatestValue);
    nazvanie.addListener(_printLatestValue);
    longitude.addListener(_printLatestValue);
    latitude.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    opisanieFocus.dispose();
    nazvanieFocus.dispose();
    latitudeFocus.dispose();
    longitudeFocus.dispose();

    opisanie.dispose();
    nazvanie.dispose();
    longitude.dispose();
    latitude.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 24),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Отмена',
                      style: GoogleFonts.roboto(
                        color: const Color(0xff7c7e92),
                        fontWeight: FontWeight.w500,
                        height: 1.25,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  otstupW51,
                  Text(
                    'Избранное',
                    style: GoogleFonts.roboto(
                      color: Theme.of(context).canvasColor,
                      fontWeight: FontWeight.w500,
                      height: 1.33,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              otstupH24,
              Text(
                'КАТЕГОРИЯ',
                style: robotohead400x12,
              ),
              otstupH14,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Не выбрано',
                    style: roboto400x16,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 10,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                ],
              ),
              hr08,
              otstupH24,
              Text(
                'НАЗВАНИЕ',
                style: robotohead400x12,
              ),
              otstupH12,
              TextField(
                // textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  latitudeFocus.requestFocus();
                },
                controller: nazvanie,
                style: roboto16x400,
                cursorColor: greenColor,
                decoration: sInputDecoration,
              ),
              otstupH24,
              Row(
                children: [
                  Block50(
                    onEditFinished: () {
                      longitudeFocus.requestFocus();
                    },
                    focusN: latitudeFocus,
                    onIconTap: () {
                      setState(() {
                        latitude.text = '';
                      });
                    },
                    title: 'ШИРОТА',
                    textController: latitude,
                  ),
                  otstupW16,
                  Block50(
                    onEditFinished: () {
                      opisanieFocus.requestFocus();
                    },
                    focusN: longitudeFocus,
                    onIconTap: () {
                      setState(() {
                        longitude.clear();
                      });
                    },
                    title: 'ДОЛГОТА',
                    textController: longitude,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                // отступы по 10 сверху и снизу у самой кнопки
                onPressed: () {
                  longitudeFocus.requestFocus();
                },
                child: Text('Указать на карте', style: roboto500x16xgreen),
              ),
              const SizedBox(
                height: 27,
              ),
              Text(
                'ОПИСАНИЕ',
                style: robotohead400x12,
              ),
              otstupH12,
              TextField(
                focusNode: opisanieFocus,
                textInputAction: TextInputAction.done,
                controller: opisanie,
                style: roboto16x400,
                cursorColor: greenColor,
                decoration: sInputDecorationMulti,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
              ),
              const SizedBox(
                height: 124,
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: isSaveBtn == false
                    ? BtnSave(
                        btnTextStyle: roboto14x700x7c7e92,
                        btnColor: const Color(0xffF5F5F5),
                        btnFunc: () {
                          // ignore: avoid_print
                          print(
                            'Нужно хотя бы по 4 символа в каждом поле для сохранения',
                          );
                        },
                      )
                    : BtnSave(
                        btnTextStyle: roboto14x700xwhite,
                        btnColor: const Color(0xff4CAF50),
                        btnFunc: () {
                          _saveNewSight();
                          _clearFields();
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveNewSight() {
    final newSight = Sight(
      nazvanie.text,
      double.parse(latitude.text),
      double.parse(longitude.text),
      opisanie.text,
      'Природа', // допилю, когда начну передавать данные между экранами
      '',
    );

    mocks.add(newSight);
    // ignore: avoid_print
    print(mocks[0]);
  }

  void _clearFields() {
    opisanie.clear();
    nazvanie.clear();
    latitude.clear();
    longitude.clear();
    setState(() {
      isSaveBtn = false;
    });
  }

  void _printLatestValue() {
    if (opisanie.text.length > 4 &&
        nazvanie.text.length > 4 &&
        latitude.text.isNotEmpty &&
        longitude.text.isNotEmpty) {
      setState(() {
        isSaveBtn = true;
      });
    } else {
      setState(() {
        isSaveBtn = false;
      });
    }
  }
}

class BtnSave extends StatelessWidget {
  final TextStyle btnTextStyle;
  final Color btnColor;
  final VoidCallback btnFunc;
  const BtnSave({
    required this.btnTextStyle,
    required this.btnColor,
    required this.btnFunc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) => btnColor,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      onPressed: btnFunc,
      child: Text(
        'Создать'.toUpperCase(),
        style: btnTextStyle,
      ),
    );
  }
}

class Block50 extends StatelessWidget {
  final VoidCallback onEditFinished;
  final FocusNode focusN;
  final TextEditingController textController;
  final VoidCallback onIconTap;
  final String title;
  const Block50({
    required this.onEditFinished,
    required this.focusN,
    required this.textController,
    required this.onIconTap,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: robotohead400x12,
          ),
          otstupH12,
          TextField(
            focusNode: focusN,
            onEditingComplete: onEditFinished,
            keyboardType: TextInputType.number,
            controller: textController,
            style: roboto16x400,
            cursorColor: greenColor,
            decoration: InputDecoration(
              suffix: IconButton(
                iconSize: 20,
                constraints: const BoxConstraints(
                  maxWidth: 20,
                  maxHeight: 20,
                ),
                padding: EdgeInsets.zero,
                onPressed: onIconTap,
                icon: const Icon(Icons.cancel, size: 20),
              ),
              contentPadding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 16,
                right: 14,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: greenColor, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: greenColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

InputDecoration sInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 16,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: greenColor, width: 2),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: greenColor,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(8)),
  ),
);

InputDecoration sInputDecorationMulti = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 16,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: greenColor, width: 2),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: greenColor,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(8)),
  ),
);