import 'package:flutter/material.dart';

import 'store.dart';
import 'ui.dart';
import 'payroll.dart';

class DirectoryBody extends StatelessWidget {
  const DirectoryBody({super.key, required this.store});
  final HrStore store;
  @override
  Widget build(BuildContext context) => ScreenBody(
    children: [
      WorkspaceBack(store: store, label: 'HR overview', tab: 0),
      const Heading('Employees', size: 32),
      const SizedBox(height: 30),
      ActionButton(
        '+ Add employee',
        () => openPage(context, EmployeeForm(store: store)),
      ),
      const SizedBox(height: 28),
      const Heading('Employee directory', size: 20),
      const SizedBox(height: 24),
      for (final e in store.employees)
        EntryTile(
          e.name,
          '${e.department}${e.active ? '' : ' · Inactive'}',
          leading: Container(
            width: 46,
            height: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: mist,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              e.initials,
              style: const TextStyle(
                color: forest,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          onTap: () =>
              openPage(context, EmployeeDetail(store: store, employee: e)),
        ),
    ],
  );
}

class EmployeeDetail extends StatelessWidget {
  const EmployeeDetail({
    super.key,
    required this.store,
    required this.employee,
  });
  final HrStore store;
  final Employee employee;
  @override
  Widget build(BuildContext context) {
    final e = employee;
    return HrPage(
      store: store,
      title: 'Employee record',
      back: 'Employees',
      trailing: e.active
          ? FilledButton.tonal(
              style: FilledButton.styleFrom(
                backgroundColor: mist,
                foregroundColor: forest,
              ),
              onPressed: () =>
                  openPage(context, PaySettingsPage(store: store, employee: e)),
              child: const Text('Pay settings'),
            )
          : null,
      builder: (context) => [
        Surface(
          color: sage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(e.id),
              const SizedBox(height: 12),
              Heading(e.name),
              Text(
                e.active ? 'Active' : 'Inactive',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        const SectionHeading('Employment', '437f3'),
        const SizedBox(height: 14),
        Surface(
          child: Column(
            children: [
              DetailRow('Position', e.position),
              DetailRow('Department', e.department),
            ],
          ),
        ),
        const SizedBox(height: 30),
        const SectionHeading('Contact details', 'cec83'),
        const SizedBox(height: 14),
        Surface(
          child: Column(
            children: [
              DetailRow('Work email', e.email),
              DetailRow('Mobile', e.mobile),
            ],
          ),
        ),
        const SizedBox(height: 30),
        if (e.active)
          ActionButton(
            'Edit employee',
            () => openPage(context, EmployeeForm(store: store, employee: e)),
          ),
        if (e.active)
          ActionButton('Deactivate profile', () async {
            if (await openPage<bool>(
                  context,
                  DecisionPage(
                    store: store,
                    title: 'Deactivate profile',
                    back: 'Record',
                    heading: 'Deactivate ${e.name}?',
                    message: 'This marks the employee profile as inactive. The employee record and its history will be kept.',
                    action: 'Deactivate profile',
                    cancel: 'Keep active',
                  ),
                ) ==
                true) {
              store.requireHr();
              e.active = false;
              store.changed();
            }
          }, secondary: true),
      ],
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key, required this.store, required this.onSignOut});
  final HrStore store;
  final VoidCallback onSignOut;
  @override
  Widget build(BuildContext context) {
    final e = store.isHr ? null : store.me;
    return ScreenBody(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () => store.navigateWorkspace?.call(0),
            child: Text(store.isHr ? '‹  HR overview' : '‹  Home'),
          ),
        ),
        const SizedBox(height: 12),
        const Heading('Profile', size: 34),
        const SizedBox(height: 24),
        Surface(
          color: mist,
          padding: 9,
          child: Row(
            children: [
              Container(
                width: 55,
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: sage,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Text(
                  e?.initials ?? 'AP',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: forest,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Heading(e?.name ?? 'Arun Patel', size: 22),
                    Text(store.isHr ? 'HR Admin' : 'Employee'),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        EntryTile(
          'Work email',
          e?.email ?? 'arun@dailyhr.example',
          icon: 'mail',
        ),
        if (e != null) ...[
          const SizedBox(height: 14),
          const SectionHeading('Employment', '437f3'),
          const SizedBox(height: 14),
          Surface(
            child: Column(
              children: [
                DetailRow('Position', e.position),
                DetailRow('Department', e.department),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const SectionHeading('Contact details', 'cec83'),
          const SizedBox(height: 14),
          Surface(
            child: Column(
              children: [
                DetailRow('Mobile', e.mobile),
                DetailRow('Personal email', e.personalEmail),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ActionButton(
            'Edit contact details',
            () => openPage(
              context,
              EmployeeForm(store: store, employee: e, contactOnly: true),
            ),
          ),
        ],
        SizedBox(height: store.isHr ? 36 : 0),
        ActionButton('Sign out', onSignOut, secondary: true),
      ],
    );
  }
}

class EmployeeForm extends StatefulWidget {
  const EmployeeForm({
    super.key,
    required this.store,
    this.employee,
    this.contactOnly = false,
  });
  final HrStore store;
  final Employee? employee;
  final bool contactOnly;
  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final form = GlobalKey<FormState>();
  late final TextEditingController name, email, mobile, personal;
  String? position, department, error;
  @override
  void initState() {
    super.initState();
    final e = widget.employee;
    name = TextEditingController(text: e?.name);
    email = TextEditingController(text: e?.email);
    mobile = TextEditingController(text: e?.mobile);
    personal = TextEditingController(text: e?.personalEmail);
    position = e?.position;
    department = e?.department;
  }

  @override
  void dispose() {
    for (final c in [name, email, mobile, personal]) {
      c.dispose();
    }
    super.dispose();
  }

  void save() {
    final valid = form.currentState!.validate();
    if (!widget.contactOnly &&
        (name.text.trim().isEmpty ||
            email.text.trim().isEmpty ||
            position == null ||
            department == null)) {
      setState(
        () => error = 'Enter a name, work email, position and department.',
      );
      return;
    }
    if (!valid) return;
    setState(() => error = null);
    final s = widget.store, e = widget.employee;
    if (widget.contactOnly) {
      s.requireOwner(e!.id);
      e.mobile = mobile.text.trim();
      e.personalEmail = personal.text.trim();
    } else {
      s.requireHr();
      if (s.employees.any(
        (v) =>
            v.id != e?.id &&
            v.email.toLowerCase() == email.text.trim().toLowerCase(),
      )) {
        toast(context, 'An employee already uses this work email.');
        return;
      }
      if (e == null) {
        s.employees.add(
          Employee(
            'DH-${DateTime.now().microsecondsSinceEpoch}',
            name.text.trim(),
            email.text.trim(),
            mobile.text.trim(),
            position!,
            department!,
          ),
        );
      } else {
        e.name = name.text.trim();
        e.email = email.text.trim();
        e.mobile = mobile.text.trim();
        e.position = position!;
        e.department = department!;
      }
    }
    s.changed();
    Navigator.pop(context);
    toast(
      context,
      widget.contactOnly ? 'Contact details saved.' : 'Employee saved.',
    );
  }

  @override
  Widget build(BuildContext context) => HrPage(
    store: widget.store,
    title: widget.contactOnly
        ? 'Edit contact details'
        : widget.employee == null
        ? 'Add employee'
        : 'Edit employee',
    back: widget.contactOnly
        ? 'Profile'
        : widget.employee == null
        ? 'Employees'
        : 'Record',
    builder: (context) => [
      if (widget.contactOnly) ...[
        const Text('Update how HR can reach you.'),
        const SizedBox(height: 38),
      ],
      Form(
        key: form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!widget.contactOnly) ...[
              LabeledField('Full name', name),
              LabeledField(
                'Work email',
                email,
                hint: 'name@company.com',
                validator: (v) =>
                    (v ?? '').trim().isEmpty ? null : emailValidator(v),
                keyboardType: TextInputType.emailAddress,
              ),
            ],
            LabeledField(
              'Mobile number',
              mobile,
              validator: (v) => (v ?? '').isEmpty ? null : phoneValidator(v),
              keyboardType: TextInputType.phone,
            ),
            if (widget.contactOnly)
              LabeledField(
                'Personal email',
                personal,
                validator: emailValidator,
                keyboardType: TextInputType.emailAddress,
              ),
            if (!widget.contactOnly) ...[
              picker('Position', position, [
                'People Coordinator',
                'Design Associate',
                'Team Lead',
              ], (v) => setState(() => position = v)),
              picker('Department', department, [
                'People Operations',
                'Product Design',
                'Business Operations',
              ], (v) => setState(() => department = v)),
            ],
            const SizedBox(height: 20),
            ActionButton(
              widget.employee == null ? 'Add employee' : 'Save changes',
              save,
            ),
            ActionButton(
              'Cancel',
              () => Navigator.pop(context),
              secondary: true,
            ),
            if (error != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  error!,
                  style: const TextStyle(color: charcoal, fontSize: 13),
                ),
              ),
          ],
        ),
      ),
    ],
  );
  Widget picker(
    String label,
    String? value,
    List<String> options,
    ValueChanged<String?> onChanged,
  ) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: forest,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Surface(
          padding: 15,
          onTap: () async {
            final selected = await openPage<String>(
              context,
              ChoicePage<String>(
                store: widget.store,
                title: 'Choose ${label.toLowerCase()}',
                subtitle: name.text,
                selected: value,
                options: {
                  for (final v in {...options, ?value}) v: v,
                },
              ),
            );
            if (selected != null && mounted) onChanged(selected);
          },
          child: Row(
            children: [
              Expanded(child: Text(value ?? 'Choose ${label.toLowerCase()}')),
              const Icon(Icons.expand_more, color: forest),
            ],
          ),
        ),
      ],
    ),
  );
}
