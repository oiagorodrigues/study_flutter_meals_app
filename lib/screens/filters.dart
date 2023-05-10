import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/filter_switch_tile.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    final filtersNotifier = ref.read(filtersProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: Column(
        children: [
          FilterSwitchTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isGluttenFree) =>
                filtersNotifier.setFilter(Filter.glutenFree, isGluttenFree),
            title: 'Glutten-free',
            subtitle: 'Only include glutten-free meals.',
          ),
          FilterSwitchTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isLactoseFree) =>
                filtersNotifier.setFilter(Filter.lactoseFree, isLactoseFree),
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
          ),
          FilterSwitchTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isVegetarian) =>
                filtersNotifier.setFilter(Filter.vegetarian, isVegetarian),
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
          ),
          FilterSwitchTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isVegan) =>
                filtersNotifier.setFilter(Filter.vegan, isVegan),
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
          ),
        ],
      ),
    );
  }
}
