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
      ActionButton(
        'Departments and positions',
        () => openPage(context, CatalogPage(store: store)),
        secondary: true,
      ),
      if (store.syncError != null) Text(store.syncError!),
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
      trailing: e.active && e.id != store.ownEmployeeId
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
              if (store.backend != null)
                DetailRow('Login', e.hasLogin ? 'Created' : 'Not created'),
            ],
          ),
        ),
        const SizedBox(height: 30),
        if (e.active && !e.hasLogin && store.backend != null)
          ActionButton(
            'Create login',
            () => openPage(context, CreateLoginPage(store: store, employee: e)),
          ),
        if (e.active)
          ActionButton(
            'Edit employee',
            () => openPage(context, EmployeeForm(store: store, employee: e)),
          ),
        if (e.active && e.id != store.ownEmployeeId)
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
              final error = await store.setEmployeeActive(e, false);
              if (context.mounted) {
                toast(context, error ?? '${e.name} is now inactive.');
              }
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
    final own = store.ownEmployeeId == null
        ? null
        : store.employee(store.ownEmployeeId!);
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
                  (e ?? own)?.initials ?? 'AP',
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
                    Heading((e ?? own)?.name ?? 'Arun Patel', size: 22),
                    Text(store.isHr ? 'HR Admin' : 'Employee'),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        EntryTile('Work email', e?.email ?? store.accountEmail, icon: 'mail'),
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
        if (store.canSwitchWorkspace)
          ActionButton(
            store.isHr ? 'Switch to my employee view' : 'Switch to HR view',
            store.switchWorkspace,
          ),
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

  bool saving = false;

  Future<void> save() async {
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
    if (!valid || saving) return;
    setState(() {
      error = null;
      saving = true;
    });
    final s = widget.store, e = widget.employee;
    final result = widget.contactOnly
        ? await s.saveContact(e!, mobile.text, personal.text)
        : await s.saveEmployee(
            existing: e,
            name: name.text,
            email: email.text,
            mobile: mobile.text,
            position: position!,
            department: department!,
          );
    if (!mounted) return;
    setState(() => saving = false);
    if (result != null) {
      toast(context, result);
      return;
    }
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
              picker(
                'Position',
                position,
                widget.store.positions,
                (v) => setState(() => position = v),
              ),
              picker(
                'Department',
                department,
                widget.store.departments,
                (v) => setState(() => department = v),
              ),
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

/// HR creates a Supabase login with a temporary password for an employee.
class CreateLoginPage extends StatefulWidget {
  const CreateLoginPage({
    super.key,
    required this.store,
    required this.employee,
  });
  final HrStore store;
  final Employee employee;
  @override
  State<CreateLoginPage> createState() => _CreateLoginPageState();
}

class _CreateLoginPageState extends State<CreateLoginPage> {
  final password = TextEditingController();
  bool saving = false;
  String? error;

  @override
  void dispose() {
    password.dispose();
    super.dispose();
  }

  Future<void> create() async {
    if (saving) return;
    setState(() {
      saving = true;
      error = null;
    });
    final result = await widget.store.createLogin(
      widget.employee,
      password.text,
    );
    if (!mounted) return;
    if (result != null) {
      setState(() {
        saving = false;
        error = result;
      });
      return;
    }
    Navigator.pop(context);
    toast(context, 'Login created for ${widget.employee.email}.');
  }

  @override
  Widget build(BuildContext context) => HrPage(
    store: widget.store,
    title: 'Create login',
    back: 'Record',
    builder: (context) => [
      Text(
        '${widget.employee.name} will sign in with '
        '${widget.employee.email} and this temporary password. '
        'Give it to them privately.',
      ),
      const SizedBox(height: 30),
      LabeledField(
        'Temporary password',
        password,
        hint: 'At least 8 characters',
      ),
      const SizedBox(height: 20),
      ActionButton(saving ? 'Creating…' : 'Create login', create),
      ActionButton('Cancel', () => Navigator.pop(context), secondary: true),
      if (error != null) Text(error!),
    ],
  );
}

/// HR views and adds departments and positions.
class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key, required this.store});
  final HrStore store;

  Future<void> add(BuildContext context, String kind) async {
    final value = await showDialog<String>(
      context: context,
      builder: (context) => _NameDialog(kind: kind),
    );
    if (value == null) return;
    final error = kind == 'department'
        ? await store.addDepartment(value)
        : await store.addPosition(value);
    if (context.mounted) toast(context, error ?? 'Added ${value.trim()}.');
  }

  @override
  Widget build(BuildContext context) => HrPage(
    store: store,
    title: 'Departments and positions',
    back: 'Employees',
    builder: (context) => [
      const Heading('Departments', size: 20),
      const SizedBox(height: 14),
      for (final d in store.departments) EntryTile(d, ''),
      ActionButton('+ Add department', () => add(context, 'department')),
      const SizedBox(height: 28),
      const Heading('Positions', size: 20),
      const SizedBox(height: 14),
      for (final p in store.positions) EntryTile(p, ''),
      ActionButton('+ Add position', () => add(context, 'position')),
    ],
  );
}

/// Asks for a department or position name. Owns its text controller so the
/// controller outlives the dialog's closing animation.
class _NameDialog extends StatefulWidget {
  const _NameDialog({required this.kind});
  final String kind;
  @override
  State<_NameDialog> createState() => _NameDialogState();
}

class _NameDialogState extends State<_NameDialog> {
  final name = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final kind = widget.kind;
    return AlertDialog(
      title: Text('Add $kind'),
      content: TextField(
        controller: name,
        autofocus: true,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          hintText: '${kind[0].toUpperCase()}${kind.substring(1)} name',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, name.text),
          child: const Text('Add'),
        ),
      ],
    );
  }
}
