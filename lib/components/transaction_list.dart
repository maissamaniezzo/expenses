import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty 
      ? LayoutBuilder(
          builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                const SizedBox(height: 5),
                Text(
                  'Nenhuma transação cadastrada.',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 15),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          },
        )
      : 
      ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (ctx, index) {
            final tr = transactions[index];
            return TransactionItem(
              key: GlobalObjectKey(tr),
              tr: tr, 
              onRemove: onRemove,
            );
          },
        );
    // ListView(
    //   children: transactions.map((tr) {
    //     return TransactionItem(
    //       key: ValueKey(tr.id),
    //       tr: tr, 
    //       onRemove: onRemove,
    //     );
    //   }).toList(),
    // ); //mas assim, quando vira o cel, ele sorteia novas cores para os circulos
  }
}

