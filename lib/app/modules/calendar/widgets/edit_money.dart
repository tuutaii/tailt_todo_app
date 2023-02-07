import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../widget/common/app_button.dart';

class EditMoney extends StatefulWidget {
  const EditMoney({Key? key}) : super(key: key);

  @override
  State<EditMoney> createState() => _EditMoneyState();
}

class _EditMoneyState extends State<EditMoney> {
  final TextEditingController moneyCtr = TextEditingController();

  void confirm() {
    if (moneyCtr.text.isEmpty) {
      Get.back(result: null);
    } else {
      Get.back(result: moneyCtr.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Text(
            'Edit Money',
            style: context.subtitle1,
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10),
            child: Text(
              'Type some thing to change your money ',
              style: context.subtitle1,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: TextFormField(
                controller: moneyCtr,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(
                    color: Colors.grey[800],
                    fontStyle: FontStyle.italic,
                  ),
                  hintText: 'Empty',
                  fillColor: context.secondary.withOpacity(.5),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: AppButton(
                  'Cancel',
                  onPressed: Get.back,
                  type: ButtonType.text,
                  axisSize: MainAxisSize.max,
                  textColor: context.primary,
                ),
              ),
              Expanded(
                child: AppButton(
                  'OK',
                  axisSize: MainAxisSize.max,
                  onPressed: confirm,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
