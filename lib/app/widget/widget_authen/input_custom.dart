import '../../core/styles/style.dart';

class InputCustom extends StatelessWidget {
  const InputCustom({
    Key? key,
    required this.controller,
    this.validator,
    required this.titleInput,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String titleInput, hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleInput,
          style: context.subtitle1.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              filled: true,
              hintStyle: TextStyle(
                color: Colors.grey[800],
                fontStyle: FontStyle.italic,
              ),
              hintText: hintText,
              fillColor: context.secondary.withOpacity(.5),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
