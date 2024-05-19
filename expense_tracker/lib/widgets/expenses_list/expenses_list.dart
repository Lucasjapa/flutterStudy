import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
    this.expenses,
    this.onRemoveExpense, {
    super.key,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    // O ListView() serve para gerar a lista na tela com o scroll de forma default,
    // só que nesse caso todos os elementos da lista são gerados no momento de inicialização,
    // indepente dos itens serem visiveis ou não.
    // Já no caso do ListView.builder ele gera a mesma lista com o scroll, sendo que
    // os itens da lista são gerados sobre demanda, ou seja, caso estejam pertos de ser
    // visualizados, eles vão sendo instanciados.
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
