import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:resonate/controllers/auth_state_controller.dart';
import 'package:resonate/utils/colors.dart';

import '../../controllers/email_verify_controller.dart';
import '../widgets/custom_card.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({final Key? key}) : super(key: key);
 
  final  emailVerifyController= Get.find<EmailVerifyController>();

  AuthStateController authStateController =
      Get.put<AuthStateController>(AuthStateController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthStateController>(
<<<<<<< HEAD
      builder: (controller) => Scaffold(
        body: Obx(
          () => Center(
              child: Stack(children: [
            controller.isInitializing.value
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Center(
                        child: LoadingAnimationWidget.threeRotatingDots(
                            color: Colors.amber, size: Get.pixelRatio * 20)),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 0.0365 * Get.height,
                        ),
                        Container(
                          width: 0.364 * Get.width,
                          height: 0.182 * Get.height,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.amber, width: 0.009 * Get.width),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                  controller.profileImageUrl ?? ''),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () {
                                    emailVerifyController.pressed.value =
                                        !(emailVerifyController.pressed.value);
                                    if (emailVerifyController.pressed.value == false) {
                                      emailVerifyController.shouldDisplay.value =
                                          false;
                                    }
                                  },
                                  child: AnimatedContainer(
                                      onEnd: () {
                                        if (emailVerifyController.pressed.value ==
                                            true) {
                                          emailVerifyController.shouldDisplay.value =
                                              true;
                                        }
                                      },
                                      width: emailVerifyController.pressed.value
                                          ? 0.339 * Get.width
                                          : 0.07286 * Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: controller.isEmailVerified!
                                          ? Row(
                                              children: [
                                                Icon(
                                                  Icons.verified_rounded,
                                                  color: AppColor.greenColor,
                                                  size: 0.018 * Get.height +
                                                      0.036 * Get.width,
                                                ),
                                                emailVerifyController
                                                        .shouldDisplay.value
                                                    ? SizedBox(
                                                        width:
                                                            0.012 * Get.width,
                                                      )
                                                    : const SizedBox(),
                                                emailVerifyController
                                                        .shouldDisplay.value
                                                    ? Text(
                                                        "Email Verified",
                                                        style: TextStyle(
                                                            fontSize: 0.0085 *
                                                                    Get.height +
                                                                0.017 *
                                                                    Get.width,
                                                            color:
                                                                Colors.black),
                                                      )
                                                    : const SizedBox()
                                              ],
                                            )
                                          : Row(
                                              mainAxisAlignment: emailVerifyController
                                                      .pressed.value
                                                  ? MainAxisAlignment.start
                                                  : MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.cancel_rounded,
                                                  color: const Color.fromARGB(
                                                      255, 236, 53, 40),
                                                  size: 0.018 * Get.height +
                                                      0.036 * Get.width,
                                                ),
                                                emailVerifyController
                                                        .shouldDisplay.value
                                                    ? SizedBox(
                                                        width: 0.0121536 *
                                                            Get.width,
                                                      )
                                                    : const SizedBox(
                                                        height: 0,
                                                        width: 0,
                                                      ),
                                                emailVerifyController
                                                        .shouldDisplay.value
                                                    ? Text(
                                                        "Verify Email",
                                                        style: TextStyle(
                                                            fontSize: 0.0085 *
                                                                    Get.height +
                                                                0.017 *
                                                                    Get.width,
                                                            color:
                                                                Colors.black),
                                                      )
                                                    : const SizedBox(
                                                        height: 0,
                                                        width: 0,
                                                      )
                                              ],
                                            )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 0.024 * Get.height),
                        SizedBox(
                          width: 0.77783 * Get.width,
                          height: 0.0633 * Get.height,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "@ ${controller.userName}",
                              style: TextStyle(
                                  fontSize:
                                      0.021 * Get.height + 0.0425 * Get.width,
                                  color: Colors.amber),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 0.77783 * Get.width,
                          height: 0.045 * Get.height,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              controller.displayName.toString(),
                              style: TextStyle(
                                  fontSize:
                                      0.01521 * Get.height + 0.03 * Get.width),
                            ),
                          ),
                        ),
                        Text(
                          controller.email.toString(),
                          style: TextStyle(
                              fontSize:
                                  0.0109 * Get.height + 0.0218 * Get.width,
                              color: Colors.white70),
                        ),
                        SizedBox(height: 0.017 * Get.height),
                        !(controller.isEmailVerified!)
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Material(
                                  child: InkWell(
                                    highlightColor:
                                        const Color.fromARGB(138, 33, 140, 14),
                                    splashColor:
                                        const Color.fromARGB(172, 43, 174, 20),
                                    onTap: () => {
                                      emailVerifyController.isSending.value = true,
                                      emailVerifyController.sendOTP()
                                    },
                                    child: Ink(
                                        height: 0.048 * Get.height,
                                        width: 0.34 * Get.width,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                235, 111, 88, 5),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Colors.amber, width: 3)),
                                        child: Center(
                                          child: Text(
                                            "Verify Email",
                                            style: TextStyle(
                                              fontSize: 0.0085 * Get.height +
                                                  0.017 * Get.width,
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        SizedBox(height: 0.0097 * Get.height),
                        CustomCard(
                          title: "Contribute to the project",
                          icon: FontAwesomeIcons.github,
                          onTap: () {
                            //TODO: Open Github Repo Link
                          },
                        ),
                        CustomCard(
                          title: "Terms and Conditions",
                          icon: FontAwesomeIcons.fileInvoice,
                          onTap: () {
                            //TODO: Launch URL in webview
                          },
                        ),
                        CustomCard(
                          title: "Privacy Policy",
                          icon: FontAwesomeIcons.shieldHalved,
                          onTap: () {
                            //TODO: Launch URL in webview
                          },
                        ),
                      ],
                    ),
                  ),
            emailVerifyController.isSending.value
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Center(
                        child: LoadingAnimationWidget.threeRotatingDots(
                            color: Colors.amber, size: Get.pixelRatio * 20)),
                  )
                : const SizedBox(),
          ])),
        ),
      ),
    );
=======
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: const Text("Profile"),
              ),
              body: Obx(
                () => Center(
                    child: Stack(children: [
                  controller.isInitializing.value
                      ? BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Center(
                              child: LoadingAnimationWidget.threeRotatingDots(
                                  color: Colors.amber,
                                  size: Get.pixelRatio * 20)),
                        )
                      : Column(
                          children: <Widget>[
                            SizedBox(
                              height: Get.height * 0.06,
                            ),
                            Container(
                              width: 0.364 * Get.width,
                              height: 0.182 * Get.height,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.amber,
                                    width: 0.009 * Get.width),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      controller.profileImageUrl ?? ''),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.isPressed.value =
                                            !(controller.isPressed.value);
                                        if (controller.isPressed.value ==
                                            false) {
                                          controller.shouldDisplay.value =
                                              false;
                                        }
                                      },
                                      child: AnimatedContainer(
                                          onEnd: () {
                                            if (controller.isPressed.value ==
                                                true) {
                                              controller.shouldDisplay.value =
                                                  true;
                                            }
                                          },
                                          width: controller.isPressed.value
                                              ? 0.34 * Get.width
                                              : 0.073 * Get.width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white,
                                          ),
                                          duration:
                                              const Duration(milliseconds: 300),
                                          child: controller.isEmailVerified!
                                              ? Row(
                                                  children: [
                                                    Icon(
                                                      Icons.verified_rounded,
                                                      color:
                                                          AppColor.greenColor,
                                                      size:
                                                          8.28 * Get.pixelRatio,
                                                    ),
                                                    controller
                                                            .shouldDisplay.value
                                                        ? SizedBox(
                                                            width: 0.012 *
                                                                Get.width,
                                                          )
                                                        : const SizedBox(),
                                                    controller
                                                            .shouldDisplay.value
                                                        ? const Text(
                                                            "Email Verified",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          )
                                                        : const SizedBox()
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    Icon(
                                                      Icons.cancel_rounded,
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 236, 53, 40),
                                                      size:
                                                          8.28 * Get.pixelRatio,
                                                    ),
                                                    controller
                                                            .shouldDisplay.value
                                                        ? SizedBox(
                                                            width: 0.012 *
                                                                Get.width,
                                                          )
                                                        : const SizedBox(),
                                                    controller
                                                            .shouldDisplay.value
                                                        ? const Text(
                                                            "Verify Email",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          )
                                                        : const SizedBox()
                                                  ],
                                                )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 0.029 * Get.height),
                            Text(
                              "@ ${controller.userName}",
                              style: TextStyle(
                                  fontSize: 10 * Get.pixelRatio,
                                  color: Colors.amber),
                            ),
                            Text(
                              controller.displayName.toString(),
                              style:
                                  TextStyle(fontSize: 7.142 * Get.pixelRatio),
                            ),
                            Text(
                              controller.email.toString(),
                              style: TextStyle(
                                  fontSize: 5.142 * Get.pixelRatio,
                                  color: Colors.white70),
                            ),
                            SizedBox(height: 0.017 * Get.height),
                            !(controller.isEmailVerified!)
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Material(
                                      child: InkWell(
                                        highlightColor: const Color.fromARGB(
                                            138, 33, 140, 14),
                                        splashColor: const Color.fromARGB(
                                            172, 43, 174, 20),
                                        onTap: () => {
                                          controller.isSending.value = true,
                                          authController.sendOTP()
                                        },
                                        child: Ink(
                                            height: 0.048 * Get.height,
                                            width: 0.34 * Get.width,
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    235, 111, 88, 5),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: Colors.amber,
                                                    width: 3)),
                                            child: const Center(
                                              child: Text("Verify Email"),
                                            )),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            SizedBox(height: 0.0097 * Get.height),
                            CustomCard(
                              title: "Contribute to the project",
                              icon: FontAwesomeIcons.github,
                              onTap: () {
                                //TODO: Open Github Repo Link
                              },
                            ),
                            CustomCard(
                              title: "Terms and Conditions",
                              icon: FontAwesomeIcons.fileInvoice,
                              onTap: () {
                                //TODO: Launch URL in webview
                              },
                            ),
                            CustomCard(
                              title: "Privacy Policy",
                              icon: FontAwesomeIcons.shieldHalved,
                              onTap: () {
                                //TODO: Launch URL in webview
                              },
                            ),
                            CustomCard(
                              title: "Logout",
                              icon: Icons.exit_to_app_outlined,
                              onTap: () async {
                                //TODO: Launch URL in webview
                                await authStateController.logout();
                              },
                            ),
                          ],
                        ),
                  controller.isSending.value
                      ? BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Center(
                              child: LoadingAnimationWidget.threeRotatingDots(
                                  color: Colors.amber,
                                  size: Get.pixelRatio * 20)),
                        )
                      : const SizedBox(),
                ])),
              ),
            ));
>>>>>>> a31f6c08e59d7fb322d7f66ba2f74839f01d3936
  }
}
