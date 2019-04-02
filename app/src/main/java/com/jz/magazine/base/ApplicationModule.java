package com.jz.magazine.base;

import android.app.Application;
import android.content.Context;

import dagger.Binds;
import dagger.Module;

/**
 * Create by Han on 2019/4/2
 * Email:yin13753884368@163.com
 * CSDN:http://blog.csdn.net/yin13753884368/article
 * Github:https://github.com/yin13753884368
 */
@Module
public abstract class ApplicationModule {

    @Binds
    abstract Context bindContext(Application application);
}
