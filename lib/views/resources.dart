import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF80CEF5),
        appBar: AppBar(
          centerTitle: true,
          title: Text(Constants.resourceName),
        ),
        body: ResourceList());
  }
}

class ResourceList extends StatelessWidget {
  final List<String> names = <String>[
    "Freedom from Fear",
    "Anxiety and Depression Association of America",
    "Depression and Bipolar Support Alliance",
    "Healthline - Mental Health Resources",
    "Mayo Clinic - Mental Illness Resource",
    "Psychology Today - Find a Therapist Feature",
    "Mental Health America",
    "American Psychiatric Assocation",
    "Psychology Today"
  ];

  final List<String> links = <String>[
    'http://www.freedomfromfear.org/',
    'http://www.adaa.org/living-with-anxiety/ask-and-learn/resources',
    'http://www.dbsalliance.org/',
    'https://www.healthline.com/health/mental-health-resources',
    'http://www.mayoclinic.org/diseases-conditions/mental-illness/basics/definition/con-20033813',
    'http://therapists.psychologytoday.com/rms/?utm_source=PT_Psych_Today',
    'http://www.mentalhealthamerica.net/',
    'http://www.psych.org/',
    'http://www.psychologytoday.com/magazine'
  ];
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: names.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 50,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(1, 3),
                  )
                ],
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: <Color>[
                      Color(0xFF007CFF),
                      Color(0xFF44A6FF),
                      Color(0xFF9DBBFF)
                    ])),
            child: Center(
              child: InkWell(
                child: Text(
                  names[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => launch(links[index]),
              ),
            ));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
