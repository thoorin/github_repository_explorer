# GitHub Repository Explorer

A Flutter application for searching and exploring GitHub repositories. This project was developed as a technical assignment for the Generali job interview.

## Features

- **Search Repositories**: Search for public GitHub repositories using keywords.
- **Repository Details**: View detailed information about a repository, including:
  - Name and Owner
  - Star count
  - Description
  - Primary language
- **Favorites Management**: Save repositories to a favorites list for quick access. (Note: In-memory storage is used for this version).
- **Navigation**: Simple and intuitive navigation between Search and Favorites screens.

## Project Structure

The project follows a modular structure:

- **`lib/api/`**: Contains GitHub API integration logic, including models, responses, and utility functions for parsing JSON data.
- **`lib/view/`**: Contains the UI implementation:
  - **`components/`**: Reusable UI widgets like `RepositoryCard` and `NavigationRow`.
  - **`search_page/`**: The main search interface.
  - **`favorite_page/`**: Interface for viewing saved repositories.
  - **`detail_page/`**: Detailed view for a single repository.
- **`lib/storage.dart`**: Manages the in-memory state for the favorites list.
- **`lib/main.dart`**: The entry point of the application.

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed on your machine.
- An Android/iOS emulator or a physical device for testing.

### Installation

1.  Clone the repository (or download the source code).
2.  Navigate to the project directory:
    ```bash
    cd github_repository_explorer
    ```
3.  Install dependencies:
    ```bash
    flutter pub get
    ```

### Running the App

To run the application in debug mode:

```bash
flutter run
```

## Dependencies

- **[http](https://pub.dev/packages/http)**: Used for making asynchronous requests to the GitHub Search API.

## Testing

The project includes basic unit tests located in the `test/` directory.

To run tests:

```bash
flutter test
```
