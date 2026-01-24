import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen>
    with SingleTickerProviderStateMixin {
  // Content
  final List<String> _contents = const [
    'Movies',
    'Series',
    'TV shows',
    'Sports'
  ];
  String _selectedContent = 'Movies';

  // Genres
  final List<String> _genres = const [
    'Action',
    'Adventure',
    'Comedy',
    'Crime',
    'Drama',
    'Fantasy',
    'Horror',
    'Mystery',
    'Romance',
    'Sci-Fi',
    'Thriller',
    'Animation'
  ];
  final Set<String> _selectedGenres = {'Adventure', 'Comedy', 'Fantasy'};
  bool _genresExpanded = false;

  // Sort & year
  final List<String> _sortOptions = const ['Popularity', 'Newest', 'Rating'];
  String _sortBy = 'Popularity';

  final List<String> _yearRanges = const [
    '2020 – 2025',
    '2018 – 2022',
    '2015 – 2017'
  ];
  String _yearRange = '2020 – 2025';

  // Rating
  RangeValues _rating = const RangeValues(2, 6);

  // Toggle
  bool _onlyUnviewed = false;

  // Animation for expand/collapse
  late final AnimationController _animController;
  late final Animation<double> _expandAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 240),
    );
    _expandAnim =
        CurvedAnimation(parent: _animController, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _toggleGenres() {
    setState(() {
      _genresExpanded = !_genresExpanded;
      if (_genresExpanded) {
        _animController.forward();
      } else {
        _animController.reverse();
      }
    });
  }

  void _clearAll() {
    setState(() {
      _selectedContent = _contents.first;
      _selectedGenres
        ..clear()
        ..addAll({'Adventure', 'Comedy', 'Fantasy'});
      _genresExpanded = false;
      _animController.reverse();
      _sortBy = _sortOptions.first;
      _yearRange = _yearRanges.first;
      _rating = const RangeValues(2, 6);
      _onlyUnviewed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1012),
        elevation: 0,
        title: const Text('Filters',
            style: TextStyle(fontWeight: FontWeight.w700)),
        leading: IconButton(
          icon: const Icon(Icons.close, size: 22),
          onPressed: () {
            // just pop or do something
            Navigator.of(context).maybePop();
          },
        ),
        actions: [
          TextButton(
            onPressed: _clearAll,
            child: const Text('Clear all',
                style: TextStyle(color: Colors.white70)),
          ),
          const SizedBox(width: 8),
        ],
      ),
      // Sticky bottom button
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.only(
            bottom: bottomPadding > 0 ? bottomPadding : 12,
            left: 16,
            right: 16,
            top: 8),
        child: SizedBox(
          height: 56,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            onPressed: () {
              // Apply filter action
              final selectedCount = _selectedGenres.length;
              // For demo, just show snackbar
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    'Applied: $_selectedContent · $selectedCount genres · $_yearRange'),
              ));
            },
            child: const Text('Show 452 results',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
        children: [
          _sectionHeader('Content',
              trailing: TextButton(
                onPressed: () {},
                child: const Text('View all',
                    style: TextStyle(color: Colors.white54)),
              )),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _contents.map((c) {
              final selected = c == _selectedContent;
              return _chip(
                label: c,
                selected: selected,
                onTap: () => setState(() => _selectedContent = c),
              );
            }).toList(),
          ),
          const SizedBox(height: 22),

          _sectionHeader('Genres',
              trailing: TextButton(
                onPressed: _toggleGenres,
                child: Text(_genresExpanded ? 'Collapse' : 'Expand',
                    style: const TextStyle(color: Colors.white54)),
              )),
          // Animated expansion: show first 6 when collapsed, all when expanded
          SizeTransition(
            sizeFactor: _expandAnim,
            axisAlignment: -1,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _genres
                  .map((g) => _chip(
                        label: g,
                        selected: _selectedGenres.contains(g),
                        onTap: () => setState(() {
                          if (_selectedGenres.contains(g))
                            _selectedGenres.remove(g);
                          else
                            _selectedGenres.add(g);
                        }),
                      ))
                  .toList(),
            ),
          ),
          // When collapsed show a row of first 6 (so SizeTransition animates from 0 to full)
          if (!_genresExpanded) ...[
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _genres
                  .take(6)
                  .map((g) => _chip(
                        label: g,
                        selected: _selectedGenres.contains(g),
                        onTap: () => setState(() {
                          if (_selectedGenres.contains(g))
                            _selectedGenres.remove(g);
                          else
                            _selectedGenres.add(g);
                        }),
                      ))
                  .toList(),
            ),
          ],
          const SizedBox(height: 22),

          _sectionHeader('Sort by'),
          _filledDropdown<String>(
            value: _sortBy,
            items: _sortOptions,
            onChanged: (v) => setState(() => _sortBy = v!),
          ),
          const SizedBox(height: 18),

          _sectionHeader('Year'),
          _filledDropdown<String>(
            value: _yearRange,
            items: _yearRanges,
            onChanged: (v) => setState(() => _yearRange = v!),
          ),
          const SizedBox(height: 22),

          _sectionHeader('Rating',
              subtitle:
                  'from ${_rating.start.round()} to ${_rating.end.round()}'),
          RangeSlider(
            values: _rating,
            min: 0,
            max: 10,
            divisions: 10,
            labels: RangeLabels(
              _rating.start.round().toString(),
              _rating.end.round().toString(),
            ),
            activeColor: Colors.white,
            inactiveColor: Colors.white24,
            onChanged: (v) => setState(() => _rating = v),
          ),
          const SizedBox(height: 12),

          _switchTile(
            title: 'Only unviewed',
            value: _onlyUnviewed,
            onChanged: (v) => setState(() => _onlyUnviewed = v),
          ),

          const SizedBox(height: 24),
          // small helper text
          Text('${_selectedGenres.length} genres selected',
              style: const TextStyle(color: Colors.white54)),
          const SizedBox(height: 80), // leave space for bottom button
        ],
      ),
    );
  }

  // ---------------- UI Helpers ----------------

  Widget _sectionHeader(String title, {Widget? trailing, String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700)),
              if (subtitle != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(subtitle,
                      style:
                          const TextStyle(color: Colors.white54, fontSize: 13)),
                ),
            ]),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  Widget _chip(
      {required String label,
      required bool selected,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.white : const Color(0xFF1A1C1F),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Text(label,
            style: TextStyle(
              color: selected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }

  Widget _filledDropdown<T>({
    required T value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
  }) {
    return DropdownButtonFormField<T>(
      value: value,
      onChanged: onChanged,
      dropdownColor: const Color(0xFF1A1C1F),
      iconEnabledColor: Colors.white70,
      style: const TextStyle(color: Colors.white),
      items: items
          .map((e) => DropdownMenuItem<T>(value: e, child: Text(e.toString())))
          .toList(),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF1A1C1F),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget _switchTile(
      {required String title,
      required bool value,
      required ValueChanged<bool> onChanged}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
          color: const Color(0xFF1A1C1F),
          borderRadius: BorderRadius.circular(12)),
      child: SwitchListTile(
        value: value,
        onChanged: onChanged,
        contentPadding: EdgeInsets.zero,
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        activeColor: Colors.white,
      ),
    );
  }
}
