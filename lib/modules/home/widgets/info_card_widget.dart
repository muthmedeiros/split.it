import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/icon_dolar_widget.dart';
import 'package:split_it/modules/home/widgets/loading_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class InfoCardWidget extends StatelessWidget {
  final double value;
  final bool isLoading;

  const InfoCardWidget({
    Key? key,
    required this.value,
    this.isLoading = false,
  }) : super(key: key);

  String get _title => value >= 0 ? 'A receber' : 'A pagar';

  TextStyle get _amountTextStyle => value >= 0
      ? AppTheme.textStyles.receiveAmount
      : AppTheme.textStyles.payAmount;

  IconDolarType get _iconDollarType =>
      value >= 0 ? IconDolarType.receive : IconDolarType.send;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 168,
      padding: const EdgeInsets.all(16.0),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconDolarWidget(type: _iconDollarType),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _title,
                style: AppTheme.textStyles.infoCardTitle,
              ),
              SizedBox(
                height: 4,
              ),
              if (isLoading) ...[
                LoadingWidget(size: Size(94, 24))
              ] else ...[
                Text(
                  'R\$ ${value.toStringAsFixed(2)}',
                  style: _amountTextStyle,
                ),
              ]
            ],
          ),
        ],
      ),
    );
  }
}
