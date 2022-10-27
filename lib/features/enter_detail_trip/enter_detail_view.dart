import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:random_image_swiper/features/enter_detail_trip/provider.dart';
import 'package:random_image_swiper/features/trips_view/provider.dart';
import 'package:random_image_swiper/shared/trip.dart';

class EnterDetailView extends HookConsumerWidget {
  const EnterDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final destinationController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final dateOfTrip = useState<DateTime?>(null);
    final riskAssessment = useState<bool>(false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter new detail view'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Trip name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: destinationController,
            decoration: const InputDecoration(
              labelText: 'Destination',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TileInput(
            title: 'Date of trip',
            action: OutlinedButton(
              onPressed: () async {
                dateOfTrip.value = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 60)),
                );
              },
              child: Text(
                dateOfTrip.value != null ? '${DateFormat('dd/MM/yyyy').format(dateOfTrip.value!)}' : 'Select',
              ),
            ),
          ),
          const SizedBox(height: 12),
          TileInput(
            title: 'Risk assessment',
            action: ToggleButtons(
              onPressed: (index) => riskAssessment.value = index == 0,
              isSelected: [riskAssessment.value, !riskAssessment.value],
              children: const [
                Text('T'),
                Text('F'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: descriptionController,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Description',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (nameController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Trip name is required')),
            );
            return;
          }
          if (destinationController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Trip destination is required')),
            );
            return;
          }
          if (dateOfTrip.value == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Date of trip is required')),
            );
            return;
          }
          try {
            final result = await createTripProvider(
              ref,
              Trip(
                name: nameController.text,
                dateOfTrip: dateOfTrip.value!,
                destination: destinationController.text,
                riskAssessment: riskAssessment.value,
                description: descriptionController.text.isEmpty ? null : descriptionController.text,
              ),
            );

            if (result) {
              Future.microtask(() => Navigator.pop(context));
              ref.refresh(tripsProvider);
            }
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
          }
        },
        label: const Text('Save'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}

class TileInput extends StatelessWidget {
  const TileInput({
    Key? key,
    required this.title,
    required this.action,
  }) : super(key: key);

  final String title;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(title),
        ),
        action,
      ],
    );
  }
}
