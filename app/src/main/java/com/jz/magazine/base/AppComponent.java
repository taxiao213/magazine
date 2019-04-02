package com.jz.magazine.base;

import android.app.Application;

import javax.inject.Inject;
import javax.inject.Singleton;

import dagger.BindsInstance;
import dagger.Component;
import dagger.android.AndroidInjector;
import dagger.android.support.AndroidSupportInjectionModule;

/**
 * AndroidSupportInjectionModule.class 必须写
 */
@Singleton
@Component(modules = {AndroidSupportInjectionModule.class})
public interface AppComponent extends AndroidInjector<MyApplication> {

    @Component.Builder
    interface Builder {

        @BindsInstance
        AppComponent.Builder application(Application application);

        AppComponent build();
    }
}
