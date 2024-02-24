part of '../home_screen.dart';


///to check conditions
mixin _MyHomePageMixin on State<MyHomePage> {
  List<LogoStatus> logoStatus = [];
  LogoStatus selectedLogo = LogoStatus();
  Assets assets = Assets();

  @override
  void initState() {
    super.initState();
    _checkAppLogo();
  }

  Future<void> _checkAppLogo() async {
    var perf = await SharedPreferences.getInstance();
    String? logos = perf.getString('Logos');
    if (logos != null) {
      var resData = jsonDecode(logos);
      logoStatus = (resData as List)
          .map(
            (e) => LogoStatus.fromJson(e),
          )
          .toList();
    } else {
      LogoStatus secondgear = LogoStatus(
          logoName: 'Second Gear',
          methodName: 'setSecondGear',
          logoAssets: assets.gear2,
          isSet: true);
      LogoStatus thirdgear = LogoStatus(
          logoName: 'Third Gear',
          methodName: 'setThirdGear',
          logoAssets: assets.gear3,
          isSet: false);
      LogoStatus gearfour = LogoStatus(
          logoName: 'Gear Four',
          methodName: 'setGearFour',
          logoAssets: assets.gear4,
          isSet: false);
      LogoStatus gearfive = LogoStatus(
          logoName: 'Gear Five',
          methodName: 'setGearFive',
          logoAssets: assets.gear5,
          isSet: false);

      logoStatus = [secondgear, thirdgear, gearfour, gearfive];
    }
    for (int i = 0; i < logoStatus.length; i++) {
      if (logoStatus[i].isSet!) {
        selectedLogo = logoStatus[i];
      }
    }
    if (context.mounted) {
      BlocProvider.of<HomeStateManageBloc>(context)
          .add(ChangePicEvent(logoStatus: logoStatus));
    }
  }



  Future<void> set(String methodName) async {
    var perf = await SharedPreferences.getInstance();
    String data = jsonEncode(logoStatus);
    perf.setString('Logos', data);
    const platform = MethodChannel('com.example.connect_native');
    try {
      var res = await platform.invokeMethod(methodName);
      log(res);
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}