import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RebuildingDbOverlay extends StatefulWidget {
  final Widget child;
  const RebuildingDbOverlay({
    super.key,
    required this.child,
  });

  @override
  State<RebuildingDbOverlay> createState() => _RebuildingDbOverlayState();
}

class _RebuildingDbOverlayState extends State<RebuildingDbOverlay> {
  bool rebuilding = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SyncManagerCubit, SyncManagerState>(
      listener: (context, state) {
        switch (state) {
          case CheckingSyncState(needDbRebuilding: true):
            setState(() {
              rebuilding = true;
            });
          case SyncedState():
            setState(() {
              rebuilding = false;
            });
        }
      },
      child: rebuilding
          ? const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text(
                    "⏱️ Rebuilding Database\nPlease Wait...",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          : widget.child,
    );
  }
}
