# API Endpoints Documentation

هذا الملف يوضح تفاصيل جميع الـ API Endpoints المستخدمة في تطبيق Movie App

---

## 📍 Base URL

```
https://api.themoviedb.org
```

**API Provider:** The Movie Database (TMDB)  
**Authentication:** API Key based authentication  
**Response Format:** JSON

---

## Endpoint 1️⃣ - Top Rated Movies (الأفلام المقيمة الأعلى / Recommended)

### 📌 معلومات الـ Endpoint

| المعلومة | القيمة |
|---------|--------|
| **اسم الـ Endpoint** | Top Rated Movies |
| **الوصف** | جلب قائمة الأفلام الأعلى تقييماً |
| **HTTP Method** | `GET` |
| **Full URL** | `https://api.themoviedb.org/3/movie/top_rated` |
| **Path** | `/3/movie/top_rated` |

### 🔑 Required Parameters

| المعامل | النوع | الوصف | مثال |
|--------|-------|-------|------|
| `api_key` | String | مفتاح التطبيق للتحقق من الهوية | `9d7f94be913eddf2...` |

### 📤 Optional Parameters (في الـ TMDB API)

| المعامل | النوع | الوصف | القيم الافتراضية |
|--------|-------|-------|-----------------|
| `page` | Integer | رقم الصفحة للنتائج المتعددة | `1` |
| `language` | String | لغة البيانات المسترجعة | `en-US` |

### ✅ Response Structure

**Status Code:** `200 OK`

```json
{
  "page": 1,
  "results": [
    {
      "id": 278,
      "title": "The Shawshank Redemption",
      "poster_path": "/q6725aR8Zs4IwWvn0ff4d3CIub1.jpg",
      "backdrop_path": "/tYHqdyRY7n8tHx9FRK5nzk2sTM1.jpg",
      "overview": "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne is sentenced to life imprisonment at the Shawshank penitentiary...",
      "release_date": "1994-09-23",
      "genre_ids": [18, 80],
      "adult": false,
      "original_language": "en",
      "original_title": "The Shawshank Redemption",
      "popularity": 96.457,
      "vote_average": 8.7,
      "vote_count": 28563,
      "video": false
    },
    // ... more movies
  ],
  "total_pages": 70,
  "total_results": 1400
}
```

### 📊 Response Fields Explanation

| الحقل | النوع | الوصف |
|-------|-------|-------|
| `page` | Integer | رقم الصفحة الحالية |
| `results` | Array | مصفوفة الأفلام |
| `results.id` | Integer | معرف الفيلم الفريد |
| `results.title` | String | اسم الفيلم |
| `results.poster_path` | String | مسار صورة البوستر |
| `results.backdrop_path` | String | مسار صورة الخلفية |
| `results.overview` | String | ملخص الفيلم |
| `results.release_date` | String | تاريخ الإفراج (YYYY-MM-DD) |
| `results.vote_average` | Float | متوسط التقييم (0-10) |
| `results.vote_count` | Integer | عدد التقييمات |
| `results.genre_ids` | Array | معرفات الأنواع |
| `results.popularity` | Float | درجة الشهرة |
| `total_pages` | Integer | إجمالي عدد الصفحات |
| `total_results` | Integer | إجمالي عدد النتائج |

### 🔴 Error Responses

**Status Code:** `401 Unauthorized`
```json
{
  "status_code": 401,
  "status_message": "Invalid API key: you must be granted a valid key."
}
```

**Status Code:** `404 Not Found`
```json
{
  "status_code": 404,
  "status_message": "The resource you requested could not be found."
}
```

### 💻 Implementation (في المشروع)

```dart
Future<ApiResult<MoviesDto>> getRecommendedMovies() async {
  try {
    Uri url = Uri.https(
      MoviesApiConstants.baseUrl,
      MoviesApiConstants.topRatedMoviesPath,
      {"api_key": MoviesApiConstants.apiKey},
    );
    var response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = jsonDecode(response.body);
      MoviesDto moviesApiModel = MoviesDto.fromJson(json);
      return ApiSuccess<MoviesDto>(moviesApiModel);
    } else {
      return ApiError<MoviesDto>("Server Error: ${response.statusCode}");
    }
  } catch (e) {
    return ApiError<MoviesDto>(e.toString());
  }
}
```

### 📱 استخدام الـ Endpoint

```dart
// في HomeScreen
RecommendedCubit _homeCubit = RecommendedCubit(injectRecommendedMoviesUseCase());
_homeCubit.intent(RecommendedMoviesIntent());

// سيتم جلب البيانات وعرضها في UI
```

### ⚡ Performance Notes

- النتائج مرتبة حسب التقييم تنازلياً
- تدعم الترجمة إلى لغات متعددة
- النتائج تتاح مع صور عالية الجودة

---

## Endpoint 2️⃣ - Popular Movies (الأفلام الشهيرة)

### 📌 معلومات الـ Endpoint

| المعلومة | القيمة |
|---------|--------|
| **اسم الـ Endpoint** | Popular Movies |
| **الوصف** | جلب قائمة الأفلام الأكثر شهرة حالياً |
| **HTTP Method** | `GET` |
| **Full URL** | `https://api.themoviedb.org/3/movie/popular` |
| **Path** | `/3/movie/popular` |

### 🔑 Required Parameters

| المعامل | النوع | الوصف | مثال |
|--------|-------|-------|------|
| `api_key` | String | مفتاح التطبيق | `9d7f94be913eddf2...` |

### 📤 Optional Parameters

| المعامل | النوع | الوصف | الافتراضي |
|--------|-------|-------|-----------|
| `page` | Integer | رقم الصفحة | `1` |
| `language` | String | لغة النتائج | `en-US` |

### ✅ Response Structure

**Status Code:** `200 OK`

```json
{
  "page": 1,
  "results": [
    {
      "id": 912649,
      "title": "Dune: Part Two",
      "poster_path": "/n3eRh0YdNgXQZ1N6I0bE8Sf6ULX.jpg",
      "backdrop_path": "/x6DFlvH9wClg6EH7Z8I0eBUbvuV.jpg",
      "overview": "Paul Atreides, now hiding on the fringed desert planet Arrakis after the function of his royal family, must search for his companion Chani and avenge the destruction of his House.",
      "release_date": "2024-02-28",
      "genre_ids": [12, 28, 878],
      "adult": false,
      "original_language": "en",
      "original_title": "Dune: Part Two",
      "popularity": 1234.56,
      "vote_average": 8.5,
      "vote_count": 5432,
      "video": false
    },
    // ... more movies
  ],
  "total_pages": 500,
  "total_results": 10000
}
```

### 📊 Response Fields

| الحقل | النوع | الوصف |
|-------|-------|-------|
| `page` | Integer | رقم الصفحة الحالية |
| `results` | Array | مصفوفة الأفلام الشهيرة |
| `results.popularity` | Float | درجة الشهرة (الأفلام الأكثر شهرة تأتي أولاً) |
| `vote_average` | Float | متوسط التقييم |
| `vote_count` | Integer | عدد الأشخاص الذين قيّموا الفيلم |
| `total_pages` | Integer | عدد صفحات النتائج |
| `total_results` | Integer | إجمالي عدد الأفلام الشهيرة |

### 🟡 الفرق عن Top Rated

| معيار | Top Rated | Popular |
|------|-----------|---------|
| **معيار الترتيب** | التقييم العالي | الشهرة/الاهتمام الحالي |
| **الاستخدام** | الأفلام الجيدة من التاريخ | أفلام تكتسب اهتماماً الآن |
| **التحديث** | بطيء | متكرر (يومي/ساعي) |
| **الجمهور** | من يبحث عن الأفلام الجيدة | من يبحث عما هو جديد |

### 💻 Implementation

```dart
Future<ApiResult<MoviesDto>> getPopularMovies() async {
  try {
    Uri url = Uri.https(
      MoviesApiConstants.baseUrl,
      MoviesApiConstants.popularMoviesPath,
      {"api_key": MoviesApiConstants.apiKey},
    );
    var response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = jsonDecode(response.body);
      MoviesDto moviesApiModel = MoviesDto.fromJson(json);
      return ApiSuccess<MoviesDto>(moviesApiModel);
    } else {
      return ApiError<MoviesDto>("Server Error: ${response.statusCode}");
    }
  } catch (e) {
    return ApiError<MoviesDto>(e.toString());
  }
}
```

### 📱 استخدام الـ Endpoint

```dart
// في HomeScreen
PopularCubit _popularCubit = PopularCubit(injectPopularMoviesUseCase());
_popularCubit.intent(PopularMoviesIntent());

// سيتم عرض الأفلام الشهيرة حالياً
```

### ⚡ Use Cases

- عرض الأفلام الشهيرة حالياً
- توصيات الأفلام الشهيرة
- المحتوى الموصى به على الصفحة الرئيسية
- الأفلام التي يراقبها الكثيرون

---

## Endpoint 3️⃣ - Upcoming Movies (الأفلام القادمة/الإصدارات الجديدة)

### 📌 معلومات الـ Endpoint

| المعلومة | القيمة |
|---------|--------|
| **اسم الـ Endpoint** | Upcoming Movies |
| **الوصف** | جلب قائمة الأفلام التي سيتم إطلاقها قريباً |
| **HTTP Method** | `GET` |
| **Full URL** | `https://api.themoviedb.org/3/movie/upcoming` |
| **Path** | `/3/movie/upcoming` |

### 🔑 Required Parameters

| المعامل | النوع | الوصف | مثال |
|--------|-------|-------|------|
| `api_key` | String | مفتاح التطبيق | `9d7f94be913eddf2...` |

### 📤 Optional Parameters

| المعامل | النوع | الوصف | الافتراضي |
|--------|-------|-------|-----------|
| `page` | Integer | رقم الصفحة | `1` |
| `region` | String | المنطقة الجغرافية | `US` |
| `language` | String | لغة النتائج | `en-US` |

### ✅ Response Structure

**Status Code:** `200 OK`

```json
{
  "page": 1,
  "results": [
    {
      "id": 1001607,
      "title": "The Brutalist",
      "poster_path": "/k3crh4uWIqyNQo9BgSUSv4ssKSN.jpg",
      "backdrop_path": "/vOObOq9bXzPvzI7gH0FkGjOy8uI.jpg",
      "overview": "The Brutalist is a drama film that chronicles the life of an ambitious architect and his pursuit of the American Dream in post-war America.",
      "release_date": "2024-06-15",
      "genre_ids": [18],
      "adult": false,
      "original_language": "en",
      "original_title": "The Brutalist",
      "popularity": 456.78,
      "vote_average": 0,
      "vote_count": 0,
      "video": false
    },
    // ... more upcoming movies
  ],
  "dates": {
    "maximum": "2024-12-31",
    "minimum": "2024-06-01"
  },
  "total_pages": 80,
  "total_results": 1600
}
```

### 📊 Response Fields

| الحقل | النوع | الوصف |
|-------|-------|-------|
| `page` | Integer | رقم الصفحة الحالية |
| `results` | Array | مصفوفة الأفلام القادمة |
| `results.release_date` | String | تاريخ الإطلاق المتوقع |
| `vote_average` | Float | متوسط التقييم (قد يكون 0 للأفلام الجديدة) |
| `vote_count` | Integer | عدد التقييمات (غالباً 0) |
| `dates.minimum` | String | أقدم تاريخ إطلاق في الصفحة |
| `dates.maximum` | String | أحدث تاريخ إطلاق في الصفحة |
| `total_pages` | Integer | عدد صفحات النتائج |
| `total_results` | Integer | إجمالي الأفلام القادمة |

### 🎬 خصائص الأفلام القادمة

- **التقييمات قد تكون صفر** - لأن الفيلم لم يُطلق بعد
- **تاريخ الإطلاق مؤكد** - تاريخ الإطلاق المتوقع معروف
- **الترتيب زمني** - مرتبة حسب تاريخ الإطلاق
- **المعلومات جزئية** - قد تكون معلومات الفيلم ناقصة قبل الإطلاق

### 💻 Implementation

```dart
Future<ApiResult<MoviesDto>> getReleasesMovies() async {
  try {
    Uri url = Uri.https(
      MoviesApiConstants.baseUrl,
      MoviesApiConstants.upcomingMoviesPath,
      {"api_key": MoviesApiConstants.apiKey},
    );

    var response = await http.get(url);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = jsonDecode(response.body);
      MoviesDto moviesApiModel = MoviesDto.fromJson(json);
      return ApiSuccess<MoviesDto>(moviesApiModel);
    } else {
      return ApiError<MoviesDto>("Server Error: ${response.statusCode}");
    }
  } catch (e) {
    return ApiError<MoviesDto>(e.toString());
  }
}
```

### 📱 استخدام الـ Endpoint

```dart
// في HomeScreen
ReleasesCubit _releasesCubit = ReleasesCubit(injectReleaseMoviesUseCase());
_releasesCubit.intent(ReleasesMoviesIntent());

// سيتم عرض الأفلام التي ستُطلق قريباً
```

### 🎯 Use Cases

- عرض الأفلام القادمة
- قائمة الانتظار للأفلام المنتظرة
- إشعارات الإطلاق الجديد
- تخطيط مشاهدة الأفلام
- تتبع تواريخ الإطلاق

### 📅 مثال عملي

```
اليوم: 20 فبراير 2024

الأفلام القادمة في الـ API:
- Deadpool 3 - 28 مايو 2024
- Dune 3 - 22 يونيو 2024
- Avatar 4 - 25 ديسمبر 2024

سيتم عرضها مرتبة حسب تاريخ الإطلاق
```

---

## 📊 مقارنة الـ Endpoints الثلاثة

| المعيار | Top Rated (Recommended) | Popular | Upcoming |
|--------|------------------------|---------|----------|
| **الـ Path** | `/3/movie/top_rated` | `/3/movie/popular` | `/3/movie/upcoming` |
| **الوصف** | الأفلام الأعلى تقييماً | الأفلام الأكثر شهرة (الآن) | الأفلام القادمة |
| **معيار الترتيب** | التقييم العالي | الشهرة الحالية | تاريخ الإطلاق |
| **التقييمات** | عالية جداً | متوسطة إلى عالية | غالباً 0 |
| **الاستخدام** | الأفلام الجيدة | What's Hot | Watch Soon |
| **التحديث** | نادر | متكرر | متكرر |

---

## 🔐 API Key Management

```dart
// في api_constant.dart
abstract class MoviesApiConstants {
  static const String apiKey = '9d7f94be913eddf2db40e317d2f12f36';
  static const String baseUrl = 'api.themoviedb.org';
}
```

⚠️ **ملاحظة الأمان:**
- تجنب نشر الـ API Key في الـ GitHub العام
- استخدم ملفات البيئة (.env) للـ Production
- راقب استخدام الـ API من خلال لوحة تحكم TMDB

---

## ✅ Status Codes

| Code | المعنى | الحل |
|------|--------|------|
| `200` | نجح الـ Request | لا توجد مشكلة |
| `401` | API Key غير صحيح | تحقق من الـ API Key |
| `404` | الـ Resource غير موجود | تحقق من الـ Path |
| `429` | تم تجاوز حد الطلبات | انتظر قبل الطلب مرة أخرى |
| `500` | خطأ في الخادم | حاول مرة أخرى لاحقاً |

---

## 🚀 Rate Limiting

**TMDB API Limits:**
- الخطة المجانية: ~40 requests / 10 seconds
- بطاقة ائتمان: unlimited requests

**في المشروع:**
```dart
// يتم التعامل مع الـ Rate Limiting بشكل تلقائي
// عند الحصول على 429 response code
```

---

## 📈 Performance Tips

1. **استخدم Pagination:**
   ```dart
   // page=1, page=2, etc
   Uri.https(baseUrl, path, {"api_key": key, "page": "1"})
   ```

2. **استخدم Caching:**
   ```dart
   // احفظ النتائج محلياً لتجنب طلبات متكررة
   ```

3. **استخدم Compression:**
   - الـ API يدعم gzip compression تلقائياً

4. **استخدم الـ Right Endpoint:**
   - لا تطلب جميع الأفلام، استخدم الفئات المناسبة

---

## 🔗 روابط مفيدة

- [TMDB API Documentation](https://developer.themoviedb.org/)
- [API Reference](https://developer.themoviedb.org/reference/movie-popular-list)
- [Account Settings](https://www.themoviedb.org/settings/api)

---

## 📝 Examples using cURL

### Top Rated Movies
```bash
curl -X GET "https://api.themoviedb.org/3/movie/top_rated?api_key=9d7f94be913eddf2db40e317d2f12f36"
```

### Popular Movies
```bash
curl -X GET "https://api.themoviedb.org/3/movie/popular?api_key=9d7f94be913eddf2db40e317d2f12f36"
```

### Upcoming Movies
```bash
curl -X GET "https://api.themoviedb.org/3/movie/upcoming?api_key=9d7f94be913eddf2db40e317d2f12f36"
```

