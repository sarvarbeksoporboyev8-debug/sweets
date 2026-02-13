import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Global app state provider
class AppProvider with ChangeNotifier {
  String _selectedLanguage = 'uz';
  String _selectedCategory = 'All';
  String _searchQuery = '';
  bool _isDarkMode = false;
  
  String get selectedLanguage => _selectedLanguage;
  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;
  bool get isDarkMode => _isDarkMode;

  /// Initialize app state
  Future<void> initialize() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _selectedLanguage = prefs.getString('language') ?? 'uz';
      _isDarkMode = prefs.getBool('darkMode') ?? false;
    } catch (e) {
      debugPrint('Error loading app state: $e');
    }
    notifyListeners();
  }

  /// Set language
  Future<void> setLanguage(String language) async {
    _selectedLanguage = language;
    notifyListeners();
    
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('language', language);
    } catch (e) {
      debugPrint('Error saving language: $e');
    }
  }

  /// Set selected category
  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  /// Set search query
  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  /// Clear search query
  void clearSearch() {
    _searchQuery = '';
    notifyListeners();
  }

  /// Toggle dark mode
  Future<void> toggleDarkMode() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('darkMode', _isDarkMode);
    } catch (e) {
      debugPrint('Error saving dark mode: $e');
    }
  }

  /// Set dark mode
  Future<void> setDarkMode(bool value) async {
    _isDarkMode = value;
    notifyListeners();
    
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('darkMode', value);
    } catch (e) {
      debugPrint('Error saving dark mode: $e');
    }
  }
}
