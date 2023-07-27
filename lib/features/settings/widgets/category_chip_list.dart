import 'package:flutter/material.dart';
import 'package:otaku_world/theme/colors.dart';

class CategoryChipList extends StatefulWidget {
  const CategoryChipList(
      {super.key,
      required this.categoryList,
      required this.onSelectionChanged});

  final List<String?> categoryList;
  final Function(List<String>) onSelectionChanged;

  @override
  State<CategoryChipList> createState() => _CategoryChipListState();
}

class _CategoryChipListState extends State<CategoryChipList> {
  List<String> selectedCategories = [
    'Action',
    'Comedy',
  ];

  List<Widget> _buildCategoryList() {
    List<Widget> categoryChips = [];

    for (var item in widget.categoryList) {
      bool isSelected = selectedCategories.contains(item);

      categoryChips.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 7.5),
          child: ChoiceChip(
            label: Text(item ?? ''),
            selected: isSelected,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.5,
              ),
            ),
            labelStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
            selectedColor: Theme.of(context).primaryColor,
            backgroundColor: AppColors.raisinBlack,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            onSelected: (selected) {
              setState(() {
                selectedCategories.contains(item)
                    ? selectedCategories.remove(item)
                    : selectedCategories.add(item ?? '');
                widget.onSelectionChanged(selectedCategories);
              });
            },
          ),
        ),
      );
    }

    return categoryChips;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: _buildCategoryList(),
      ),
    );
  }
}
