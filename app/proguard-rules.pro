# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile


#---------------------------------1.基本不用动区域----------------------------------
-optimizationpasses 5 #代码混淆的压缩比例，值在0-7之间
-dontusemixedcaseclassnames #混淆后类名都为小写
-dontskipnonpubliclibraryclasses #指定不去忽略非公共的库的类
-dontskipnonpubliclibraryclassmembers #指定不去忽略非公共的库的类的成员
-dontpreverify #不做预校验的操作
-verbose  #生成原类名和混淆后的类名的映射文件
-printmapping proguardMapping.txt #生成原类名和混淆后的类名的映射文件
-optimizations !code/simplification/cast,!field/*,!class/merging/* #指定混淆是采用的算法
-keepattributes *Annotation*,InnerClasses #不混淆Annotation
-keepattributes Signature #不混淆泛型
-keepattributes SourceFile,LineNumberTable #抛出异常时保留代码行号
-ignorewarnings #忽略警告类
#----------------------------------------------------------------------------


# -------------------------------默认保留区 --------------------------
-keep public class * extends Android.app.Fragment
-keep public class * extends Android.app.Activity
-keep public class * extends Android.app.Application
-keep public class * extends Android.app.Service
-keep public class * extends Android.content.BroadcastReceiver
-keep public class * extends Android.content.ContentProvider
-keep public class * extends Android.app.backup.BackupAgentHelper
-keep public class * extends Android.preference.Preference
-keep public class * extends android.view.View
-keep public class com.Android.vending.licensing.ILicensingService
-keep public class * extends Android.support.** {*;}

-keepclasseswithmembernames class * { # 保持native方法不被混淆
    native <methods>;
}
-keepclassmembers class * extends android.app.Activity{
    public void *(android.view.View);
}
-keepclassmembers enum * { # 保持枚举enum类不被混淆
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
-keep public class * extends android.view.View{ # 保持自定义控件不被混淆
    *** get*();
    void set*(***);
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}
-keepclasseswithmembers class * { # 保持自定义控件不被混淆
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}
-keep class * implements android.os.Parcelable { # 保持Parcelable不被混淆
  public static final android.os.Parcelable$Creator *;
}
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}
-keep class **.R$* {
 *;
}
-keepclassmembers class * {
    void *(**On*Event);
}
#----------------------------------------------------------------------------

#---------------------------------webview------------------------------------
-keepclassmembers class fqcn.of.javascript.interface.for.Webview {
   public *;
}
-keepclassmembers class * extends android.webkit.WebViewClient {
    public void *(android.webkit.WebView, java.lang.String, android.graphics.Bitmap);
    public boolean *(android.webkit.WebView, java.lang.String);
}
-keepclassmembers class * extends android.webkit.WebViewClient {
    public void *(android.webkit.WebView, jav.lang.String);
}
#----------------------------------------------------------------------------


# --------- 忽略异常提示 -----------------------------------------------------
-dontwarn org.codehaus.**
#----------------------------------------------------------------------------

# For Guava:
-dontwarn javax.annotation.**
-dontwarn javax.inject.**
-dontwarn sun.misc.Unsafe

# butterknife混淆脚本 ----
-dontwarn butterknife.internal.**
-keep class **$$ViewInjector { *; }
#-keepnames class * { @butterknife.InjectView *;}

-dontwarn org.mockito.**
