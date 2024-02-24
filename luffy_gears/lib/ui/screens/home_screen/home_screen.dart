import 'dart:convert';
import 'dart:developer';
import 'package:connect_native/assets.dart';
import 'package:connect_native/models/logo_status.dart';
import 'package:connect_native/ui/components/circular_image.dart';
import 'package:connect_native/ui/screens/bloc/home_state_manage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'mixin/home_screen_mixin.dart';

final class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


///only for ui
class _MyHomePageState extends State<MyHomePage> with _MyHomePageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeStateManageBloc, HomeStateManageState>(
        builder: (context, state) {
      if (state is HomeStateManageInitial) {
        return AlertDialog(
            content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          child: Builder(builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ));
      } else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              circularImage(logoStatus: selectedLogo, height: 200, width: 200),
              const SizedBox(
                height: 10,
              ),
              Text(selectedLogo.logoName!,
                  style: const TextStyle(fontSize: 20)),
            ],
          )),
          floatingActionButton: FloatingActionButton(
            onPressed: showAppIcons,
            child: const Icon(Icons.edit),
          ),
        );
      }
    });
  }

  void showAppIcons() {
    LogoStatus tempselectedLogo = selectedLogo;
    List<LogoStatus> tempLogoStatus = logoStatus;
    showDialog(
        context: context,
        builder: (context) {
          // return const OwnDialog();
          return BlocProvider(
            create: (context) => HomeStateManageBloc(),
            child: BlocBuilder<HomeStateManageBloc, HomeStateManageState>(
              builder: (context, state) {
                return AlertDialog(
                  contentPadding: const EdgeInsets.all(8),
                  content: SizedBox(
                    height: 200,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        circularImage(
                            logoStatus: tempselectedLogo,
                            height: 100,
                            width: 100),
                        Text(tempselectedLogo.logoName!),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 70,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: tempLogoStatus.length,
                              itemBuilder: (BuildContext context, int index) {
                                return circularImage(
                                    logoStatus: tempLogoStatus[index],
                                    height: 55,
                                    width: 55,
                                    onTap: () {
                                      if (!tempLogoStatus[index].isSet!) {
                                        tempselectedLogo =
                                            tempLogoStatus[index];
                                        for (var dia in tempLogoStatus) {
                                          dia.isSet = false;
                                        }
                                        tempselectedLogo.isSet = true;
                                        BlocProvider.of<HomeStateManageBloc>(
                                                context)
                                            .add(ChangePicEvent(
                                                logoStatus: tempLogoStatus));
                                      }
                                    });
                              }),
                        )
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel')),
                    TextButton(
                        onPressed: () {
                          selectedLogo = tempselectedLogo;
                          logoStatus = tempLogoStatus;
                          setState(() {});
                          Navigator.of(context).pop('set');
                        },
                        child: const Text('Set'))
                  ],
                );
              },
            ),
          );
        }).then((value) {
      if (value == 'set') {
        set(selectedLogo.methodName!);
      }
    });
  }
}

class OwnDialog extends StatefulWidget {
  const OwnDialog({super.key});

  @override
  State<OwnDialog> createState() => _OwnDialogState();
}

class _OwnDialogState extends State<OwnDialog> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
