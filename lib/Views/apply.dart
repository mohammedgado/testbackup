import 'package:flutter/material.dart';
import 'package:recruitment/Helper/Constants.dart';
import 'package:recruitment/Helper/responsive.dart';
import 'package:recruitment/Managers/LayoutManager.dart';
import 'package:recruitment/Views/Shared/appBar.dart';

class ApplyView extends StatefulWidget {
  const ApplyView({super.key});

  @override
  State<ApplyView> createState() => _ApplyViewState();
}

class _ApplyViewState extends State<ApplyView> {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        widgetContext: context,
        showBackButton: true,
        showLogo: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: layoutManager.mainHorizontalPadding()),
        child: ListView(
          children: [
            const SizedBox(height: 24),
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset('images/profile.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'LinkYou',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appDesign.colorPrimary,
                fontSize: 22,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Basic information',
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 17,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(
                  Icons.phone,
                  color: appDesign.colorPrimary,
                ),
                SizedBox(width: 8),
                Text(
                  '+12345678923',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF484C52),
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(
                  Icons.email,
                  color: appDesign.colorPrimary,
                ),
                SizedBox(width: 8),
                Text(
                  'info@linkyou.ca',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF484C52),
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: appDesign.colorPrimary,
                ),
                SizedBox(width: 8),
                Text(
                  'Toronto, Canada',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF484C52),
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Career',
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 17,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  // width: Dimensions.widthPercentage(context, 28),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x0F101828),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(children: [
                    Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF008DC9),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      child: const Icon(
                        Icons.paste_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Applied jobs',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0.07,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      '7',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1E293B),
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.36,
                      ),
                    )
                  ]),
                ),
                Container(
                  width: Dimensions.widthPercentage(context, 30),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x0F101828),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(children: [
                    Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFA869D6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      child: const Icon(
                        Icons.bookmark_border_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Saved jobs',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0.07,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      '15',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1E293B),
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.36,
                      ),
                    )
                  ]),
                ),
                Container(
                  width: Dimensions.widthPercentage(context, 30),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x0F101828),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(children: [
                    Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF86C157),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      child: const Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Job alerts',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0.07,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      '2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1E293B),
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.36,
                      ),
                    )
                  ]),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Resume',
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 17,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                RadioMenuButton(
                  value: true,
                  groupValue: true,
                  onChanged: (value) {},
                  child: const Row(
                    children: [
                      Icon(
                        Icons.picture_as_pdf,
                        color: Colors.red,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Software engineer.pdf',
                        style: TextStyle(
                          color: Color(0xFF565656),
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'X Remove',
                    style: TextStyle(
                      color: Color(0xFFF14336),
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: () {},
                color: appDesign.colorPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Wrap(alignment: WrapAlignment.center, children: [
                  Text(
                    'Upload resume',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.upload_rounded,
                    color: Colors.white,
                  )
                ]),
              ),
            ),
            const Text(
              'Cover letter',
              style: TextStyle(
                color: Color(0xFF1E1E1E),
                fontSize: 17,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.text,
              controller: textController,
              maxLines: 5,
              maxLength: 400,
              style: TextStyle(
                fontFamily: '.SF Arabic',
                fontSize: Dimensions.fontSize(context, 1.2),
              ),
              decoration: const InputDecoration(
                hintText: 'Input text field here',
                hintStyle: TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                    // borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'highlight your qualifications',
              style: TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: () {},
                color: appDesign.colorPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Wrap(alignment: WrapAlignment.center, children: [
                  Text(
                    'Upload cover letter',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.upload_rounded,
                    color: Colors.white,
                  )
                ]),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
