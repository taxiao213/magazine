package com.jz.magazine.base;

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

    @Override
    protected AndroidInjector<? extends DaggerApplication> applicationInjector() {
        return DaggerAppComponent.builder().application(this).build();
    }

}
