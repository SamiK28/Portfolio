import 'package:flutter/material.dart';
import 'package:Portfolio/app/app.dart';
import 'package:Portfolio/services/Services.dart';

class WorkExperienceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.infinity,
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
            children: workex
                .map((work) => WorkExperience(
                      name: work["name"],
                      role: work["role"],
                      url: work["url"],
                    ))
                .toList()),
      ),
    );
  }
}

class WorkExperience extends StatelessWidget {
  final String name;
  final String role;

  final String url;

  const WorkExperience({this.name = "", this.url = "", this.role = ""})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          4,
        ),
      ),
      child: InkWell(
        onTap: () {
          Services().launchURL(url: url);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 3.6,
                  color: Colors.deepPurple.shade600.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(36)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.02,
              MediaQuery.of(context).size.height * 0.04,
              MediaQuery.of(context).size.width * 0.02,
              MediaQuery.of(context).size.height * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name ?? "",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
                    ),
                    Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/icons/playstore.png",
                                color: Colors.white,
                                height: 18,
                                width: 18,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 8,
                                ),
                              ),
                              Text(
                                "Google Play",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ]))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                ),
                Text(
                  role ?? "",
                  softWrap: true,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFFa1a1a1),
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
