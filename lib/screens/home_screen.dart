import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:technical_test/core/constants/app_icons.dart';
import 'package:technical_test/core/constants/app_images.dart';
import 'package:technical_test/core/constants/app_text_theme.dart';
import 'package:technical_test/core/widgets/events_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedItemPosition = 2;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImageRoute.background),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 25.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your today\'s \n Agenda',
                        style: AppTextTheme.SF_F32W400CWhite,
                        textAlign: TextAlign.start,
                      ),
                      const Expanded(child: SizedBox()),
                      Container(
                        padding: EdgeInsets.all(7.r),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 1, color: const Color(0xFF44414d))),
                        child: AppIcons.frame,
                      ),
                      SizedBox(width: 8.r),
                      Container(
                        padding: EdgeInsets.all(7.r),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            border: Border.all(
                                width: 1, color: const Color(0xFF44414d)),
                            shape: BoxShape.circle),
                        child: AppIcons.plus,
                      ),
                    ],
                  ),
                ),
                DateSelector(
                  onDateSelected: (date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                ),
                DayHeader(
                  selectedDate: _selectedDate,
                  eventCount: 4,
                ),
                EventsItem(
                  meshbackground: AppImageRoute.mesh1,
                  title: 'Discuss a trip',
                  type: 'Work',
                  subtitle: 'Trip to Rome',
                  time: '10:00 - 10:20 AM',
                  imageUrls: [
                    AppImageRoute.person1,
                    AppImageRoute.person2,
                    AppImageRoute.person3,
                  ],
                ),
                EventsItem(
                  meshbackground: AppImageRoute.mesh2,
                  title: 'Discuss a trip with Tom',
                  type: 'High',
                  subtitle: 'Trip to Rome',
                  time: '11:00 - 12:30 AM',
                  imageUrls: [
                    AppImageRoute.person4,
                  ],
                ),
                EventsItem(
                  meshbackground: AppImageRoute.mesh3,
                  title: 'Lunch in café',
                  type: 'Life',
                  subtitle: 'Evening routine',
                  time: '13:00 - 14:30 PM',
                  imageUrls: [
                    AppImageRoute.person5,
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: 1.0,
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AppImageRoute.belowShade,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        height: 100,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        snakeViewColor: const Color(0xFF121212),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        selectedItemColor: Colors.transparent,
        unselectedItemColor: Colors.transparent,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() => _selectedItemPosition = index),
        items: [
          BottomNavigationBarItem(
            icon: AppIcons.home5Fill,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: AppIcons.calendarFill,
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppImageRoute.homeImage,
              width: 150.w,
              height: 150.h,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: AppIcons.vector,
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: AppIcons.search2Fill,
            label: 'Search',
          ),
        ],
        selectedLabelStyle: TextStyle(fontSize: 14.sp),
        unselectedLabelStyle: TextStyle(fontSize: 10.sp),
      ),
    );
  }
}

class DayHeader extends StatelessWidget {
  final DateTime selectedDate;
  final int eventCount;

  const DayHeader({
    super.key,
    required this.selectedDate,
    required this.eventCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: 16.0.h, top: 25.h, left: 16.w, right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_getDayName(selectedDate)} ${selectedDate.day}',
                style: AppTextTheme.SF_F20W400CWhite,
              ),
              Text(
                '$eventCount events',
                style: AppTextTheme.SF_F16W400CWhite.copyWith(
                    color: Colors.white.withOpacity(0.5)),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                    width: 1, color: Colors.white.withOpacity(0.15))),
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.all(2.r),
                    decoration: const BoxDecoration(
                        color: Color(0xFF322e3e), shape: BoxShape.circle),
                    child: _buildIconButton(AppIcons.calendar)),
                SizedBox(width: 8.w),
                _buildIconButton(AppIcons.listCheck),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getDayName(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  Widget _buildIconButton(Widget icon) {
    return Container(
      width: 35.r,
      height: 35.r,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Transform.scale(scale: 1.1, child: icon),
        onPressed: () {
          // Add functionality here
        },
      ),
    );
  }
}

class DateSelector extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const DateSelector({super.key, required this.onDateSelected});

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  late DateTime _selectedDate;
  late List<DateTime> _dates;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _dates =
        List.generate(14, (index) => DateTime.now().add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _dates.length,
        itemBuilder: (context, index) {
          final date = _dates[index];
          final isSelected = date.day == _selectedDate.day &&
              date.month == _selectedDate.month &&
              date.year == _selectedDate.year;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = date;
              });
              widget.onDateSelected(date);
            },
            child: Container(
              width: 55.w,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 5.h),
              decoration: BoxDecoration(
                  color:
                      isSelected ? const Color(0xFF322e3e) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: isSelected
                        ? const Color(0xFF44414d)
                        : Colors.transparent,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _getDayName(date),
                    style: AppTextTheme.SF_F16W400CWhite.copyWith(
                        color: Colors.white.withOpacity(0.5)),
                  ),
                  SizedBox(height: 10.h),
                  Text(date.day.toString(),
                      style: AppTextTheme.SF_F16W400CWhite),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getDayName(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }
}
