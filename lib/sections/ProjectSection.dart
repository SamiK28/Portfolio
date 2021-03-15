import 'package:flutter/material.dart';

import 'package:Portfolio/app/app.dart';
import 'package:Portfolio/services/Services.dart';

class ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.infinity,
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
            children: projects
                .map((project) => ProjectItem(
                      technology: project["tech"],
                      name: project["name"],
                      desc: project["desc"],
                      url: project["url"],
                    ))
                .toList()),
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String technology;
  final String name;
  final String desc;
  final String url;

  const ProjectItem({this.technology, this.name, this.desc, this.url})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF202022),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: InkWell(
        onTap: () {
          Services().launchURL(url: url);
        },
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
              Text(
                technology ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 4,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 8,
                ),
              ),
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
                  Image.asset(
                    "assets/icons/link.png",
                    color: Colors.white,
                    height: 24,
                    width: 24,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 8,
                ),
              ),
              Text(
                desc ?? "",
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
              Row(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/github.png",
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
                        "Github",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
