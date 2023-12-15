import 'package:flutter/material.dart';

class HourlyInfoElement extends StatefulWidget {
  const HourlyInfoElement({
    super.key,
    required this.time,
    required this.temperature,
    required this.iconName,
  });

  final String time, iconName;
  final int temperature;

  @override
  State<HourlyInfoElement> createState() => _HourlyInfoElementState();
}

class _HourlyInfoElementState extends State<HourlyInfoElement> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        isSelected = !isSelected;
      }),
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.all(color: Colors.white))
            : BoxDecoration(border: Border.all(color: Colors.transparent)),
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Column(
            children: [
              Text(
                widget.time,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  'assets/weather_icons_small/${widget.iconName}.png',
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.question_mark,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
              Text(
                '${widget.temperature}°',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
