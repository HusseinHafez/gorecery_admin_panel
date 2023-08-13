import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../../config/responsive/responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.fct,
    required this.title,
    this.showSearch = true,
  }) : super(key: key);
  final String title;
  final bool showSearch;
  final Function fct;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop())
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              fct();
            },
          ),
        if (Responsive.isDesktop())
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        if (Responsive.isDesktop())
          Spacer(flex: Responsive.isDesktop() ? 2 : 1),
        !showSearch
            ? Container()
            : Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    fillColor: Theme.of(context).cardColor,
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(
                            AppConstant.defaultPadding * 0.75),
                        margin: const EdgeInsets.symmetric(
                            horizontal: AppConstant.defaultPadding / 2),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Icon(
                          Icons.search,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
