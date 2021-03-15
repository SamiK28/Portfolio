import 'package:flutter/material.dart';
import 'package:Portfolio/app/app.dart';

class PageSwitcher extends StatelessWidget {
  final List<String> titles;
  final Function onUpdate;

  const PageSwitcher({this.titles, this.onUpdate}) : super();

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Column(
      children: titles.map((elem) {
        counter++;
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 24,
          ),
          child: GestureDetector(
            onTap: () {
              active = titles.indexOf(elem) + 1;
              onUpdate();
            },
            child: PageItem(
              isActive: counter == active,
              title: elem.toUpperCase(),
              counter: (counter.toString().length == 1)
                  ? "0" + (counter).toString()
                  : (counter).toString(),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class PageItem extends StatelessWidget {
  final String counter;
  final String title;
  final bool isActive;

  const PageItem({this.counter = "", this.title = "", this.isActive = true})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            counter,
            style: TextStyle(
                color: (isActive) ? Colors.white : Color(0xFF626262),
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
            ),
          ),
          Container(
            height: 2,
            width: (isActive) ? 96 : 64,
            color: (isActive) ? Colors.white : Color(0xFF626262),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: (isActive) ? Colors.white : Color(0xFF626262),
              letterSpacing: 4,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
