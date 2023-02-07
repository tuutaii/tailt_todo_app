import 'package:get/get.dart';

import '../../../core/styles/style.dart';
import '../../../widget/common/app_button.dart';

class EditTitle extends StatefulWidget {
  const EditTitle({Key? key}) : super(key: key);

  @override
  State<EditTitle> createState() => _EditTitleState();
}

class _EditTitleState extends State<EditTitle> {
  final TextEditingController titleCtr = TextEditingController();
  void confirm() {
    if (titleCtr.text.isEmpty) {
      Get.back(result: null);
    } else {
      Get.back(result: titleCtr.text);
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
            'Change your Title',
            style: context.subtitle1,
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10),
            child: Text(
              'Type some thing to change your title ',
              style: context.subtitle1,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: TextFormField(
                controller: titleCtr,
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
