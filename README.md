# To-Do App

A simple cross-platform to-do application built with **Flutter** and **PostgreSQL**, demonstrating full CRUD task management backed by a real database.

---

## UI Preview

<p align="center">
  <a href="ui%20pics%20and%20vids/todo-app-preview.mp4" target="_blank">
    <img src="ui%20pics%20and%20vids/demo-preview.gif" alt="To-Do app demo" width="80%">
  </a>
</p>
<p align="center"><em>Auto-playing preview - click to watch the full-quality video</em></p>

| List tasks | Add a task | Delete a task |
| :---: | :---: | :---: |
| ![Task list](ui%20pics%20and%20vids/list.png) | ![Add task dialog](ui%20pics%20and%20vids/add_task.png) | ![Delete task via slide action](ui%20pics%20and%20vids/delete_task.png) |

---

## About

This project is a lightweight to-do app that shows how to connect a Flutter mobile app to a **PostgreSQL** database using the [`postgres`](https://pub.dev/packages/postgres) package. Users can view their tasks, add new ones through a dialog, mark them complete, and delete them — all persisted server-side rather than locally on the device.

## Features

- View all saved tasks in a scrollable list
- Add new tasks via a dialog with Save / Cancel buttons
- Mark tasks as complete or incomplete with a checkbox
- Delete tasks using swipe-to-delete ([flutter_slidable](https://pub.dev/packages/flutter_slidable))
- All data persisted in PostgreSQL (`tasks` table created automatically if missing)
- Empty-state message ("No tasks yet") when there are no tasks

## Tech Stack

- **Flutter** (Material Design) — UI framework
- **Dart** — language
- [`postgres` ^2.6.2](https://pub.dev/packages/postgres) — PostgreSQL client
- [`flutter_slidable` ^4.0.0](https://pub.dev/packages/flutter_slidable) — swipe actions on list tiles
- **PostgreSQL** — database
- `flutter_lints` — static analysis

## Requirements

- **Flutter SDK ≥ 3.8.1** (Dart SDK constraint: `^3.8.1`)
- A running **PostgreSQL** server reachable from your device/emulator
- Android SDK / emulator (or another target platform) for running the app

## Getting Started

### 1. Clone the repository

```bash
git clone <repository-url>
cd to-do-app
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Configure the database connection

Database credentials are kept out of version control. Copy the template and fill in your own values:

```bash
cp lib/configs/config.example.dart lib/configs/config.dart
```

Then edit `lib/configs/config.dart`:

```dart
const dbHost = "10.0.2.2";   // 10.0.2.2 = host machine from an Android emulator; use localhost for desktop/web
const int dbPort = 5432;
const String dbName = "<your-database-name>";
const String dbUser = "<your-username>";
const String dbPassword = "<your-password>";
```

Create the database if it does not exist:

```sql
CREATE DATABASE your_database_name;
```

The `tasks` table is created automatically on first launch.

### 4. Run the app

```bash
flutter run
```

Other useful commands:

```bash
flutter run -d <device-id>   # run on a specific device
flutter analyze              # static analysis
flutter test                 # run tests
flutter build apk            # build an APK (currently signed with debug keys)
```

## Usage

1. Launch the app — existing tasks are loaded from the database.
2. Tap the **+** floating button to open the add-task dialog, enter a task, then tap **Save**.
3. Check the checkbox on a tile to mark a task complete.
4. Swipe a tile to the left and tap the delete icon to remove it.

## Project Structure

```
lib/
├── main.dart               # App entry point and theme
├── configs/
│   ├── config.example.dart  # Template for database connection settings (copy to config.dart)
│   └── database.dart        # DBHelper: connect + CRUD queries
├── pages/
│   └── home_page.dart      # Main screen: task list, FAB, state management
└── util/
    ├── dialog.dart         # Add-task dialog
    ├── add_and_cancel.dart # Save/Cancel buttons
    └── to_do_tile.dart     # Individual task tile with checkbox & slide-to-delete
```
