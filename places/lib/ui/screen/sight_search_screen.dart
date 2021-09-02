import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/parts.dart';
import 'package:places/ui/res/style.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/sight_details.dart';

class SightSearchScreen extends StatefulWidget {
  const SightSearchScreen({Key? key}) : super(key: key);

  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

TextEditingController searchController = TextEditingController();

class _SightSearchScreenState extends State<SightSearchScreen> {
  List<Sight> searchHistory = [];

  List<Sight> _filteredSights = [];
  bool _isLoad = false;

  @override
  void initState() {
    super.initState();
    searchController.addListener(
      _filterSights,
    );
  }

  // @override
  // void dispose() {
  //   // searchController.removeListener(() {
  //   //   _filterSights;
  //   // });
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // заглушка показывающая загрузку
    if (_isLoad) {
      Future.delayed(
        const Duration(
          milliseconds: 1000,
        ),
        () {
          setState(
            () {
              _isLoad = false;
            },
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(140),
          child: Title(
            filterSights: _filteredSights,
            onCancelTap: () {
              setState(() {
                _isLoad = true;
                searchController.clear();
              });
            },
            searchController: searchController,
          ),
        ),
      ),
      body: _isLoad
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 49),
              child: _filteredSights.isEmpty
                  ? EmptySearch(
                      removeHistoryItem: (i) {
                        setState(() {
                          searchHistory.remove(searchHistory[i]);
                          _isLoad = true;
                        });
                      },
                      searchHistory: searchHistory,
                      onEmptyTap: () {
                        setState(() {
                          searchHistory = [];
                          _isLoad = true;
                        });
                      },
                    )
                  : FoundItems(
                      addItemToHistory: (i) {
                        if (!searchHistory.contains(_filteredSights[i])) {
                          setState(() {
                            searchHistory.add(_filteredSights[i]);
                          });
                        }
                      },
                      filteredSight: _filteredSights,
                    ),
            ),
      bottomNavigationBar: SBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          setState(() {});
        },
      ),
    );
  }

  void _filterSights() {
    if (searchController.text == '') {
      setState(() {
        _filteredSights = [];
      });
      return;
    }

    setState(() {
      _isLoad = true;
      _filteredSights = mocks
          .where((element) => element.name
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    });
  }
}

class ShowResult {
  String bukva;
  bool isSovpadaet;

  ShowResult({
    required this.bukva,
    required this.isSovpadaet,
  });
}

class Slovo extends StatelessWidget {
  final String objectName;
  final String searchText;
  const Slovo({
    required this.objectName,
    required this.searchText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ShowResult> text = [];
    bool next = true;

    for (var i = 0; objectName.length > i; i++) {
      next = true;
      for (var j = 0; searchText.length > j; j++) {
        if (objectName[i].toLowerCase() == searchText[j].toLowerCase()) {
          text.add(ShowResult(bukva: objectName[i], isSovpadaet: true));
          next = false;
          break;
        }
      }
      if (next) {
        text.add(ShowResult(bukva: objectName[i], isSovpadaet: false));
      }
    }

    return RichText(
      text: TextSpan(
        // style: roboto500x16x252849,
        children: [
          for (var i = 0; text.length > i; i++)
            if (text[i].isSovpadaet)
              TextSpan(text: text[i].bukva, style: roboto700x16x252849)
            else if (text[i].isSovpadaet == false)
              TextSpan(text: text[i].bukva, style: roboto400x16x252849),
        ],
      ),
    );
  }
}

class FoundItems extends StatelessWidget {
  final List<Sight> filteredSight;
  final Function(int) addItemToHistory;
  const FoundItems({
    required this.addItemToHistory,
    required this.filteredSight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; filteredSight.length > i; i++)
            InkWell(
              // клик по результату поиска
              onTap: () {
                addItemToHistory(i);
                Navigator.push<Object>(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SightDetails(thisSight: filteredSight[i]),
                  ),
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      filteredSight[i].url,
                      fit: BoxFit.cover,
                      width: 56,
                      height: 56,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Slovo(
                          objectName: filteredSight[i].name,
                          searchText: searchController.text,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          filteredSight[i].type,
                          textAlign: TextAlign.left,
                          softWrap: true,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        if ((filteredSight.length - 1) != i)
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 0.8,
                                color:
                                    const Color(0xff7C7E92).withOpacity(0.56),
                              ),
                              const SizedBox(
                                height: 11,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback onCancelTap;
  final List<Sight> filterSights;
  const Title({
    required this.filterSights,
    required this.onCancelTap,
    required this.searchController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline3,
                children: <TextSpan>[
                  TextSpan(
                    text: 'C',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const TextSpan(text: 'писок\n'),
                  TextSpan(
                    text: 'и',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const TextSpan(text: 'нтересных мест'),
                ],
              ),
            ),
          ],
        ),
        otstupH22,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.9,
            // окно поиска
            child: TextField(
              textInputAction: TextInputAction.done,
              textAlignVertical: TextAlignVertical.center,
              cursorColor: Colors.black,
              style: roboto400x16x3b3e5b,
              controller: searchController,
              decoration: InputDecoration(
                fillColor: const Color(0xffF5F5F5),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 9,
                  horizontal: 15,
                ),
                isDense: true,
                hintText: 'Поиск',
                hintStyle: roboto400x16x7c7e92x056,
                prefixIcon: SvgPicture.asset(
                  'assets/img/searchIconSettings.svg',
                  width: 19,
                  height: 18,
                  fit: BoxFit.none,
                ),
                suffix: Container(
                  height: 24,
                  width: 24,
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: onCancelTap,
                    child: Image.asset(
                      'assets/img/cancel2.png',
                      width: 24,
                      // height: 24,
                    ),
                  ),
                ),
                enabledBorder: textFieldBorderStyle,
                focusedBorder: textFieldBorderStyle,
                errorBorder: textFieldBorderStyle,
                disabledBorder: textFieldBorderStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder textFieldBorderStyle = OutlineInputBorder(
  borderSide: const BorderSide(
    color: Colors.transparent,
  ),
  borderRadius: BorderRadius.circular(12.0),
);

class EmptySearch extends StatelessWidget {
  final VoidCallback onEmptyTap;
  final List<Sight> searchHistory;
  final Function(int) removeHistoryItem;
  const EmptySearch({
    required this.removeHistoryItem,
    required this.searchHistory,
    required this.onEmptyTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return searchHistory.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/img/searchIconSettings.svg',
                width: 50,
                height: 48,
              ),
              const SizedBox(
                width: double.infinity,
                height: 32,
              ),
              Text('Ничего не найдено', style: roboto500x18x7C7E92),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Попробуйте изменить параметы \nпоиска',
                style: roboto400x14x7C7E92,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ВЫ ИСКАЛИ',
                    style: roboto400x12x7C7E928F,
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  Column(
                    children: [
                      for (var i = 0; searchHistory.length > i; i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push<Object>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SightDetails(
                                      thisSight: searchHistory[i],
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                searchHistory[i].name,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                removeHistoryItem(i);
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Color(0xff7C7E92),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  InkWell(
                    onTap: onEmptyTap,
                    child: Text(
                      'Очистить историю',
                      style: roboto500x16xgreen,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
