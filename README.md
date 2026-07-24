# GitHub Repository Explorer

A Flutter application for searching and exploring GitHub repositories. This project was developed as a technical assignment for the Generali job interview.

## Features

- **Search Repositories**: Search for public GitHub repositories using keywords.
- **Repository Details**: View detailed information about a repository, including:
  - Name and Owner
  - Star count
  - Description
  - Primary language
- **Favorites Management**: Save repositories to a favorites list for quick access. Persisted locally using `shared_preferences`.
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
- **[shared_preferences](https://pub.dev/packages/shared_preferences)**: Used for local persistence of the favorites list.

## Testing

The project includes basic unit tests located in the `test/` directory.

To run tests:

```bash
flutter test
```

## Technical Decisions & Future Improvements

### 1. How did you handle state management and why?
For the purpose of this assignment, I chose a combination of **`setState`** for local screen states (e.g., loading states, search results) and a **global list** in `storage.dart` for managing favorites.
- **Why?** For an application of this scale, it is the simplest and fastest approach that doesn't require additional dependencies.

### 2. How would you modify the app to work offline?
Currently, favorites are persisted locally using **`shared_preferences`**. For full offline support, I would:
- Implement a more robust local database (e.g., **sqflite** or **Hive**) for large datasets.
- Add caching for search results (Visited Repositories section) so the user can see recent results even without a network connection.
- Add a visual indicator for the connection status.

### 3. How would you handle result pagination?
The GitHub API supports `page` and `per_page` parameters. I would implement pagination as follows:
- Add **"Previous"** and **"Next"** buttons at the bottom and the top of the results list.
- Maintain a `currentPage` variable in the state and display it between the "Previous" and "Next" buttons.
- When a button is pressed, increment or decrement the `currentPage`, trigger a new API request with the updated page parameter, and replace the current results with the new ones.
- Disable the "Previous" button when on the first page and the "Next" button if the last response returned fewer items than expected (indicating the last page).

### 4. Which part of the solution do you consider the most important technical decision?
I consider the **utilization of Dart Records for API responses** to be a key technical decision.
- **Why?** Instead of creating verbose wrapper classes or using untyped `Map` objects, I used Dart 3.0 Records (e.g., `SearchRepositoryResponse`). This allows for type-safe, multiple-return values directly from API calls. It makes the code more expressive and significantly reduces boilerplate when passing both data and status codes from the API layer to the UI, leading to cleaner and more maintainable business logic.
