import 'package:Portfolio/services/sizes.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:Portfolio/PageSwitcher/PageSwitcher.dart';
import 'package:Portfolio/sections/ProjectSection.dart';
import 'package:Portfolio/sections/WorkExperienceSection.dart';
import 'package:Portfolio/services/Services.dart';

const List projects = [
  {
    "name": "Pigeon",
    "tech": "Flutter",
    "desc": "Multi-Platform Messaging Application with an inbuilt chatbot.",
    "url": "https://github.com/SamiK28/Pigeon"
  },
  {
    "name": "Auxilium",
    "tech": "Vue.JS/ Node JS, Matic JS ",
    "desc": "Decentralized Crowdfunding Web Application using Blockchain.",
    "url": "https://github.com/SamiK28/Auxilium_Hack4"
  },
  {
    "name": "SecureIT",
    "tech": "Flutter, Python / OpenCV",
    "desc":
        "A product that ensures your home is safe from intruders using face recognition algorithm.We have used Computer Vision and Deep Learning to solve this problem.",
    "url": "https://github.com/SamiK28/secure-it"
  },
  {
    "name": "Image Dehazing using OpenCV",
    "tech": "Python / OpenCV",
    "desc":
        "A novel and fast Image-Dehazing technique using Histogram Equalization, implemented with OpenCV and Python",
    "url": "https://github.com/SamiK28/Dehazing"
  },
];
const List workex = [
  {
    "name": "Xpert",
    "role": "Mobile Application Development Intern",
    "url": "https://play.google.com/store/apps/details?id=chat.xpert.user",
  },
  {
    "name": "Headstrt",
    "role": "Full Stack Development Intern",
    "url": "https://play.google.com/store/apps/details?id=com.headstrt.app",
  },
  {
    "name": "You2You",
    "role": "Freelance",
    "url":
        "https://play.google.com/store/apps/details?id=com.you2you.you2youapp",
  },
  {
    "name": "KhetoSe",
    "role": "Freelance",
    "url": "https://play.google.com/store/apps/details?id=com.khetose.user",
  },
];
const Map<String, String> hyperlinks = {
  "github": "https://github.com/SamiK28",
  "linkedin": "https://www.linkedin.com/in/samarthkhanna28/",
  "twitter": "https://twitter.com/samarthkhanna28",
  "instagram": "https://www.instagram.com/samarthkhanna28/",
  "resume":
      "https://drive.google.com/file/d/1JfbLFxHQJ5QGgGyuFTVsMX8loL2A9-n8/view",
  "mail": "mailto:samarthkhanna24@gmail.com"
};
int active = 1;

class PortfolioApp extends StatefulWidget {
  @override
  _PortfolioAppState createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  static Widget subHeader = Text(
      "Hybrid Mobile Application and Backend Developer. I am not only a developer but an active consumer as well, I like to read about upcoming technological ventures, as a result, I also love participating in Hackathons.",
      style: TextStyle(
        color: Color(0xFFa1a1a1),
        fontSize: 18,
      ));

  ScrollController _scrollController = ScrollController(initialScrollOffset: 0);
  @override
  Widget build(BuildContext context) {
    DeviceSize().size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: true
          ? Scrollbar(
              controller: _scrollController,
              child: ListView(
                physics: ScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.05,
                  MediaQuery.of(context).size.height * 0.05,
                  MediaQuery.of(context).size.width * 0.05,
                  MediaQuery.of(context).size.height * 0.05,
                ),
                controller: _scrollController,
                shrinkWrap: true,
                children: [
                  Text(
                    "Hello, ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                        fontWeight: FontWeight.bold),
                  ),
                  TyperAnimatedTextKit(
                    text: ["I'm Samarth Khanna"],
                    repeatForever: false,
                    isRepeatingAnimation: false,
                    speed: Duration(milliseconds: 100),
                    textStyle: TextStyle(
                        color: Colors.orange.shade900,
                        fontSize: 80,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 32,
                    ),
                  ),
                  subHeader,
                  Padding(
                    padding: EdgeInsets.only(
                      top: 32,
                    ),
                  ),
                  TopNavbar(
                    items: [
                      "GitHub",
                      "Twitter",
                      "LinkedIn",
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: PageSwitcher(
                      titles: ["projects", "work experience"],
                      onUpdate: () {
                        setState(() {
                          
                        });
                      },
                    ),
                  ),
                  Container(
                      child: (active == 1)
                          ? ProjectsSection()
                          : WorkExperienceSection())
                ],
              ),
            )
          : Container(),
    );
  }
}

class BackDrop extends StatelessWidget {
  final text;
  final size;
  final strokeWidth;

  BackDrop({
    @required this.text,
    @required this.size,
    @required this.strokeWidth,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: size,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = Color(0xFF0c0c0c),
          ),
        ),
        // Solid text as fill.
        Text(
          text,
          style: TextStyle(
            fontSize: size,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class TopNavbar extends StatelessWidget {
  final List<String> items;

  const TopNavbar({this.items}) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: items
                .map(
                  (elem) => Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                    ),
                    child: InkWell(
                      onTap: () async {
                        await Services()
                            .launchURL(url: hyperlinks[elem.toLowerCase()]);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white38),
                            borderRadius: BorderRadius.circular(100)),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/${elem.toLowerCase()}.png",
                              color: Colors.white,
                              height: 24,
                              width: 24,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 12,
                              ),
                            ),
                            Text(
                              elem,
                              style: TextStyle(
                                color: Color(0xFFe8e6e3),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  await Services().launchURL(url: hyperlinks["resume"]);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10, right: 10),
                  width: 140,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Resume",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8,
                        ),
                      ),
                      Image.asset(
                        "assets/icons/link.png",
                        color: Colors.black,
                        height: 24,
                        width: 24,
                      )
                    ],
                  ),
                ),
              ),
              Text(
                " or  ",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white38),
                    borderRadius: BorderRadius.circular(100)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: Colors.white70,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8,
                      ),
                    ),
                    SelectableText(
                      "samarthkhanna24@gmail.com",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
