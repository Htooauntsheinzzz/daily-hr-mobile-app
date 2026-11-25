import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'store.dart';

const forest = Color(0xFF35594C),
    sage = Color(0xFFA8C3B0),
    mist = Color(0xFFDEE9DF),
    cream = Color(0xFFF4F3EB),
    charcoal = Color(0xFF26352E);
ThemeData appTheme() => ThemeData(
  fontFamily: 'Inter',
  colorScheme: ColorScheme.fromSeed(
    seedColor: forest,
    primary: forest,
    secondary: sage,
    surface: cream,
  ),
  scaffoldBackgroundColor: cream,
  textTheme: ThemeData.light().textTheme.apply(
    fontFamily: 'Inter',
    bodyColor: charcoal,
    displayColor: forest,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
    errorMaxLines: 3,
    errorStyle: const TextStyle(color: charcoal, fontSize: 13),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: forest,
      foregroundColor: Colors.white,
      minimumSize: const Size(0, 52),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      textStyle: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: Colors.white,
    indicatorColor: mist,
    height: 76,
  ),
);

class AssetIcon extends StatelessWidget {
  const AssetIcon(this.name, {super.key, this.size = 22});
  final String name;
  final double size;
  @override
  Widget build(BuildContext context) =>
      SvgPicture.asset('assets/icons/$name.svg', width: size, height: size);
}

class Heading extends StatelessWidget {
  const Heading(this.text, {super.key, this.size = 30});
  final String text;
  final double size;
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontSize: size,
      height: 1.2,
      fontWeight: FontWeight.w700,
      color: forest,
    ),
  );
}

class ActionButton extends StatelessWidget {
  const ActionButton(
    this.label,
    this.onPressed, {
    super.key,
    this.secondary = false,
  });
  final String label;
  final VoidCallback? onPressed;
  final bool secondary;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: secondary
            ? FilledButton.styleFrom(
                backgroundColor: mist,
                foregroundColor: forest,
              )
            : null,
        onPressed: onPressed,
        child: Text(label, textAlign: TextAlign.center),
      ),
    ),
  );
}

class Surface extends StatelessWidget {
  const Surface({
    super.key,
    required this.child,
    this.color = Colors.white,
    this.padding = 18,
    this.onTap,
  });
  final Widget child;
  final Color color;
  final double padding;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Material(
    color: color,
    borderRadius: BorderRadius.circular(19),
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: onTap,
      child: Padding(padding: EdgeInsets.all(padding), child: child),
    ),
  );
}

class DetailRow extends StatelessWidget {
  const DetailRow(this.label, this.value, {super.key});
  final String label, value;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(color: forest, fontSize: 14),
          ),
        ),
        const SizedBox(width: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 190),
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
      ],
    ),
  );
}

class EntryTile extends StatelessWidget {
  const EntryTile(
    this.title,
    this.subtitle, {
    super.key,
    this.onTap,
    this.icon,
    this.leading,
  });
  final String title, subtitle;
  final VoidCallback? onTap;
  final String? icon;
  final Widget? leading;
  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(
      bottom: icon == null && leading == null ? 10 : 12,
    ),
    child: Surface(
      padding: leading != null ? 18 : 14,
      onTap: onTap,
      child: Row(
        children: [
          if (leading != null) ...[leading!, const SizedBox(width: 12)],
          if (icon != null) ...[
            Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: mist,
                borderRadius: BorderRadius.circular(12),
              ),
              child: AssetIcon(icon!),
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: forest,
                    fontSize: 16,
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 7),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 14, height: 1.2),
                  ),
                ],
              ],
            ),
          ),
          if (onTap != null)
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: AssetIcon('86ce4'),
            ),
        ],
      ),
    ),
  );
}

class ScreenBody extends StatelessWidget {
  const ScreenBody({super.key, required this.children, this.padding = 30});
  final List<Widget> children;
  final double padding;
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.fromLTRB(padding, 24, padding, 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    ),
  );
}

class HrPage extends StatelessWidget {
  const HrPage({
    super.key,
    required this.store,
    required this.title,
    required this.builder,
    this.back = 'Back',
    this.trailing,
    this.navigation = false,
  });
  final HrStore store;
  final String title, back;
  final Widget? trailing;
  final bool navigation;
  final List<Widget> Function(BuildContext) builder;
  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: store,
    builder: (context, _) => Scaffold(
      bottomNavigationBar: navigation ? WorkspaceBar(store: store) : null,
      body: SafeArea(
        child: ScreenBody(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledButton.tonal(
                  style: FilledButton.styleFrom(
                    backgroundColor: mist,
                    foregroundColor: forest,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text('‹  $back'),
                ),
                ?trailing,
              ],
            ),
            const SizedBox(height: 24),
            Heading(title),
            const SizedBox(height: 36),
            ...builder(context),
          ],
        ),
      ),
    ),
  );
}

Future<T?> openPage<T>(BuildContext context, Widget page) =>
    Navigator.of(context).push<T>(MaterialPageRoute(builder: (_) => page));
void toast(BuildContext context, String text) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
Future<bool> confirm(
  BuildContext context,
  String title,
  String message, {
  String action = 'Confirm',
  String cancel = 'Cancel',
}) async =>
    await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: Colors.white,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Heading(title, size: 24),
              const SizedBox(height: 16),
              Text(message),
              const SizedBox(height: 24),
              ActionButton(action, () => Navigator.pop(context, true)),
              ActionButton(
                cancel,
                () => Navigator.pop(context, false),
                secondary: true,
              ),
            ],
          ),
        ),
      ),
    ) ??
    false;
void guarded(BuildContext context, VoidCallback action) {
  try {
    action();
  } on StateError catch (e) {
    toast(context, e.message);
  }
}

class LabeledField extends StatelessWidget {
  const LabeledField(
    this.label,
    this.controller, {
    super.key,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
    this.hint,
  });
  final String label;
  final String? hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int maxLines;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: forest,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint ?? 'Enter ${label.toLowerCase()}',
          ),
        ),
      ],
    ),
  );
}

String? requiredText(String? value) =>
    value == null || value.trim().isEmpty ? 'This field is required.' : null;
String? emailValidator(String? v) =>
    requiredText(v) ??
    (validEmail(v!.trim()) ? null : 'Enter a valid email address.');
String? phoneValidator(String? v) =>
    requiredText(v) ??
    (RegExp(r'^\+?[\d\s()-]{7,20}$').hasMatch(v!.trim())
        ? null
        : 'Enter a valid mobile number.');

/// Shared full-screen selector used by the independent Figma form states.
class ChoicePage<T> extends StatelessWidget {
  const ChoicePage({
    super.key,
    required this.store,
    required this.title,
    required this.options,
    this.selected,
    this.subtitle,
    this.back = 'Form',
  });
  final HrStore store;
  final String title, back;
  final String? subtitle;
  final Map<T, String> options;
  final T? selected;
  @override
  Widget build(BuildContext context) => HrPage(
    store: store,
    title: title,
    back: back,
    builder: (context) => [
      if (subtitle != null) Text(subtitle!),
      SizedBox(height: subtitle == null ? 50 : 44),
      for (final option in options.entries)
        Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: option.key == selected ? sage : Colors.white,
              foregroundColor: forest,
            ),
            onPressed: () => Navigator.pop(context, option.key),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(option.value, textAlign: TextAlign.center),
                ),
                if (option.key == selected) ...[
                  const SizedBox(width: 12),
                  const Icon(Icons.check, size: 18),
                ],
              ],
            ),
          ),
        ),
    ],
  );
}

class DecisionPage extends StatelessWidget {
  const DecisionPage({
    super.key,
    required this.store,
    required this.title,
    required this.heading,
    required this.message,
    required this.action,
    this.subheading = '',
    this.details = '',
    this.cancel = 'Go back',
    this.back = 'Request',
  });
  final HrStore store;
  final String title, heading, message, action, subheading, details, cancel;
  final String back;
  @override
  Widget build(BuildContext context) => HrPage(
    store: store,
    title: title,
    back: back,
    builder: (context) => [
      const SizedBox(height: 28),
      Surface(
        padding: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Heading(heading, size: 21),
            const SizedBox(height: 18),
            if (subheading.isNotEmpty) ...[
              Text(
                subheading,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
            ],
            if (details.isNotEmpty) ...[
              Text(details, style: const TextStyle(fontSize: 15)),
              const SizedBox(height: 20),
            ],
            Text(message, style: const TextStyle(fontSize: 15, height: 1.5)),
            const SizedBox(height: 18),
          ],
        ),
      ),
      const SizedBox(height: 44),
      ActionButton(action, () => Navigator.pop(context, true)),
      ActionButton(
        cancel,
        () => Navigator.pop(context, false),
        secondary: true,
      ),
    ],
  );
}

class WorkspaceBack extends StatelessWidget {
  const WorkspaceBack({
    super.key,
    required this.store,
    required this.label,
    required this.tab,
  });
  final HrStore store;
  final String label;
  final int tab;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 24),
    child: Align(
      alignment: Alignment.centerLeft,
      child: FilledButton.tonal(
        style: FilledButton.styleFrom(
          backgroundColor: mist,
          foregroundColor: forest,
        ),
        onPressed: () => store.navigateWorkspace?.call(tab),
        child: Text('‹  $label'),
      ),
    ),
  );
}

class WorkspaceBar extends StatelessWidget {
  const WorkspaceBar({super.key, required this.store});
  final HrStore store;
  @override
  Widget build(BuildContext context) {
    final labels = store.isHr
        ? ['Overview', 'Employees', 'Attendance', 'Profile']
        : ['Home', 'Attendance', 'Calendar', 'Profile'];
    final icons = store.isHr
        ? ['home', 'team', 'attendance', 'profile']
        : ['home', 'attendance', '470f8', 'profile'];
    return NavigationBar(
      onDestinationSelected: store.navigateWorkspace,
      destinations: [
        for (var i = 0; i < 4; i++)
          NavigationDestination(icon: AssetIcon(icons[i]), label: labels[i]),
      ],
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading(this.label, this.icon, {super.key});
  final String label, icon;
  @override
  Widget build(BuildContext context) => Row(
    children: [
      AssetIcon(icon),
      const SizedBox(width: 8),
      Expanded(child: Heading(label, size: 20)),
    ],
  );
}
