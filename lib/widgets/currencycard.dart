import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final int order;

  final blackColor = const Color(0xFF1F2123);

  const CurrencyCard(
      {super.key,
      required this.name,
      required this.code,
      required this.amount,
      required this.icon,
      required this.isInverted,
      required this.order});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -20 * (order - 1)),
      child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: isInverted ? Colors.white : blackColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: TextStyle(
                            color: isInverted ? blackColor : Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          amount,
                          style: TextStyle(
                            color: isInverted ? blackColor : Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          code,
                          style: TextStyle(
                            color: isInverted
                                ? blackColor.withOpacity(.8)
                                : Colors.white.withOpacity(.8),
                            fontSize: 16,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Transform.scale(
                  scale: 1.8,
                  child: Transform.translate(
                    offset: const Offset(-5, 18),
                    child: Icon(
                      icon,
                      color: isInverted ? blackColor : Colors.white,
                      size: 88,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
