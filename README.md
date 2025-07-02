# 🏥 Qflow - Digital Healthcare Management App

**Qflow** is a comprehensive digital healthcare management application built with Flutter that revolutionizes the way patients interact with healthcare services. The app provides seamless appointment booking, prescription management, doctor consultations, and patient feedback systems, all powered by Firebase for real-time synchronization and secure data management.

---

## ✨ Key Features

### 🔐 Secure Authentication
- **Email & Password** authentication with Firebase
- **User Registration** with comprehensive profile creation
- **Auto-login** functionality with persistent sessions

### 👨‍⚕️ Doctor & Appointment Management
- **Browse Available Doctors** 
- **Smart Appointment Booking** with date and time selection
- **Symptom & Details Tracking** for better consultation preparation

### 📋 Prescription & Medical Records
- **Digital Prescription Management** 
- **Prescription History** with detailed medication records
- **Medical Documentation** storage and retrieval
- **Consultation Notes** and treatment history

### 🏠 Comprehensive Dashboard
- **Upcoming Appointments** overview
- **Medical History** at a glance
- **Quick Actions** for common tasks
- **Health Status** monitoring

### 💬 Patient Feedback System
- **Rate & Review** doctors and services
- **Feedback Collection** for service improvement

### 📱 Push Notifications
- **Appointment Reminders** with Firebase Messaging

---

## 🏗️ Architecture & Tech Stack

### 🚀 Flutter Framework
- **Cross-platform** mobile app development
- **Material Design 3** UI components with custom theming
- **Responsive Design** using ScreenUtil for multiple screen sizes
- **State Management** using BLoC pattern for predictable app state

### 🧠 Clean Architecture Implementation

```plaintext
lib/
├── Application/              # Business Logic Layer (BLoCs & Cubits)
│   ├── booking/              # Appointment booking logic
│   ├── doctor/               # Doctor management and listing
│   ├── signin/               # User authentication
│   ├── signup/               # User registration
│   ├── home/                 # Dashboard and home screen logic
│   ├── profile/              # User profile management
│   ├── edit_profile/         # Profile editing functionality
│   ├── prescription/         # Prescription management
│   ├── Feedback/             # Patient feedback system
│   └── loggedin/             # Session management
│
├── Core/
│   └── injectable/           # Dependency injection with GetIt
│
├── Domain/                   # Business Models & Interfaces
│   ├── bookings/             # Booking models and services
│   ├── doctor/               # Doctor models and appointment logic
│   ├── SignIn/               # Authentication models
│   ├── SignUp/               # Registration models
│   ├── Profile/              # User profile models
│   ├── prescription/         # Prescription and medical records
│   ├── feedback/             # Feedback system models
│   ├── TokenManager/         # Authentication token management
│   └── Failure/              # Error handling and failure models
│
├── Infrastructure/           # Data Layer (Repository Implementations)
│   ├── booking/              # Appointment booking data operations
│   ├── doctor/               # Doctor data management
│   ├── SignIn/               # Authentication with backend
│   ├── SignUp/               # User registration data handling
│   ├── Profile/              # Profile data management
│   ├── presciption/          # Prescription data operations
│   ├── feedback/             # Feedback data handling
│   └── TokenManager/         # Token storage and management
│
├── Presentation/             # UI Layer
│   ├── Auth/                 # Authentication screens
│   │   ├── sign_in.dart      # Login interface
│   │   ├── sign_up.dart      # Registration interface
│   │   └── notification.dart # Notification setup
│   ├── Home/                 # Dashboard and main screens
│   │   ├── home.dart         # Main dashboard
│   │   ├── mainscreen.dart   # Navigation wrapper
│   │   └── prescripiton.dart # Prescription viewer
│   ├── Member/               # Patient-specific screens
│   │   ├── booking.dart      # Appointment booking
│   │   ├── payment.dart      # Payment processing
│   │   └── success.dart      # Success confirmations
│   ├── Profile/              # User profile management
│   └── common/               # Shared UI components
│
├── constants/                # App constants and configurations
├── firebase_options.dart     # Firebase configuration
└── main.dart                # App entry point
```

### 🔧 Key Technologies

**State Management:**
- **BLoC/Cubit** pattern for reactive programming
- **Flutter BLoC** library for state management
- **Freezed** for immutable data classes

**Backend & Cloud:**
- **Firebase Core** for backend infrastructure
- **Firebase Messaging** for push notifications
- **RESTful API** integration with Dio HTTP client
- **Shared Preferences** for local data persistence

**UI & User Experience:**
- **Flutter ScreenUtil** for responsive design
- **Google Fonts** for beautiful typography
- **Lottie** animations for engaging user interactions
- **Shimmer** effects for loading states
- **Custom Material Design** themes

**Dependency Injection:**
- **GetIt** service locator pattern
- **Injectable** for automatic dependency registration
- **Modular architecture** for better testability

**Additional Features:**
- **Intl** for internationalization support
- **Dartz** for functional programming patterns
- **Error Handling** with comprehensive failure management

---
## Usage Video

https://github.com/user-attachments/assets/e252eecd-34d5-415b-ad27-bb34344a2447

## 🚀 Getting Started

### Prerequisites
- **Flutter SDK** (>= 3.6.1)
- **Dart SDK** (>= 3.6.1)
- **Android Studio** or **VS Code** with Flutter extensions
- **Firebase account** for backend services

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd Qflow
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code files**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Firebase Setup**
   - Create a new Firebase project
   - Enable Authentication and Firestore
   - Set up Firebase Messaging for notifications
   - Download and configure `google-services.json` for Android
   - Update Firebase configuration in `firebase_options.dart`

5. **Backend Configuration**
   - Update API base URL in `constants/const.dart`
   - Configure authentication endpoints
   - Set up notification permissions

6. **Run the app**
   ```bash
   flutter run
   ```

### 🔧 Configuration

**Required Permissions:**
- Internet access for API communication
- Notification permissions for appointment alerts
- Storage permissions for medical records

**Font Assets:**
- MonumentExtended for headings
- TestSohne for body text
- CabinetGrotesk for UI elements

---

## 📱 App Highlights

### Smart Healthcare Features
- **Digital Prescription Management**: Paperless prescription handling
- **Comprehensive Medical History**: Complete patient record management
- **Multi-device Synchronization**: Access from anywhere, anytime

### User Experience Excellence
- **Intuitive Interface**: Clean, modern Material Design
- **Responsive Design**: Optimized for all screen sizes
- **Smooth Animations**: Engaging Lottie animations
- **Loading States**: Shimmer effects for better UX
- **Error Handling**: Graceful error management with user-friendly messages

### Healthcare-Specific Innovations
- **Symptom Tracking**: Detailed symptom logging before appointments
- **Appointment History**: Complete consultation history
- **Doctor Ratings**: Patient feedback system

---

## 🔐 Security & Privacy

- **API Security**: Secure RESTful API with proper error handling

---

## 📊 Core Modules

### Authentication System
- **User Registration**: Complete profile creation with medical details
- **Secure Login**: Email/password authentication with session management

### Appointment Management

- **Confirmation System**: Automated booking confirmations

### Medical Records
- **Prescription Management**: Digital prescription storage and access
- **Medical History**: Comprehensive health record management
- **Document Storage**: Secure medical document handling
- **Data Synchronization**: Real-time data updates across devices

### Communication & Feedback
- **Patient Feedback**: Rating and review system for doctors
- **Notification System**: Push notifications for important updates

---
**Ready to test the app?**
👉 [Download APK from Google Drive](https://drive.google.com/file/d/15nVUYoJMO8O4K4NYsCl2f04z_IcBJvDW/view?usp=drive_link)


## 🎨 UI/UX Design

### Design Philosophy
- **Patient-Centric Design**: UI optimized for healthcare scenarios
- **Accessibility First**: Designed for users of all ages and abilities
- **Trust & Security**: Visual design that instills confidence
- **Clarity & Simplicity**: Clean, uncluttered interface

### Color Scheme & Branding
- **Medical Blue**: Professional healthcare aesthetic
- **Clean White**: Sterile, trustworthy appearance
- **Accent Colors**: Strategic use of colors for important actions
- **Typography**: Medical-grade readability with custom fonts

---

## 🔮 Future Roadmap

### Upcoming Features
- **Telemedicine Integration**: Video consultation capabilities
- **AI Health Assistant**: Intelligent health recommendations
- **Wearable Device Support**: Integration with fitness trackers
- **Lab Results Integration**: Direct lab report access
- **Family Account Management**: Multi-user family profiles

### Technical Enhancements
- **Offline Mode**: Core functionality without internet
- **Advanced Analytics**: Health trend analysis
- **Multi-language Support**: Localization for multiple languages
- **Voice Commands**: Accessibility through voice interaction
- **Biometric Security**: Fingerprint and face recognition

### Healthcare Innovations
- **Emergency Services**: Quick access to emergency contacts
- **Medicine Delivery**: Integration with pharmacy services
- **Health Insurance**: Insurance verification and claims
- **Wellness Tracking**: Comprehensive health monitoring
- **Chronic Disease Management**: Specialized care for chronic conditions

---

## 🤝 Contributing

We welcome contributions from the healthcare and Flutter communities! Please feel free to submit issues, feature requests, or pull requests.

### Development Setup
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Code Standards
- Follow Flutter/Dart coding conventions
- Maintain clean architecture principles
- Write comprehensive tests for new features
- Document all public APIs
- Ensure HIPAA compliance for health data

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 👨‍💻 Developer

Developed with ❤️ for better healthcare access

For questions, support, or collaboration opportunities, please open an issue on GitHub.

---

## 🏥 Healthcare Impact

**Qflow App** is more than just a mobile application—it's a step toward democratizing healthcare access, improving patient outcomes, and creating a seamless bridge between patients and healthcare providers.

### Our Mission
- **Accessible Healthcare**: Making quality healthcare accessible to everyone
- **Digital Transformation**: Modernizing healthcare through technology
- **Patient Empowerment**: Giving patients control over their health journey
- **Provider Efficiency**: Streamlining healthcare operations for providers

---

**Ready to transform healthcare? Download and experience the future of digital healthcare management! 🚀**
