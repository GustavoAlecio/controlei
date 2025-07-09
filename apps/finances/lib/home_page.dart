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
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final categories = ref.read(accountsProvider.notifier).allCategories;
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(accountsProvider.notifier);
    final categories = ref.read(accountsProvider.notifier).allCategories;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finances Home'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: categories.map((cat) => Tab(text: cat)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: categories.map((category) {
          final accounts = state.accountsByCategory(category);
          return ListView.builder(
            itemCount: accounts.length,
            itemBuilder: (context, index) {
              final account = accounts[index];
              return ListTile(
                title: Text(account.name),
                subtitle: Text(
                    '${account.amount.toStringAsFixed(2)} • ${account.status.name}'),
              );
            },
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.pushNamed(AccountRoutes.createAccountView);
          ref.invalidate(accountsProvider);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
