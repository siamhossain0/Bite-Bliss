import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/location/location_bloc.dart';
import '../blocs/location/location_event.dart';
import '../blocs/location/location_state.dart';
import '../core/enums/location_status.dart';
import '../routes/app_routes.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationBloc, LocationState>(
      listener: (context, state) {
        if (state.status == LocationStatus.success || 
            state.status == LocationStatus.skipped) {
          AppRoutes.goToHome(context);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const Icon(
                  Icons.location_on,
                  size: 100,
                  color: Colors.red,
                ),
                const SizedBox(height: 32),
                // ... rest of your UI code ...
                const Spacer(),
                BlocBuilder<LocationBloc, LocationState>(
                  builder: (context, state) {
                    final isLoading = state.status == LocationStatus.loading;
                    return ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () => context.read<LocationBloc>().add(RequestLocation()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Text(
                              'Use My Location',
                              style: TextStyle(fontSize: 16),
                            ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<LocationBloc, LocationState>(
                  builder: (context, state) {
                    final isLoading = state.status == LocationStatus.loading;
                    return TextButton(
                      onPressed: isLoading
                          ? null
                          : () => context.read<LocationBloc>().add(SkipLocation()),
                      child: const Text(
                        'Skip for Now',
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 