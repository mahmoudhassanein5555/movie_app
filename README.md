Movie Application:
A comprehensive Flutter application for movie enthusiasts, designed to provide a seamless experience in discovering, searching, and managing a personal watchlist. The project is built with a focus on high-quality UI/UX and professional software engineering standards.

Demo:
-Below is a demonstration of the News App in action, showcasing the category navigation and theme switching

https://github.com/user-attachments/assets/4b11d6fc-e65d-4269-927d-d0c2d2e7e6f4

Features:
- **Movie Discovery: Browse curated lists of releases, popular movies, and personalized recommendations.
- **Advanced Search: Find movies by title with a dedicated search interface, including "no results" handling.
- **Detailed Movie Insights: Comprehensive details for each movie, including synopsis, ratings, runtime, and genre.
- **Watchlist Management: Ability to add or remove movies from a personal watchlist for future viewing.
- **Persistent State: Handling empty states (e.g., Empty Watchlist) to ensure a consistent user experience.
- **Dynamic UI: Includes a dedicated Splash Screen and themed navigation.

Technologies Used:
- Framework: Flutter
- Language: Dart
- State Management: Bloc/Cubit
- Architecture: Clean Architecture
- Dependency Injection
- Networking: http
- Local Storage: Hive (for Watchlist persistence)

Architecture and Design Patterns:
The application follows a strict Clean Architecture approach, ensuring the separation of concerns between the UI, Business Logic, and Data sources. 
- SOLID Principles: Applied to ensure the codebase is scalable and easy to maintain.
- Repository Pattern: Used to decouple the domain layer from data sources.
- Feature-first Modularization: Each feature (Home, Search, Watchlist, Details) is self-contained.

Project Structure:

lib/
├── core/                        . Global themes, constants, and shared utilities
├── features/
│   ├── home/                    . Discovery feature (Releases, Popular, Recommended)
│   ├── search/                  . Search and filtering logic
│   ├── watchlist/               . Local movie persistence and management
│   └── movie_details/           . Detailed view and similar movies logic
│       ├── data/                . API sources, Models, and Repository implementations
│       ├── domain/              . Entities, Repository interfaces, and Use Cases
│       └── presentation/        . UI Views, ViewModels/Cubits, and Widgets  
└── main.dart                    . Application entry point and Provider setup           
