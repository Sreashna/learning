

# 📱 Learning App – Flutter Machine Test

A modern **learning application** built using **Flutter + GetX**, developed by converting the provided **Figma design** into a fully functional app with **REST API integration** and **dynamic UI**.

This project demonstrates:

* Pixel-perfect UI from Figma
* GetX state management & navigation
* API-driven learning modules
* Onboarding flow
* Video streaming
* Learning streak visualization

---

## 🚀 Features

### 🔹 Onboarding

* Two-screen onboarding flow
* Skip & Next navigation
* Onboarding completion stored using **GetStorage**
* Auto-redirects to Home after completion

### 🔹 Home Dashboard

* Greeting header with notifications
* Popular Courses (KTET, HST, CUET, LPST, GENERAL PSC)
* Active Course Card

  * Circular progress
  * Completed tests
  * Continue & Shift course buttons
* Promo banner

### 🔹 Course & Video Module

* API-based video list
* Video status: Completed, In-Progress, Locked
* Video player screen with:

  * Play / Pause
  * Progress tracking
  * Download icon
  * Title & description

### 🔹 Learning Streak

* Zig-zag streak path UI
* Completed, current & locked days
* Today’s topic card
* Fully API driven

---

## 🔌 APIs Used

### Video Details

```
https://trogon.info/task/api/video_details.php
```

### Learning Streak

```
https://trogon.info/task/api/streak.php
```

---

## 🛠 Tech Stack

| Technology    | Usage                         |
| ------------- | ----------------------------- |
| Flutter       | UI & App Logic                |
| GetX          | State management & navigation |
| GetStorage    | Onboarding persistence        |
| REST API      | Dynamic data                  |
| CustomPainter | Streak path UI                |

---

## 🗂 Project Structure

```
lib/
├── controllers/
├── models/
├── home/
│   └── widgets/
├── onboarding/
├── video/
├── streak/
├── app/
│   ├── routes.dart
│   └── storage.dart
```

---

## ▶ How to Run

```bash
flutter pub get
flutter run
```

---

## 📦 Build APK

```bash
flutter build apk --release
```

APK location:

```
build/app/outputs/flutter-apk/app-release.apk
```

---

## 📸 Screens Implemented

* Onboarding
* Home Dashboard
* Popular Courses
* Active Course
* Video Player
* Learning Streak Path

---

## 👩‍💻 Developer

**Sreeshna C**
Mobile Developer
GitHub: [https://github.com/Sreashna](https://github.com/Sreashna)


