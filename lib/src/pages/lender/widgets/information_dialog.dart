import 'package:flutter/material.dart';

class SummeryDialog extends StatelessWidget {
  const SummeryDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please confirm your offer and that you will be able to back",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 18,
                    color: Colors.black38,
                  ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: RichText(
                  text: TextSpan(
                      text: "600,000",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.green,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                      children: [
                        TextSpan(
                          text: " UGX",
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.orangeAccent,
                                    fontSize: 18,
                                  ),
                        )
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Table(
              border: TableBorder.all(color: Colors.black12),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    HeaderTableCell(
                      label: "Amount",
                    ),
                    HeaderTableCell(
                      label: "Duration",
                    ),
                    HeaderTableCell(
                      label: "Interest",
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    DataTableCell(
                      amount: "450, 000",
                      units: "UGX",
                    ),
                    DataTableCell(
                      amount: "2",
                      units: "Months",
                    ),
                    DataTableCell(
                      amount: "6",
                      units: "%",
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    onSurface: Colors.blue.withOpacity(.4),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    onSurface: Colors.blue.withOpacity(.4),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class DataTableCell extends StatelessWidget {
  final String amount;
  final String units;
  const DataTableCell({
    Key? key,
    required this.amount,
    required this.units,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: RichText(
        text: TextSpan(
          text: amount,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.orangeAccent,
                fontSize: 16,
              ),
          children: [
            TextSpan(
              text: " $units",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.blue,
                    fontSize: 10,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderTableCell extends StatelessWidget {
  final String label;
  const HeaderTableCell({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 18,
                color: Colors.black38,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
