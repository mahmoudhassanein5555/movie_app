# Home Feature 🏠

## Overview

The Home feature is the main landing screen of the Movie App that showcases different categories of movies including **Recommended Movies**, **Popular Movies**, and **Newly Released Movies**. This feature implements a clean architecture with separation of concerns following the MVVM pattern combined with Clean Architecture principles.

---

## Architecture

The Home feature follows a **three-layer architecture**:

```
┌─────────────────────────────────────┐
│      PRESENTATION LAYER             │
│  (Views, ViewModels, Widgets)       │
├─────────────────────────────────────┤
│        DOMAIN LAYER                 │
│  (Entities, Repositories, UseCases) │
├─────────────────────────────────────┤
│        DATA LAYER                   │
│  (Models, APIs, Repositories)       │
└─────────────────────────────────────┘
```

---

## Directory Structure

```
lib/feature/home/
├── data/
│   ├── api/
│   │   └── home_api.dart                 # API service for home endpoints
│   ├── model/
│   │   └── movie_dto.dart                # Data Transfer Objects (DTOs)
│   └── repository/
│       ├── data_source/
│       │   └── home_data_source_imp.dart # Remote data source implementation
│       └── repo/
│           └── home_repo_imp.dart        # Repository implementation
│
├── domain/
│   ├── entites/
│   │   └── movies_entites.dart           # Business entities
│   ├── repository/
│   │   ├── data_source/
│   │   │   └── home_data_source.dart     # Remote data source contract
│   │   └── repo/
│   │       └── home_repo.dart            # Repository abstract contract
│   └── use_case/
│       ├── recommended_movies_use_case.dart
│       ├── popular_movies_use_case.dart
│       └── releases_movies_use_case.dart
│
└── presentation/
    ├── view/
    │   └── home_screen.dart              # Main home screen widget
    ├── view_model/
    │   ├── home_state.dart               # State definitions for BLoC
    │   ├── popular_cubit/
    │   │   └── home-cubit.dart           # Popular movies state management
    │   ├── recommended_cubit/
    │   │   └── home_recommended_cubit.dart # Recommended movies state management
    │   └── release_cubit/
    │       └── home_release_cubit.dart   # Released movies state management
    └── widgets/
        ├── custom_poster_widget.dart     # Movie poster widget
        └── image_item_widget.dart        # Generic image item widget
```

---

## Key Components

### 📊 Data Layer

#### `home_api.dart`
- Handles HTTP requests to The Movie Database (TMDB) API
- Manages API endpoints for:
  - Recommended movies
  - Popular movies
  - Newly released movies

#### `movie_dto.dart`
- Serializable data transfer objects matching TMDB API response structure
- Contains `MoviesDTO` and `ResultsDTO` classes

#### `home_data_source_imp.dart`
- Implements the remote data source contract
- Calls API endpoints and converts responses to DTOs

#### `home_repo_imp.dart`
- Implements the `HomeRepo` interface
- Handles error mapping and data transformation
- Converts DTOs to domain entities

### 🎯 Domain Layer

#### `movies_entites.dart`
Business logic entities:
- **MoviesEntites**: Wrapper for paginated results
  - `page`: Current page number
  - `results`: List of movie results
  - `totalPages`: Total pages available
  - `totalResults`: Total number of results

- **ResultsEntity**: Individual movie information
  - `id`: Unique movie identifier
  - `title`: Movie title
  - `posterPath`: Poster image URL
  - `backdropPath`: Backdrop image URL
  - `overview`: Movie description
  - `releaseDate`: Release date
  - `voteAverage`: Rating score
  - `voteCount`: Number of ratings
  - `genreIds`: Associated genres
  - And more metadata fields

#### Use Cases
Three specialized use cases handle different movie categories:

1. **RecommendedMoviesUseCase**: Fetches recommended movies
2. **PopularMoviesUseCase**: Fetches currently popular movies
3. **ReleasesMoviesUseCase**: Fetches newly released movies

Each use case:
- Takes the repository as a dependency (Dependency Injection)
- Implements a `call()` method for execution
- Returns `Future<ApiResult<MoviesEntites>>`

#### `home_repo.dart`
Abstract repository interface defining contracts:
```dart
abstract class HomeRepo {
  Future<ApiResult<MoviesEntites>> getRecommendedMovies();
  Future<ApiResult<MoviesEntites>> getPopularMovies();
  Future<ApiResult<MoviesEntites>> getReleasesMovies();
}
```

### 🎨 Presentation Layer

#### `home_screen.dart`
Main UI screen featuring:
- **State Management**: Uses three separate Cubits for independent state management
  - `RecommendedCubit`: Manages recommended movies state
  - `PopularCubit`: Manages popular movies state
  - `ReleasesCubit`: Manages releases movies state

- **UI Structure**:
  - SafeArea with scrollable content
  - Horizontal scrollable movie lists for each category
  - Loading states with shimmer skeleton effect
  - Error handling
  - Success states with movie grid/carousel display

- **Loading State**: Shows `CircularProgressIndicator` while fetching
- **Error State**: Displays error messages
- **Success State**: Renders movie lists with custom widgets

#### Widgets

**custom_poster_widget.dart**
- Displays individual movie posters
- Handles image loading and error states
- Shows movie metadata (rating, title, release date)

**image_item_widget.dart**
- Generic image item widget for movie cards
- Reusable component for different list types
- Handles image caching and placeholder

---

## State Management

The feature uses **Flutter BLoC (Cubit)** pattern for state management:

### States (home_state.dart)
- **HomeLoading**: Initial or loading state
- **HomeSuccess**: Data loaded successfully
- **HomeError**: Error occurred during data fetch

### Intents
- **RecommendedMoviesIntent**: Triggers recommended movies fetch
- **PopularMoviesIntent**: Triggers popular movies fetch
- **ReleasesMoviesIntent**: Triggers releases movies fetch

### Data Flow
```
UI (HomeScreen)
  ↓
Cubit (StateManagement)
  ↓
UseCase (Business Logic)
  ↓
Repository (Data Abstraction)
  ↓
DataSource (Remote API)
  ↓
HomeAPI (HTTP Requests)
  ↓
TMDB API
```

---

## Dependencies

### External Packages Used:
- **flutter_bloc**: State management
- **skeletonizer**: Loading skeleton UI effect
- **dio**: HTTP client for API requests

### Injected Repositories:
- `HomeRepo`: Repository for data access
- All use cases are injected with repository via constructor

---

## API Integration

The feature integrates with **The Movie Database (TMDB) API**:

### Endpoints Used:
1. `/movie/recommended` - Get recommended movies
2. `/movie/popular` - Get popular movies  
3. `/movie/upcoming` - Get newly released movies

### Response Format:
```json
{
  "page": 1,
  "results": [
    {
      "id": 12345,
      "title": "Movie Title",
      "poster_path": "/path/to/poster.jpg",
      "release_date": "2024-01-01",
      "vote_average": 8.5,
      "overview": "Movie description..."
    }
  ],
  "total_pages": 50,
  "total_results": 1000
}
```

---

## Features

✅ **Three Movie Categories**: Display recommended, popular, and newly released movies

✅ **State Management**: Independent state for each category using separate Cubits

✅ **Loading States**: Skeleton loading effect while fetching data

✅ **Error Handling**: Graceful error display with retry capability

✅ **Responsive Design**: Horizontal scrollable lists with custom spacing and sizing

✅ **Image Caching**: Efficient image loading and caching

✅ **Clean Architecture**: Separation of concerns with clear dependencies

✅ **Dependency Injection**: Constructor-based dependency injection for testability

---

## Usage Example

```dart
// Initialize Cubits
final recommendedCubit = RecommendedCubit(injectRecommendedMoviesUseCase());

// Fetch recommended movies
recommendedCubit.intent(RecommendedMoviesIntent());

// Listen to state changes
BlocBuilder<RecommendedCubit, HomeState>(
  bloc: recommendedCubit,
  builder: (context, state) {
    if (state is HomeLoading) {
      return LoadingWidget();
    } else if (state is HomeSuccess) {
      return MovieListWidget(movies: state.data.results);
    } else if (state is HomeError) {
      return ErrorWidget(message: state.message);
    }
  },
);
```

---

## Error Handling

The feature uses `ApiResult<T>` wrapper for consistent error handling:
- **Success**: Contains the data
- **Failure**: Contains error message and exception details

Errors are gracefully displayed in the UI with user-friendly messages.

---

## Testing Points

### Unit Tests:
- Use case execution
- Repository data transformation
- API response mapping

### Widget Tests:
- HomeScreen rendering
- BLoC state transitions
- UI updates based on state changes

### Integration Tests:
- API integration with TMDB
- Full data flow from API to UI

---

## Future Enhancements

🔄 Add pagination for infinite scrolling

🔐 Implement caching strategy

🎯 Add filtering and sorting options

⭐ Implement rating/review system

📱 Add offline support

🔍 Enhance search within categories

---

## Notes

- All API keys should be stored in constants/api_constant.dart
- Image loading uses network caching for performance
- The feature respects app theme colors and sizing utilities
- Proper disposal of Cubits prevents memory leaks

---

## Related Features

- [Details Feature](../details/README.md) - Movie detail screen
- [Search Feature](../search/README.md) - Movie search
- [Watch List Feature](../watch_list/README.md) - Saved movies

