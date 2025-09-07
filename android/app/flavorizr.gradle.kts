import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("develop") {
            dimension = "flavor-type"
            applicationId = "com.example.flutter_settings.dev"
            resValue(type = "string", name = "app_name", value = "Flutter Settings Dev")
        }
        create("production") {
            dimension = "flavor-type"
            applicationId = "com.example.flutter_settings"
            resValue(type = "string", name = "app_name", value = "Flutter Settings")
        }
    }
}