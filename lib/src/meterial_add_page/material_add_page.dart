import 'package:flutter/material.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:warehouse/src/meterial_add_page/helmet_form.dart';
import 'package:warehouse/src/meterial_add_page/icon_label.dart';
import 'package:warehouse/src/navigation/app_page.dart';

class MaterialAddPage extends AppPage {
  MaterialAddPage()
      : super(
          builder: (context) => const _MaterialAddPageView(),
        );
}

class _MaterialAddPageView extends HookWidget {
  const _MaterialAddPageView();

  @override
  Widget build(BuildContext context) {
    //final MaterialRepository _materialRepository = context.read();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Center(
          child: Text('Add material'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
                'Select the categpry and complete the form to add a new item to the warehouse'),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Category: '),
          DropdownButton<IconLabel>(
            hint: const Text('Please, select item'),
            // value: value,
            // onChanged: (IconLabel? value) {
            //   setState(() {
            //     _selectedItem = value;
            //   });
            // },
            items: IconLabel.values.map((iconLabel) {
              return DropdownMenuItem<IconLabel>(
                value: iconLabel,
                child: Row(
                  children: <Widget>[
                    Icon(iconLabel.icon),
                    const SizedBox(width: 10),
                    Text(iconLabel.label),
                  ],
                ),
              );
            }).toList(),
            onChanged: (value) {},
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HelmetForm(),
              ],
            ),
          ),
          // ElevatedButton(
          //   onPressed: () async {
          //     //  await  _materialRepository.addHelmetItem('test', 1);
          //     //  MaterialListRoute().go(context);
          //   },
          //   child: const Text('Material ADD PAGE'),
          // ),
        ],
      ),
    );
  }
}



  // items: IconLabel.values
              //     .map<DropdownMenuEntry<IconLabel>>((IconLabel color) {
              //   return DropdownMenuEntry<IconLabel>(
              //     value: color,
              //     label: color.label,
              //     enabled: color.label != 'Grey',
              //     style: MenuItemButton.styleFrom(
              //       foregroundColor: color.color,
              //     ),
              //   );
              // }).toList(),
              // items: <String>['Helmet', 'Ladder', 'ScaffoldPart']
              //     .map((String value) {
              //   return DropdownMenuItem<String>(
              //     value: value,
              //     child: Row(children: [
              //       Icon(Icons.add),
              //       Text(value),
              //     ]),
              //   );
              // }).toList(),
