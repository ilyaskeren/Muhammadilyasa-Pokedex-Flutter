# Pokémon DEX App

Aplikasi Flutter untuk menampilkan informasi Pokémon secara organized dan searchable.

## Setup & Running

### Prerequisites:
- Flutter SDK 3.9.2+
- Dart SDK (included with Flutter)

### Installation:
```bash
cd "c:\Flutter Project\uas"
flutter pub get
```

### Run the App:

**For Android/iOS Emulator:**
```bash
flutter run
```

**For Web:**
```bash
flutter run -d chrome
```

**For Windows Desktop:**
```bash
flutter run -d windows
```

## Project Structure

```
lib/
├── main.dart                 # App entry point, theme setup
├── models/
│   └── pokemon.dart         # Pokemon data model + dataset (17 pokemon)
└── screens/
    ├── home_screen.dart     # List view dengan search functionality
    └── detail_screen.dart   # Detail view untuk single pokemon
```

## Features

### 1. List Page (Home Screen)
- Display semua Pokémon dalam card format
- **Search Functionality**: Real-time filter by pokemon name
- Visual indicators: emoji, name, type
- Navigasi ke detail page dengan tap

### 2. Detail Page
- **Comprehensive Information:**
  - Basic info (ID, Name, Type)
  - Stats dengan visual progress bars
  - Ability & Weakness
  - Description
  - Role dalam tim (strategic positioning)
  - Evolution info
  - Recommended partners

- **Visual Features:**
  - Color-coded stats (Red: Low, Orange: Medium, Blue: High, Green: Very High)
  - Responsive progress bars
  - Organized sections dengan clear hierarchy

## Data

Total Pokémon dalam dataset: 17
- Starter Pokémon (Bulbasaur, Charizard, Blastoise)
- Iconic Pokémon (Pikachu, Dragonite)
- Eeveelutions (Eevee, Vaporeon, Jolteon, Flareon)
- Competitive Pokémon (Gengar, Alakazam, Machamp, Lucario, Greninja, Gyarados, Tyranitar, Snorlax)

Setiap Pokémon memiliki:
- 6 stats (HP, Atk, Def, Sp. Atk, Sp. Def, Speed)
- Ability
- Type
- Weakness
- Evolution info
- Role dalam tim
- Partner recommendations

## Dependencies

```yaml
flutter:
  sdk: flutter
cupertino_icons: ^1.0.8
```

**Development:**
- flutter_lints: ^5.0.0

## Technical Notes

### State Management:
- Menggunakan `StatefulWidget` untuk search functionality di HomeScreen
- Simple setState pattern (tidak ada provider/riverpod/getx)

### Navigation:
- MaterialPageRoute untuk stack-based navigation
- List → Detail flow

### Performance:
- Hard-coded dataset (17 pokemon) - okay untuk MVP
- Filter operation adalah O(n) - acceptable untuk dataset ini

## Known Limitations

1. **Data Persistence**: Tidak ada database - data di-hardcode
2. **Network**: Offline only - tidak ada API integration
3. **Features**: Hanya list & detail - tidak ada favorites, team builder, comparison
4. **Assets**: Menggunakan emoji, bukan official Pokémon sprite

## Future Improvements

1. Integrasi dengan PokéAPI untuk data real-time
2. Database integration (SQLite / Firebase)
3. Fitur favorites dengan local storage
4. Team builder/simulator
5. Pokémon comparison tool
6. Better image assets
7. Type effectiveness calculator
8. Move list & details

## Code Quality

- ✅ Clean code dengan clear naming
- ✅ Organized in separate files (models, screens)
- ✅ No analyzer errors/warnings
- ✅ Material Design 3 compliance
- ⚠️ Minimal error handling (production would need more)
- ⚠️ No unit tests (MVP phase)

## Testing

Aplikasi sudah tested untuk:
- ✅ List view rendering
- ✅ Search/filter functionality
- ✅ Navigation to detail page
- ✅ Stats visualization
- ✅ All Pokemon data displays correctly

Belum tested:
- ❌ Unit tests
- ❌ Edge cases (empty search, large datasets)
- ❌ Performance testing

---

Made for Silph Co. x Dynamo Developer Collab 🔴⚪
