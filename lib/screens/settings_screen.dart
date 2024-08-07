import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_shirt_app/blocs/theme_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _themeSet;

  @override
  void initState() {
    super.initState();
    _themeSet = context.read<ThemeBloc>().state is DarkThemeState;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ayarlar',
          style: theme.textTheme.headlineMedium,
        ),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: Center(
        child: Column(
          children: [
            SwitchListTile(
              value: _themeSet,
              onChanged: (isChecked) {
                setState(() {
                  _themeSet = isChecked;
                  if (_themeSet) {
                    context.read<ThemeBloc>().add(SetDarkTheme());
                  } else {
                    context.read<ThemeBloc>().add(SetLightTheme());
                  }
                });
              },
              title: Text(
                'Koyu Tema',
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontSize: 24,
                ),
              ),
              subtitle: Text(
                'Uygulamanın temasını ayarlayabilirsiniz.',
                style: theme.textTheme.labelMedium!.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontSize: 15,
                ),
              ),
              activeColor: theme.colorScheme.secondary,
              contentPadding: const EdgeInsets.only(left: 20, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
