📱 Learning App – Flutter Machine Test

A modern learning platform built using Flutter + GetX, based on the provided Figma design and API integration.

This project demonstrates:

Pixel-perfect UI from Figma

GetX state management and navigation

REST API integration

Dynamic learning dashboard

Onboarding flow

Video streaming

Learning streak visualization

🚀 Features
🔹 Onboarding

Two-screen onboarding flow

Skip and Next navigation

Onboarding completion stored using GetStorage

Auto-redirect to Home on next launch

🔹 Home Dashboard

Greeting header with notification icon

Popular Courses (KTET, HST, CUET, LPST, GENERAL PSC)

Active Course card with:

Progress ring

Completed tests

Continue & Shift course buttons

Promo banner

🔹 Course & Video Module

API driven video list

Locked, in-progress, and completed states

Video player screen with:

Play / Pause

Progress

Download icon

Course title

🔹 Learning Streak

Zig-zag streak path UI

Current day highlight

Completed & locked day indicators

“Today’s Topic” card

Data loaded from API

🔌 APIs Used
📌 Video List
https://trogon.info/task/api/video_details.php

📌 Streak
https://trogon.info/task/api/streak.php

🛠 Tech Stack
Technology	Usage
Flutter	UI & App Logic
GetX	State management & Navigation
GetStorage	Onboarding persistence
REST API	Dynamic data
CustomPainter	Streak path drawing
🗂 Project Structure
lib/
├── controllers/
├── models/
├── home/
│   ├── widgets/
├── onboarding/
├── video/
├── streak/
├── app/
│   ├── routes.dart
│   ├── storage.dart

▶ How to Run
flutter pub get
flutter run

📦 Build APK
flutter build apk --release


APK location:

build/app/outputs/flutter-apk/app-release.apk
