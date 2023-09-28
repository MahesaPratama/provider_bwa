import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'gender_provider.dart';

class GenderPickerPage extends StatefulWidget {
  const GenderPickerPage({super.key});

  @override
  State<GenderPickerPage> createState() => _GenderPickerPageState();
}

class _GenderPickerPageState extends State<GenderPickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<GenderProvider>(
            builder: (context, genderProvider, _) => Text(
              'Gender Picker',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: genderProvider.color),
            ),
          ),
          const SizedBox(height: 50),
          Row(
            children: [
              Expanded(
                  child: Consumer<GenderProvider>(
                      builder: (context, genderProvider, _) => GestureDetector(
                            onTap: () {
                              genderProvider.isMale = true;
                            },
                            child: customContainer(
                              genderProvider.isMale == false
                                  ? Colors.grey
                                  : genderProvider.maleColor,
                              'assets/icon_male.png',
                              'Male',
                            ),
                          ))),
              const SizedBox(width: 50),
              Expanded(
                  child: Consumer<GenderProvider>(
                      builder: (context, genderProvider, _) => GestureDetector(
                            onTap: () {
                              genderProvider.isMale = false;
                            },
                            child: customContainer(
                              genderProvider.femaleColor,
                              'assets/icon_female.png',
                              'Female',
                            ),
                          ))),
            ],
          )
        ],
      ),
    ));
  }

  Widget customContainer(Color color, String image, String label) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 80, color: color),
          Text(
            label,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: color),
          ),
        ],
      ),
    );
  }
}
