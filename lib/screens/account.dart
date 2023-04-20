import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/theme.dart';
import '../gen/assets.gen.dart';
import '../routes/route.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/elevated_button.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  // account screen show username
  var _userInfo = 'emptyUserInfo';
  String? username;

  Future<void> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String userInfo = prefs.getString('user_data') ?? '';

    dynamic userObj = jsonDecode(userInfo);
    username = userObj['response']['user']['username'];

    setState(() {
      _userInfo = username ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(currentIndex: 3),
      body: Material(
        child: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              SizedBox(
                height: 170,
                child: Stack(
                  children: [
                    Container(
                      height: 130,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      right: 20,
                      top: 90,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColorDark,
                            radius: 35,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Assets.images.userlogo.image(
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    _userInfo,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                                Text(
                                  'SUC Service Member',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [boxShadow],
                ),
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: SvgPicture.asset(Assets.svg.account.myPackageIcon),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          'My package | 20 Dec 2023 Expire',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Text(
                        'Value Pack88',
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [boxShadow],
                ),
                child: accList(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                child: ElevatedBtn(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RouteList.welcome);
                  },
                  btnText: 'Signout',
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget accList() {
    return Column(
      children: [
        CustomListTile(
          leading: SvgPicture.asset(Assets.svg.account.vehicleIcon),
          title: 'My Vehicle',
          onTapFunction: () {
            Navigator.of(context).pushNamed(RouteList.comingsoon);
          },
          first: true,
        ),
        CustomListTile(
          leading: SvgPicture.asset(Assets.svg.account.walletIcon),
          title: 'Wallet Point',
          onTapFunction: () {
            Navigator.of(context).pushNamed(RouteList.comingsoon);
          },
        ),
        CustomListTile(
          leading: SvgPicture.asset(Assets.svg.account.userIcon),
          title: 'My Profile',
          onTapFunction: () {
            Navigator.of(context).pushNamed(RouteList.comingsoon);
          },
        ),
        CustomListTile(
          leading: SvgPicture.asset(Assets.svg.account.changePasswordIcon),
          title: 'Change Password',
          onTapFunction: () {
            Navigator.of(context).pushNamed(RouteList.comingsoon);
          },
        ),
        CustomListTile(
          leading: SvgPicture.asset(Assets.svg.account.settingIcon),
          title: 'Settings',
          onTapFunction: () {
            Navigator.of(context).pushNamed(RouteList.comingsoon);
          },
        ),
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final Function() onTapFunction;
  final bool first;

  const CustomListTile({
    required this.leading,
    required this.title,
    required this.onTapFunction,
    this.first = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Theme.of(context).dividerColor,
          // check if first not need the divider
          thickness: (first == true) ? 0 : 1,
          height: (first == true) ? 0 : 2,
        ),
        ListTile(
          leading: leading,
          trailing: Icon(
            Icons.navigate_next,
            color: Theme.of(context).primaryColorDark,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          onTap: onTapFunction,
        )
      ],
    );
  }
}
