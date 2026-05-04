# Development Notes - Pokémon DEX App

## Timeline & Progress

### Phase 1: Planning & Analysis (Sebelum coding)
- Analisis requirement dari Silph Co.
- Identifikasi data structure untuk Pokemon
- Wireframe simple untuk list & detail page
- Setup project structure

### Phase 2: Implementation

#### Day 1 - Foundation
- Created `models/pokemon.dart` dengan Pokemon class
- Data entry untuk 17 pokemon (capek ngisi stats satu-satu)
- Tried initial approach dengan JSON, tapi decided hard-code aja untuk MVP

#### Day 2 - UI Development
- Built `home_screen.dart` dengan ListView
- Implemented search functionality (ewok at first, tapi finally working)
- Card design untuk list items

#### Day 3 - Detail Page
- Created `detail_screen.dart`
- Struggled with stats visualization - tried different widget approaches
  - Initially tried ProgressIndicator tanpa Container
  - Fixed dengan ClipRRect untuk rounded corners
- Added color coding untuk stats (took some tweaking)
- Section-based layout untuk info organization

#### Day 4 - Polish & Cleanup
- Main.dart cleanup (ada leftover code dari template)
- Flutter analyze - fixed unnecessary `toList()` warning
- Final testing & screenshot

## Technical Decisions & Why

### 1. Hard-coded Data vs Database
**Decision**: Hard-coded array
**Pros**: 
- Fast development
- No external dependencies
- Good for MVP/prototype
**Cons**: 
- Not scalable
- No persistence
**Next time**: Use Hive atau SQLite untuk small local DB

### 2. Search Implementation
**Approach**: StatefulWidget dengan setState
**Could have used**: Provider, Riverpod, GetX
**Chose simple** because: Hanya 1 filter, tidak complicated logic

### 3. Stats Visualization
**Struggled with**:
- Tried using LinearProgressIndicator directly
- Progress bar color kurang kontras dengan background
- Fixed dengan ClipRRect + custom backgroundColor

**Final approach**:
```dart
LinearProgressIndicator(
  value: entry.value / 200,  // normalize to 0-1
  minHeight: 6,
  backgroundColor: Colors.grey[300],
  valueColor: AlwaysStoppedAnimation<Color>(_getStatColor(value))
)
```

### 4. Navigation Pattern
**Stack-based**: List → Detail
- Simple & intuitive
- Back button automatic dengan Material
- Could add: Tab-based navigation untuk multi-section app

### 5. UI Colors
**Chosen**: Red theme (brand color Pokémon)
**Alternative considered**: Blue theme (water pokemon), but red lebih iconic

## Bugs Fixed

### Bug 1: Analyzer warning `unnecessary_to_list_in_spreads`
```dart
// WRONG
...pokemon.stats.entries.map((entry) {...}).toList(),

// CORRECT
...pokemon.stats.entries.map((entry) {...}),
```
Spread operator sudah handle conversion ke list.

### Bug 2: Search case-sensitivity
Initial: `p.name.contains(query)` → case-sensitive
Fix: `p.name.toLowerCase().contains(query.toLowerCase())`

### Potential Issues Not Yet Encountered
- [ ] Very long descriptions breaking UI (assumed none > 300 char)
- [ ] Empty search result - handled dengan message
- [ ] Performance with 1000+ pokemon (doesn't matter for 17 :D)

## Code Patterns Used

### 1. Card-based List
```dart
ListView.builder(
  itemCount: filteredList.length,
  itemBuilder: (context, index) {
    return Card(
      margin: EdgeInsets.symmetric(...),
      child: ListTile(...)
    );
  }
)
```

### 2. Section Widget Builder
```dart
Widget _buildSection(String title, List<Widget> children) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      ...children,
    ],
  );
}
```
Reusable untuk multiple sections tanpa repeat code

### 3. Color Logic untuk Stats
```dart
Color _getStatColor(int value) {
  if (value >= 120) return Colors.green;      // Excellent
  if (value >= 100) return Colors.blue;       // Very Good
  if (value >= 80) return Colors.orange;      // Good
  return Colors.red;                          // Needs Improvement
}
```
Conditional logic simple - could be extracted ke utility jika besar

## What I'd Do Different

### 1. Architecture
- **Current**: Simple screens + models
- **Better for future**: 
  - Create repository pattern untuk data access
  - Separate business logic dari UI

### 2. State Management
- **Current**: setState
- **Better if bigger**: 
  - Riverpod (kalau prefer functional)
  - Bloc (kalau prefer structured)

### 3. Testing
- **Current**: None
- **Should add**: 
  - Unit tests untuk model
  - Widget tests untuk screens
  - Integration tests

### 4. Error Handling
- **Current**: Minimal
- **Should add**: 
  - Try-catch blocks
  - Loading states
  - Error dialogs

### 5. Assets & Localization
- **Current**: Hard-coded strings, emoji
- **Better**: 
  - Localization file untuk multi-language
  - Asset management untuk images

## Performance Notes

- Search filter: O(n) linear scan - acceptable untuk n=17
- List rendering: ListView.builder ✅ (efficient)
- Memory: ~2KB per pokemon * 17 = ~34KB data - negligible
- Build time: ~3 secs dari cold start

**Optimization opportunities**:
- Implement caching untuk filter results
- Lazy load detail page data (tidak needed untuk 17 pokemon)
- Image optimization jika pake real images

## Dependencies Analysis

```
uas (main package)
├── flutter
├── cupertino_icons: ^1.0.8  // iOS styling
└── (dev) flutter_lints: ^5.0.0  // Code quality
```

**Minimal dependencies** - good untuk MVP!
**When to add**:
- `provider` - state management
- `hive` - local database
- `http` - API calls
- `firebase_core` - backend

## What Works Well

✅ Search functionality - instant feedback, case-insensitive
✅ Stats visualization - color & progress bar mudah dipahami
✅ Navigation - intuitive list→detail flow
✅ Data structure - flexible untuk add more pokemon
✅ Code organization - readable & maintainable

## What Needs Work

⚠️ No error handling - "happy path only"
⚠️ No empty state illustration - generic message
⚠️ Detail page cut off? Belum test dengan very tall content
⚠️ Hardcoded strings - tidak i18n
⚠️ No data validation - assumes all pokemon data valid

## Testing Scenarios Checked

✓ Open app → list render
✓ Search "bulba" → correct filter
✓ Search "xyz" → empty list message
✓ Tap card → navigate to detail
✓ Detail page → all sections visible
✓ Back button → return to list
✓ Long scroll → stats visibility
✓ Rotate device → layout responsive?

**Not tested**:
- [ ] Cold app start time
- [ ] Memory usage dengan emulator monitor
- [ ] Network (doesn't apply)
- [ ] Unit test coverage

---

## Future Roadmap

### V1.1 (Quick wins)
- [ ] Add favorite button
- [ ] Persist favorites to SharedPreferences
- [ ] Add sorting (by name, type, stats)

### V1.2 (Medium effort)
- [ ] Team builder (select 6 pokemon)
- [ ] Type effectiveness calculator
- [ ] Pokemon comparison view

### V2.0 (Major revision)
- [ ] SQLite database
- [ ] PokéAPI integration
- [ ] Offline caching
- [ ] Dark mode
- [ ] Multiple languages

### Tentang Scaling
- Jika 1000+ pokemon: implement pagination + lazy loading
- Jika complex features: refactor ke BLoC architecture
- Jika multiple developers: implement proper folder structure + naming conventions

---

**Developer Notes:**
- Project ini cukup straightforward untuk MVP
- Main challenge adalah information architecture (apa yg critical vs nice-to-have)
- UI simplicity adalah strength, bukan weakness
- Next person yang maintain: look di DOKUMENTASI.md untuk context bisnis

Last updated: [current date]
Status: MVP Complete - Ready for user testing
