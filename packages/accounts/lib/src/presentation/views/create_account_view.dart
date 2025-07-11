import 'package:accounts/account_providers.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../extensions/extensions.dart';
import '../notifiers/notifiers.dart' show accountsProvider;

class AddAccountView extends ConsumerStatefulWidget {
  const AddAccountView({super.key});

  @override
  ConsumerState<AddAccountView> createState() => _AddAccountViewState();
}

class _AddAccountViewState extends ConsumerState<AddAccountView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _moneyController = TextEditingController();
  final _installmentsController = TextEditingController();
  final _categoryController = TextEditingController();

  AccountType type = AccountType.single;
  DateTime? _dueDate;
  bool _isPaid = false;

  @override
  void dispose() {
    _nameController.dispose();
    _moneyController.dispose();
    _installmentsController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (!_formKey.currentState!.validate() || _dueDate == null) return;
    final amount = Amount.fromText(_moneyController.text);
    final account = Account(
      name: _nameController.text,
      amount: amount,
      type: type,
      installmentInfo: type == AccountType.installment
          ? InstallmentInfo(
              current: 1,
              total: int.tryParse(_installmentsController.text) ?? 1,
            )
          : const InstallmentInfo(),
      dueDate: _dueDate ?? DateTime.now(),
      category: _categoryController.text,
      status: _isPaid ? PaymentStatus.paid : PaymentStatus.pending,
    );

    final useCase = ref.read(createAccountUseCaseProvider);
    final result = await useCase(account);

    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failure.message)),
        );
      },
      (_) {
        ref.read(accountsProvider.notifier).load();
        context.pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final showInstallments = type == AccountType.installment;

    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar Conta')),
      body: Center(
        child: SizedBox(
          width: 500,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  AppInput(
                    controller: _nameController,
                    label: 'Nome',
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Campo obrigatório' : null,
                  ),
                  const SizedBox(height: 16),
                  AppMoneyInput(
                    controller: _moneyController,
                    label: 'Valor',
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                  ),
                  const SizedBox(height: 16),
                  AppDropdown<String>(
                    label: 'Tipo',
                    value: type.name,
                    items: AccountType.values.map((e) => e.name).toList(),
                    itemBuilder: (type) => type,
                    onChanged: (value) => setState(
                      () => type = AccountType.values.firstWhere(
                        (e) => e.name == value!,
                      ),
                    ),
                  ),
                  if (showInstallments) ...[
                    const SizedBox(height: 16),
                    AppInput(
                      controller: _installmentsController,
                      label: 'Parcelas',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (showInstallments &&
                            (value == null || value.isEmpty)) {
                          return 'Informe o número de parcelas';
                        }
                        return null;
                      },
                    ),
                  ],
                  const SizedBox(height: 16),
                  AppDatePicker(
                    label: 'Vencimento',
                    selectedDate: _dueDate,
                    onDateSelected: (date) => setState(() => _dueDate = date),
                  ),
                  const SizedBox(height: 16),
                  AppInput(
                    controller: _categoryController,
                    label: 'Categoria',
                  ),
                  const SizedBox(height: 16),
                  SwitchListTile.adaptive(
                    title: Text(
                      'Marcar como paga',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    value: _isPaid,
                    onChanged: (value) => setState(() => _isPaid = value),
                  ),
                  const SizedBox(height: 24),
                  AppButton.primary(
                    onPressed: _submit,
                    label: 'Salvar Conta',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
