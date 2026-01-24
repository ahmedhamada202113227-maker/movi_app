import 'package:flutter/material.dart';
import 'package:movi_app/core/utils/app/colors/app_colors.dart';
import 'package:movi_app/core/utils/app/styles/app_styles.dart';
import 'package:movi_app/widgets/custom_scaffoldBK.dart';

class FilterPageView extends StatefulWidget {
  const FilterPageView({super.key});

  @override
  State<FilterPageView> createState() => _FilterPageViewState();
}

class _FilterPageViewState extends State<FilterPageView> {
  // ------------------------- Content -------------------------
  final List<String> _contents = const ['Movies', 'Series', 'TV shows'];
  String _selectedContent = 'Movies';

  // ------------------------- Movie Types -------------------------

  final List<String> _moviTypes = const [
    'Action',
    'Adventure',
    'Comedy',
    'Crime',
    'Drama',
    'Fantasy',
    'Horror',
    'Mystery',
    'Romance',
    'Sci-Fi'
  ];
  final Set<String> _selectedMoviTypes = {'Adventure', 'Comedy', 'Fantasy'};
  bool _moviTypesExpanded = false;

  // ------------------------- Sort Movies by  -------------------------

  final List<String> _sortOptions = const ['Popularity', 'Newest', 'Rating'];
  String _sortBySelected = 'Popularity';

  // ------------------------- Sort Movies by Year -------------------------

  final List<String> _yearRanges = const [
    '2020 – 2025',
    '2022 – 2025',
    '2015 – 2021'
  ];
  String _yearRangeSelected = '2022 – 2025';

// ------------------------- Rating Slider -------------------------

  RangeValues _rating = const RangeValues(2, 6);

  // ------------------------- Toggle Unviewed -------------------------
  bool _onlyUnviewed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: customScaffoldBK(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // ------------------------- App Bar -------------------------
        appBar: AppBar(
          backgroundColor: Colors.black38,
          elevation: 0,
          title: Text(
            'Filter',
            style: AppStyles.styleExtraBold30,
          ),
          centerTitle: false,
          actions: [
            TextButton(
              onPressed: _clearAll,
              child: Text(
                'Clear all',
                style: AppStyles.styleMedium16,
              ),
            )
          ],
        ),
        // ------------------------- BottomElevatedButton -------------------------
        bottomNavigationBar: const BottomElevatedButton(),

        // ------------------------- Body -------------------------
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            // ------------------------- _sectionHeader (Content) -------------------------
            _sectionHeader('Content',
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('View all', style: AppStyles.styleMedium16),
                )),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _contents
                  .map((c) => _contentSelectedWidget(
                        label: c,
                        selected: _selectedContent == c,
                        onTap: () => setState(() => _selectedContent = c),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            // ------------------------- _sectionHeader (Movies Types) -------------------------
            _sectionHeader(
              'Movies Types',
              trailing: TextButton(
                onPressed: () =>
                    setState(() => _moviTypesExpanded = !_moviTypesExpanded),
                child: Text(
                  _moviTypesExpanded ? 'Collapse' : 'Expand',
                  style: AppStyles.styleMedium16,
                ),
              ),
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: (_moviTypesExpanded ? _moviTypes : _moviTypes.take(6))
                  .map((g) => _contentSelectedWidget(
                        label: g,
                        selected: _selectedMoviTypes.contains(g),
                        onTap: () => setState(() {
                          if (_selectedMoviTypes.contains(g)) {
                            _selectedMoviTypes.remove(g);
                          } else {
                            _selectedMoviTypes.add(g);
                          }
                        }),
                      ))
                  .toList(),
            ),

            const SizedBox(height: 20),
            // ------------------------- _sectionHeader (Sort by) -------------------------
            _sectionHeader('Sort by'),
            _sortedByfilledDropdown<String>(
              value: _sortBySelected,
              items: _sortOptions,
              onChanged: (v) => setState(() => _sortBySelected = v!),
            ),
            const SizedBox(height: 20),
            // ------------------------- _sectionHeader (Sort by Year) -------------------------
            _sectionHeader('Year'),
            _sortedByfilledDropdown<String>(
              value: _yearRangeSelected,
              items: _yearRanges,
              onChanged: (v) => setState(() => _yearRangeSelected = v!),
            ),
            const SizedBox(height: 20),
            // ------------------------- _sectionHeader (Rating) -------------------------
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
            // ------------------------- _sectionHeader (Only unviewed) -------------------------
            _switchTile(
              title: 'Only unviewed',
              value: _onlyUnviewed,
              onChanged: (v) => setState(() => _onlyUnviewed = v),
            ),
          ],
        ),
      ),
    );
  }

  void _clearAll() {
    setState(() {
      _selectedContent = 'Movies';
      _selectedMoviTypes
        ..clear()
        ..addAll(['Adventure', 'Comedy', 'Fantasy']);
      _moviTypesExpanded = false;
      _sortBySelected = 'Popularity';
      _yearRangeSelected = '2022 – 2025';
      _rating = const RangeValues(2, 6);
      _onlyUnviewed = false;
    });
  }

  // UI helpers

  Widget _sectionHeader(String title, {Widget? trailing, String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppStyles.styleMedium16),
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      subtitle,
                      style: AppStyles.styleMedium16,
                    ),
                  ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  Widget _contentSelectedWidget({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.white24,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.black : Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _sortedByfilledDropdown<T>({
    required T value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
  }) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      onChanged: onChanged,
      dropdownColor: AppColors.primaryColor.withOpacity(0.5),
      iconEnabledColor: Colors.white70,
      style: const TextStyle(color: Colors.white),
      items: items
          .map((e) => DropdownMenuItem<T>(value: e, child: Text(e.toString())))
          .toList(),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white24,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _switchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SwitchListTile(
        value: value,
        onChanged: onChanged,
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: AppStyles.styleExtraBold20,
        ),
        activeThumbColor: Colors.white,
      ),
    );
  }
}

class BottomElevatedButton extends StatelessWidget {
  const BottomElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: SizedBox(
        height: 56,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: () {},
          child: const Text('Show 452 results',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
