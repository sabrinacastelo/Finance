import 'dart:developer';

import 'package:finances/common/constants/app_colors.dart';
import 'package:finances/common/extensions/sizes.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  double get textScaleFactor =>
      MediaQuery.of(context).size.width < 360 ? 0.7 : 1.0;
  double get iconSize => MediaQuery.of(context).size.width < 360 ? 16.0 : 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: AppColors.coldGradient,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(500, 30),
                    bottomRight: Radius.elliptical(500, 30),
                  )),
              height: 287.h,
            ),
          ),
          Positioned(
            left: 24.0,
            right: 24.0,
            top: 74.h,
            child: Row(
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                    'Estatísticas de Despesas',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ],
                ),
                const SizedBox(width: 100.0),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  child: Stack(
                    alignment: const AlignmentDirectional(0.5, -0.5),
                    children: [
                      const Icon(
                        Icons.notifications_none_outlined,
                        color: AppColors.white,
                      ),
                      Container(
                        width: 8.w,
                        height: 8.w,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE53552),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 24.w,
            right: 24.w,
            top: 155.h,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 32.w),
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        children: [
                          Text(
                            'Despesas Totais',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'R\$ 2.000,00',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => log('ver detalhes'),
                        child: PopupMenuButton(
                          padding: EdgeInsets.zero,
                          child: const Icon(
                            Icons.more_horiz,
                            color: AppColors.white,
                          ),
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              height: 24.0,
                              child: Text('Ver Detalhes'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 36.h),
                  _buildBarChart(),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Icon(
                          Icons.pie_chart,
                          color: AppColors.white,
                          size: iconSize,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      const Column(
                        children: [
                          Text(
                            'Maior Despesa',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'R\$ 800,00',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Icon(
                          Icons.trending_up,
                          color: AppColors.white,
                          size: iconSize,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Menor Despesa',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'R\$ 50,00',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
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
          Positioned(
            top: 597.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Resumo',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => log('ver detalhes'),
                        child: const Text(
                          'Ver detalhes',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Alimentação',
                                    style: TextStyle(
                                      color: Color(0xFF020000),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'R\$ 300,00',
                                    style: TextStyle(
                                      color: Color(0xFFE92020),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Esta Semana',
                                    style: TextStyle(
                                      color: AppColors.secondaryColor,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '15:00',
                                    style: TextStyle(
                                      color: AppColors.secondaryColor,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBarChart() {
    return SizedBox(
      height: 150.h,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: AppColors.primaryColor,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                String weekDay;
                switch (group.x) {
                  case 0:
                    weekDay = 'Seg';
                    break;
                  case 1:
                    weekDay = 'Ter';
                    break;
                  case 2:
                    weekDay = 'Qua';
                    break;
                  case 3:
                    weekDay = 'Qui';
                    break;
                  case 4:
                    weekDay = 'Sex';
                    break;
                  case 5:
                    weekDay = 'Sáb';
                    break;
                  case 6:
                    weekDay = 'Dom';
                    break;
                  default:
                    throw Error();
                }
                return BarTooltipItem(
                  '$weekDay\n',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'R\$ ${rod.y}',
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: (double value) {
                switch (value.toInt()) {
                  case 0:
                    return 'S';
                  case 1:
                    return 'T';
                  case 2:
                    return 'Q';
                  case 3:
                    return 'Q';
                  case 4:
                    return 'S';
                  case 5:
                    return 'S';
                  case 6:
                    return 'D';
                  default:
                    return '';
                }
              },
              margin: 8,
              getTextStyles: (_, __) => const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            leftTitles: SideTitles(showTitles: false),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  y: 5,
                  colors: [Colors.lightBlueAccent, Colors.greenAccent],
                )
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  y: 6,
                  colors: [Colors.lightBlueAccent, Colors.greenAccent],
                )
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  y: 7,
                  colors: [Colors.lightBlueAccent, Colors.greenAccent],
                )
              ],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                  y: 8,
                  colors: [Colors.lightBlueAccent, Colors.greenAccent],
                )
              ],
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(
                  y: 9,
                  colors: [Colors.lightBlueAccent, Colors.greenAccent],
                )
              ],
            ),
            BarChartGroupData(
              x: 5,
              barRods: [
                BarChartRodData(
                  y: 11,
                  colors: [Colors.lightBlueAccent, Colors.greenAccent],
                )
              ],
            ),
            BarChartGroupData(
              x: 6,
              barRods: [
                BarChartRodData(
                  y: 12,
                  colors: [Colors.lightBlueAccent, Colors.greenAccent],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
