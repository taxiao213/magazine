package com.jz.magazine;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;

import com.google.common.base.Optional;
import com.google.common.base.Preconditions;
import com.google.common.collect.Ordering;
import com.umeng.message.PushAgent;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        PushAgent.getInstance(MainActivity.this).onAppStart();
    }
}
