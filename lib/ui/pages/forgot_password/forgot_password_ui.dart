import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_huixin_app/cubit/auth/forgot_password/forgot_password_cubit.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/forgot_password_request_model.dart';
import 'package:flutter_huixin_app/ui/widgets/appbar/appbar_style.dart';
import 'package:flutter_huixin_app/ui/widgets/button.dart';
import 'package:flutter_huixin_app/ui/widgets/dialog_box.dart';
import 'package:flutter_huixin_app/ui/widgets/register_form.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const routeName = '/forgot-password';

  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            loaded: (data) {
              SuccessDialog(
                context: context,
                title: 'Success',
                desc: 'Password has been sent to your email',
                btnOkText: 'OK',
                btnOkOnPress: () {},
              ).show();

              /// Clear the text field
              /// after send the email

              _emailController.clear();
            },
            error: (error) {
              ErrorDialog(
                context: context,
                title: 'Error',
                desc: 'This email doesn\'t associated with any account',
                btnOkText: 'OK',
                btnOkOnPress: () {},
              ).show();
            },
          );
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBarReading(
              title: 'Forgot Password',
              context: context,
            ),
            body: FormBuilder(
              key: _fbKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Lottie.asset(
                    'assets/lottie/password.zip',
                    height: 400,
                    fit: BoxFit.contain,
                  ),
                  RegisterForm(
                    name: 'email',
                    label: 'Email',
                    obscureTextEnabled: 'false',
                    controller: _emailController,
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: PrimaryButton(
                      text: state.maybeWhen(
                        loading: () => '...',
                        orElse: () => 'Send',
                      ),
                      onPressed: () {
                        if (_fbKey.currentState!.saveAndValidate()) {
                          context.loaderOverlay.show();

                          context
                              .read<ForgotPasswordCubit>()
                              .forgotPassword(ForgotPasswordRequestModel(
                                email_penerima: _emailController.text,
                              ))
                              .then((value) {
                            context.loaderOverlay.hide();
                          });
                        } else {
                          debugPrint('Form is invalid');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
