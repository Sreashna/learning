import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/home/widgets/banner.dart';
import 'package:untitled/home/widgets/community.dart';
import 'package:untitled/home/widgets/course.dart';
import 'package:untitled/home/widgets/headerrow.dart';
import 'package:untitled/home/widgets/live_session.dart';
import 'package:untitled/home/widgets/popular_widget.dart';
import 'package:untitled/home/widgets/question.dart';
import 'package:untitled/home/widgets/review.dart';
import '../bottom/home_bottom.dart';
import '../controllers/home_controller.dart';
import '../controllers/streak_controller.dart';
import 'widgets/wavy_header.dart';


class HomePage extends StatelessWidget {
  final controller = Get.put(HomeController());
  final streakController = Get.put(StreakController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const HomeBottomNav(),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            children: [

              Stack(
                children: [
                  const WavyHeader(),
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      HeaderRow(),
                      const SizedBox(height: 16),

                      PromoCard(),

                      const SizedBox(height: 20),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Active Course",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      ActiveCourseCard(),

                    ],
                  ),
                ],
              ),


              const SizedBox(height: 16),

              const PopularCoursesWidget(),
              const LiveSessionCard(),
              const SizedBox(height: 16),

              const CommunityCard(),
              const SizedBox(height: 16),
              const WhatLearnersSaying(),
              const SizedBox(height: 16),
              const QuestionsSection(),
            ],
          ),
        );
      }),
    );
  }
}
