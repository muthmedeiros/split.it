import 'package:flutter/material.dart';
import 'package:split_it/modules/theme/app_theme.dart';

class PayAndReceiveContainerWidget extends StatelessWidget {
  final bool receive;
  final String amount;

  const PayAndReceiveContainerWidget({
    Key? key,
    required this.receive,
    required this.amount,
  }) : super(key: key);

  String get _textReceivePay => receive ? 'A receber' : 'A pagar';

  Color get _littleBoxBackground => receive
      ? AppTheme.colors.receiveAmountText.withOpacity(0.1)
      : AppTheme.colors.payAmountText.withOpacity(0.1);

  TextStyle get _amountTextStyle => receive
      ? AppTheme.textStyles.receiveAmount
      : AppTheme.textStyles.payAmount;

  String get _imageUrl =>
      receive ? 'assets/images/moneyIn.png' : 'assets/images/moneyOut.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 168,
      decoration: BoxDecoration(
        color: AppTheme.colors.appBarContainers,
        border: Border.fromBorderSide(
          BorderSide(
            width: 1,
            color: AppTheme.colors.appBarContainersBorder,
          ),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              left: 16.0,
              bottom: 40.0,
            ),
            child: Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: _littleBoxBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(_imageUrl),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              bottom: 4.0,
            ),
            child: Row(
              children: [
                Text(
                  _textReceivePay,
                  style: AppTheme.textStyles.receiveOrPay,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              bottom: 16.0,
            ),
            child: Row(
              children: [
                Text(
                  'R\$ $amount',
                  style: _amountTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
