import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_image_swiper/features/enter_detail_trip/enter_detail_view.dart';
import 'package:random_image_swiper/features/trips_view/provider.dart';
import 'package:random_image_swiper/shared/database.dart';
import 'package:random_image_swiper/shared/trip.dart';

class TripsView extends ConsumerWidget {
  const TripsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsFuture = ref.watch(tripsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Trips')),
      body: tripsFuture.when(
        data: (data) {
          if (data.isEmpty) {
            return const SizedBox(
              height: 300,
              child: Center(child: Text('Let\'s create new trip reminder')),
            );
          }
          return RefreshIndicator(
            onRefresh: () async => ref.refresh(tripsProvider),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => TripTile(data[index]),
            ),
          );
        },
        error: (e, st) {
          return Center(
            child: Text('Beep, boop! Something wents wrong!\n${e.toString()}'),
          );
        },
        loading: () => const Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const EnterDetailView(),
          ),
        ),
      ),
    );
  }
}

class TripTile extends ConsumerWidget {
  const TripTile(this.trip, {super.key});

  final Trip trip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Dismissible(
      key: ValueKey(trip.id),
      background: ColoredBox(
        color: Colors.red,
        child: Center(
            child: Text(
          'Delete reminder?',
          style: theme.textTheme.titleLarge!.copyWith(
            color: Colors.white,
          ),
        )),
      ),
      onDismissed: (_) {
        removeTrip(ref, trip.id!);
      },
      child: Card(
        margin: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          trip.name,
                          style: theme.textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.map),
                            const SizedBox(width: 8),
                            Text(
                              trip.destination,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      const SizedBox(
                        height: 24,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text('Risk'),
                        ),
                      ),
                      const SizedBox(height: 8),
                      trip.riskAssessment
                          ? const Icon(Icons.check, color: Colors.green)
                          : const Icon(Icons.close, color: Colors.red),
                    ],
                  ),
                ],
              ),
              const Divider(),
              trip.description == null ? const Text('No description') : Text(trip.description!),
            ],
          ),
        ),
      ),
    );
  }
}

void removeTrip(WidgetRef ref, int id) {
  final db = ref.watch(sqliteDatabaseProvider).whenOrNull(data: (data) => data)!;
  db.prepare('DELETE FROM trips WHERE id=?')
    ..execute([id])
    ..dispose();
}
