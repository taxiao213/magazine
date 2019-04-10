package com.jz.magazine.base;

import android.util.Log;

import com.umeng.commonsdk.UMConfigure;
import com.umeng.message.IUmengRegisterCallback;
import com.umeng.message.PushAgent;

import dagger.android.AndroidInjector;
import dagger.android.DaggerApplication;
import dagger.android.support.DaggerAppCompatActivity;

/**
 * Create by Han on 2019/3/25
 * Email:yin13753884368@163.com
 * CSDN:http://blog.csdn.net/yin13753884368/article
 * Github:https://github.com/yin13753884368
 */
public class MyApplication extends DaggerApplication {
    private static final String UMENG_ALIA = "Umeng";
    private static final String UMENG_APP_KEY = "5cae03330cafb2891b000df8";
    private static final String UMENG_SECRET = "7660a9d7ee6c59a573ea6b639e613673";

    @Override
    protected AndroidInjector<? extends DaggerApplication> applicationInjector() {
        return DaggerAppComponent.builder().application(this).build();
    }

    @Override
    public void onCreate() {
        super.onCreate();
        UMConfigure.init(MyApplication.this, UMENG_APP_KEY, UMENG_ALIA, UMConfigure.DEVICE_TYPE_PHONE, UMENG_SECRET);
        PushAgent instance = PushAgent.getInstance(MyApplication.this);
        instance.register(new IUmengRegisterCallback() {
            @Override
            public void onSuccess(String s) {
                Log.e("DEVICE_TOKEN == ", s);
            }

            @Override
            public void onFailure(String s, String s1) {
                Log.e("DEVICE_TOKEN == ", s + " == " + s1);
            }
        });
    }
}
