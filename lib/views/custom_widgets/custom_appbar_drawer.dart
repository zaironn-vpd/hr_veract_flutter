import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_veract/src/features/profile/ui/check_token.dart';
import 'package:hr_veract/src/features/auth/repository/signOut_repository.dart';
import 'package:hr_veract/views/custom_widgets/custom_popup_dialog.dart';

class CustomAppbarDrawer extends ConsumerStatefulWidget {
  const CustomAppbarDrawer({super.key});

  @override
  ConsumerState<CustomAppbarDrawer> createState() => _CustomAppbarDrawerState();
}

class _CustomAppbarDrawerState extends ConsumerState<CustomAppbarDrawer> {
  bool isExpandedET = false;
  bool isExpandedCF = false;

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(signoutRepositoryProvider, (prev, next) {
      next.whenOrNull(
        data: (data) => Navigator.pushReplacementNamed(context, '/'),
        loading:
            () => showDialog(
              context: context,
              builder:
                  (context) => CustomPopupDialog(
                    contents: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 20),
                              Text(
                                'Logging out...',
                                style: TextStyle(
                                  fontFamily: "PoppinsRegular",
                                  fontSize: 16,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
            ),
        error:
            (e, st) => showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                    content: Text(
                      e.toString(),
                      style: TextStyle(
                        fontFamily: 'PoppinsRegular',
                        fontSize: 14,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
            ),
      );
    });

    return SizedBox(
      width: 250,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(106, 159, 106, 1),
                ),
                child: Center(
                  child: Text(
                    "VeraCT",
                    style: TextStyle(
                      fontFamily: 'PoppinsBold',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_rounded),
              title: Text(
                "Dashboard",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
            ),
            ExpansionTile(
              leading: Icon(
                Icons.task,
                color:
                    isExpandedET
                        ? Color.fromRGBO(106, 159, 106, 1)
                        : Colors.grey[750],
              ),
              onExpansionChanged: (expanded) {
                setState(() {
                  isExpandedET = expanded;
                });
              },
              title: const Text(
                "Employee Task",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.feed_outlined),
                        title: Text(
                          "Task Overview",
                          style: TextStyle(
                            fontFamily: "PoppinsBold",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            fontSize: 10,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/task');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.check_circle_outline_rounded),
                        title: const Text(
                          "Task List",
                          style: TextStyle(
                            fontFamily: "PoppinsBold",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            fontSize: 10,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/taskList');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text(
                "201 Files",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/files');
              },
            ),
            ListTile(
              leading: Icon(Icons.work_history),
              title: Text(
                "Contribution History",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/contribution');
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books_sharp),
              title: Text(
                "Memo",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/memo');
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_month_rounded),
              title: Text(
                "Attendance",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/attendance');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text(
                "Personnel Action Notice",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pan');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet_rounded),
              title: Text(
                "Paycheck",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/paycheck');
              },
            ),
            ExpansionTile(
              leading: Icon(
                Icons.chrome_reader_mode_outlined,
                color:
                    isExpandedCF
                        ? Color.fromRGBO(106, 159, 106, 1)
                        : Colors.grey[750],
              ),
              onExpansionChanged: (expanded) {
                setState(() {
                  isExpandedCF = expanded;
                });
              },
              title: const Text(
                "Company Forms",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.access_time_rounded),
                        title: Text(
                          "Overtime List",
                          style: TextStyle(
                            fontFamily: "PoppinsBold",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            fontSize: 10,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/overtimeList',
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.airplanemode_active_rounded),
                        title: const Text(
                          "Leave List",
                          style: TextStyle(
                            fontFamily: "PoppinsBold",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            fontSize: 10,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/leaveList');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.poll_outlined),
              title: Text(
                "Poll Voting",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/pollVoting');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Logout",
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 10,
                  color: Colors.red[300],
                ),
              ),
              onTap: () {
                final signOut = ref.watch(signoutRepositoryProvider.notifier);
                signOut.signOut();
                //Navigator.pushReplacementNamed(context, "/");
              },
            ),
          ],
        ),
      ),
    );
  }
}
