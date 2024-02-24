package com.example.connect_native;

import android.content.ComponentName;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.widget.Toast;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.example.connect_native";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine){
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
        .setMethodCallHandler(
            (call,result)-> {
                switch (call.method) {
                    case "setSecondGear"://useOldPhoto
                        showJavaToast("setSecondGear");
                        try {
                            setGearTwo();
                        } catch (Exception e) {
                            result.error("ERROR_CODE", "Error Occurred: " + (e.getMessage()), null);
                        }
                        result.success("success");

                        break;
                    case "setThirdGear":
                        showJavaToast("setThirdGear");
                        try {
                            setGearThree();
                        } catch (Exception e) {
                            result.error("ERROR_CODE", "Error Occurred: " + (e.getMessage()), null);
                        }
                        result.success("success");
                        break;
                    case "setGearFour"://useGearFive
                        showJavaToast("setGearFour");
                        try {
                            setGearFour();
                        } catch (Exception e) {
                            result.error("ERROR_CODE", "Error Occurred: " + (e.getMessage()), null);
                        }
                        result.success("success");
                        break;
                    case "setGearFive"://useGearFive
                        showJavaToast("setGearFive");
                        try {
                            setGearFive();
                        } catch (Exception e) {
                            result.error("ERROR_CODE", "Error Occurred: " + (e.getMessage()), null);
                        }
                        result.success("success");
                        break;
                    default:
                        result.notImplemented();
                        break;
                }
            }
        );
    }

    private void showJavaToast(String data){
        Toast.makeText(this,data,Toast.LENGTH_SHORT).show();
    }
    private void setGearTwo()
    {
        // enable gear two
        PackageManager manager = getPackageManager();
        manager.setComponentEnabledSetting(
                new ComponentName(
                        MainActivity.this,
                        "com.example.connect_native.MainActivity"),
                PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                PackageManager.DONT_KILL_APP);

        // disable gear three
        manager.setComponentEnabledSetting(
                new ComponentName(
                        MainActivity.this,
                        "com.example.connect_native.MainActivityGearThere"),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);
        // disable gear four
        manager.setComponentEnabledSetting(
                new ComponentName(
                        MainActivity.this,
                        "com.example.connect_native.MainActivityGearFour"),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);

        // disable gear five
        manager.setComponentEnabledSetting(
                new ComponentName(
                        MainActivity.this,
                        "com.example.connect_native.MainActivityGearFive"),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);

    }
    private void setGearThree()
    {
        // disable old icon
        PackageManager manager = getPackageManager();
        manager.setComponentEnabledSetting(
                new ComponentName(
                        MainActivity.this,
                        "com.example.connect_native.MainActivity"),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);

        // enable new icon
        manager.setComponentEnabledSetting(
                new ComponentName(
                        MainActivity.this,
                        "com.example.connect_native.MainActivityGearThere"),
                PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                PackageManager.DONT_KILL_APP);
        // disable gear icon
        manager.setComponentEnabledSetting(
                new ComponentName(
                        MainActivity.this,
                        "com.example.connect_native.MainActivityGearFour"),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);

        // disable gear icon
        manager.setComponentEnabledSetting(
                new ComponentName(
                        MainActivity.this,
                        "com.example.connect_native.MainActivityGearFive"),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);
    }
    private void setGearFour()
    {
        // disable old icon
        PackageManager manager = getPackageManager();
        manager.setComponentEnabledSetting(
                new ComponentName(
                        MainActivity.this,
                        "com.example.connect_native.MainActivity"),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);

        // disable new icon
        manager.setComponentEnabledSetting(
                new ComponentName(
                        MainActivity.this,
                        "com.example.connect_native.MainActivityGearThere"),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);

        // enable gear four
        manager.setComponentEnabledSetting(
                new ComponentName(
                        MainActivity.this,
                        "com.example.connect_native.MainActivityGearFour"),
                PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                PackageManager.DONT_KILL_APP);

        //disable gear five
        manager.setComponentEnabledSetting(
                new ComponentName(
                        MainActivity.this,
                        "com.example.connect_native.MainActivityGearFive"),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);


    }
    private void setGearFive()
    {
        // disable old icon
        PackageManager manager = getPackageManager();
        manager.setComponentEnabledSetting(
                new ComponentName(
                        MainActivity.this,
                        "com.example.connect_native.MainActivity"),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);

        // disable new icon
        manager.setComponentEnabledSetting(
                new ComponentName(
                        MainActivity.this,
                        "com.example.connect_native.MainActivityGearThere"),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);

        // enable gear four
        manager.setComponentEnabledSetting(
                new ComponentName(
                        MainActivity.this,
                        "com.example.connect_native.MainActivityGearFour"),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);

        // enable gear icon
        manager.setComponentEnabledSetting(
                new ComponentName(
                        MainActivity.this,
                        "com.example.connect_native.MainActivityGearFive"),
                PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                PackageManager.DONT_KILL_APP);
    }

}
