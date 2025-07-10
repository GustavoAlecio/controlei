import 'package:accounts/accounts.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  List<String> _previousCategories = [];

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _updateTabController(List<String> categories) {
    if (_tabController == null ||
        categories.length != _previousCategories.length ||
        !_previousCategories.every((c) => categories.contains(c))) {
      _tabController?.dispose();
      _tabController = TabController(
        length: categories.length,
        vsync: this,
      );
      _previousCategories = categories;
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(accountsProvider);
    final stateNotifier = ref.watch(accountsProvider.notifier);

    return asyncState.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(
        body: Center(child: Text('Erro: $e')),
      ),
      data: (state) {
        final categories = state.categories;
        _updateTabController(categories);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Finances Home'),
            bottom: _tabController != null
                ? TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabs: categories.map((cat) => Tab(text: cat)).toList(),
                  )
                : null,
          ),
          body: _tabController != null
              ? TabBarView(
                  controller: _tabController,
                  children: categories.map((category) {
                    final accounts = stateNotifier.accountsByCategory(category);
                    final total = accounts.fold(
                        0.0, (sum, acc) => sum + acc.amount.value);
                    final paid = accounts
                        .where((acc) => acc.status == PaymentStatus.paid)
                        .fold(0.0, (sum, acc) => sum + acc.amount.value);
                    final pending = total - paid;

                    return LayoutBuilder(
                      builder: (context, constraints) {
                        final width = constraints.maxWidth;
                        final crossAxisCount = (width ~/ 300).clamp(1, 4); // cada card ~300px

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildAmountInfo('Total', total),
                                  _buildAmountInfo('Pago', paid),
                                  _buildAmountInfo('Pendente', pending),
                                ],
                              ),
                            ),
                            Expanded(
                              child: GridView.builder(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  childAspectRatio: 1.5,
                                ),
                                itemCount: accounts.length,
                                itemBuilder: (context, index) {
                                  final account = accounts[index];
                                  return AccountCard(
                                    account: account,
                                    onMarkAsPaid: () => stateNotifier.markAsPaid(account.id),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    );

                  }).toList(),
                )
              : const Center(child: Text('Sem categorias')),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await context.pushNamed(AccountRoutes.createAccountView);
              ref.invalidate(accountsProvider);
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
  Widget _buildAmountInfo(String label, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          'R\$ $value', // extensão do seu design system
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
