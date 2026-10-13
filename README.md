# 🕋 Qibla Finder App - Accurate Qibla Direction | Flutter Qibla Compass

A fast, accurate, and free **Qibla Finder app built with Flutter** that shows the exact direction of the **Kaaba (Makkah)** using your phone's compass and GPS location. Works on **Android** and **iOS**.

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-green)
![License](https://img.shields.io/badge/License-MIT-blue)

## ✨ Features
- 🧭 Live compass pointing to the Kaaba
- 📍 Automatic GPS location detection
- 🎯 Accurate Qibla angle and distance to Makkah
- 🌙 Light & Dark mode
- ⚡ Smooth animations, fast and lightweight
- 🔒 No login, no ads, privacy friendly

## 📸 Screenshots

## 📸 Screenshots

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/222ee7c3-73a9-4552-bd07-4bc8b016b926" width="300" alt="Qibla Finder Screenshot 1"/></td>
    <td><img src="https://github.com/user-attachments/assets/9c561a03-37b8-4f63-bb2b-78488d97ee3f" width="300" alt="Qibla Finder Screenshot 2"/></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/111db58d-b048-4188-9c76-93a44eb27d06" width="300" alt="Qibla Finder Screenshot 3"/></td>
    <td><img src="https://github.com/user-attachments/assets/4f45b908-85d6-44fb-8ab4-e98f3b55445b" width="300" alt="Qibla Finder Screenshot 4"/></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/e378345c-7c06-4372-850b-ffbd4d01920a" width="300" alt="Qibla Finder Screenshot 5"/></td>
    <td><img src="https://github.com/user-attachments/assets/927ec445-e2b7-4a5b-955f-634f56bb9cf5" width="300" alt="Qibla Finder Screenshot 6"/></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/f9ff3fd2-3b13-45b1-b08d-bc53d97bd0a0" width="300" alt="Qibla Finder Screenshot 7"/></td>
    <td></td>
  </tr>
</table>

## 🛠 Tech Stack
- **Flutter** & **Dart**
- GetX (state management)
- Geolocator (location)
- Flutter Compass (sensor)

## ⚙️ How It Works
1. App gets your current location using GPS.
2. Calculates the bearing between your location and the Kaaba (21.4225° N, 39.8262° E).
3. Uses the device compass to rotate the needle toward Qibla in real time.

## 🚀 Getting Started

```bash
git clone https://github.com/USERNAME/qibla-finder-app.git
cd qibla-finder-app
flutter pub get
flutter run
```

## 🔐 Permissions
- **Android:** `ACCESS_FINE_LOCATION`
- **iOS:** `NSLocationWhenInUseUsageDescription`

## 📂 Project Structure

lib/
├── controllers/
├── views/
├── services/
├── models/
└── utils/


## 💡 Tips for Best Accuracy
- Keep phone flat and away from magnets or metal.
- Calibrate the compass by moving the phone in a figure-8.
- Enable GPS/location services.

## 🤝 Contributing
Pull requests are welcome. For major changes, please open an issue first.

## 📄 License
MIT License

## 👨‍💻 Developer
**Sohaib Ahmed Farooqi** - [Elyrion Technology](https://github.com/USERNAME)

---
**Keywords:** qibla finder, qibla direction, qibla compass, flutter qibla app, kaaba direction, islamic app, muslim app, prayer direction
