# Priority Assist

A Flutter mobile application for managing job requests and assignments with real-time notifications. Built with Riverpod for state management and featuring Firebase Cloud Messaging for push notifications.

## Features

### 📱 Core Functionality

- **Job Request Management** - Create, view, and manage job requests
- **Queue Management** - Organize and prioritize job queue
- **Progress Tracking** - Monitor job progress with countdown timers
- **Employee Assignment** - Request and assign jobs to employees

###  Notifications

- **Push Notifications** - Receive real-time job alerts flutter_local_notifications: ^20.1.0
- **Background Notifications** - Notifications work even when app is killed
- **Tap Navigation** - Automatically navigate to relevant screens when notification is tapped
- **Local Notifications** - Fallback support for scheduled notifications

### 🎨 UI/UX

- **Responsive Design** - Support for multiple screen sizes using ScreenUtil
- **Dark/Light Themes** - Theme support with automatic system detection
- **Circular Countdown Timer** - Visual job progress indicators

## Tech Stack

### Framework & State Management

- **Flutter** - Cross-platform mobile development
- **Riverpod** - Reactive state management (v2.6.1)
- **Go Router** - Type-safe routing

### Notifications & Backend


- **Flutter Local Notifications** - Local notification handling
- **Flutter Timezone** - Timezone-aware scheduling

### Data & Storage

- **Hive** - Fast, local key-value database
- **Timezone** - Timezone management for scheduling

### UI Utilities

- **Flutter ScreenUtil** - Responsive design scaling
- **Cupertino Icons** - iOS-style icons


