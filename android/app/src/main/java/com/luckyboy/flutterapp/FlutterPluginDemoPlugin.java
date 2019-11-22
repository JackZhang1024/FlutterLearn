package com.luckyboy.flutterapp;

import android.content.Context;
import android.os.Build;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.view.FlutterView;

public class FlutterPluginDemoPlugin implements MethodChannel.MethodCallHandler {

    /* 插件注册 */
//    public static void registerWith(PluginRegistry.Registrar registrar){
//        // 定义与上层代码通信的通道 注意标识要与上层代码保持一致
//        final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_plugin_demo");
//        channel.setMethodCallHandler(new FlutterPluginDemoPlugin());
//    }

    private static final String CHANNEL= "flutter_plugin_demo";
    private Context mContext;

    static void registerWith(FlutterActivity activity){
        new FlutterPluginDemoPlugin(activity.getFlutterView());
    }

    private FlutterPluginDemoPlugin(FlutterView view){
        mContext = view.getContext();
        new MethodChannel(view, CHANNEL).setMethodCallHandler(this);
    }


    @Override
    public void onMethodCall(MethodCall methodCall,  MethodChannel.Result result) {
       // 判断上层调用的方法
       if (methodCall.method.equals("getPlatformVersion")){
           // 调用成功后返回系统版本
           result.success("Android "+ Build.VERSION.RELEASE);
       }else{
           result.notImplemented();
       }
    }
}
