#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QTranslator>

#ifdef Q_OS_ANDROID
#include "notificationclient.h"
#include <QtAndroidExtras>
#include <QtAndroidExtras/QAndroidJniObject>
#include <QtAndroidExtras/QtAndroid>
#include <QtQml/QQmlContext>
#endif


#include "radialbar.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    app.setOrganizationName("SandroFadiga");
    app.setOrganizationDomain("br.sandrofadiga");
    app.setApplicationName("TheBabyProject");

    QTranslator translator;

    if(translator.load(":/translations/theme_" + QLocale::system().name())) {
        app.installTranslator(&translator);
    } else {
        qDebug() << "Unable to load translation";
    }

    qmlRegisterSingletonType(QUrl("qrc:///Theme.qml"), "Theme", 1, 0, "Theme");
    qmlRegisterType<RadialBar>("RadialBar", 1, 0, "RadialBar");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);


#ifdef Q_OS_ANDROID
    NotificationClient *notificationClient = new NotificationClient(engine.rootObjects().at(0));
    engine.rootContext()->setContextProperty(QLatin1String("notificationClient"), notificationClient);

    QAndroidJniObject m_wakeLock;
    QAndroidJniObject activity = QAndroidJniObject::callStaticObjectMethod("org/qtproject/qt5/android/QtNative", "activity", "()Landroid/app/Activity;");
    if ( activity.isValid() )
    {
        QAndroidJniObject serviceName = QAndroidJniObject::getStaticObjectField<jstring>("android/content/Context","POWER_SERVICE");
        if ( serviceName.isValid() )
        {
            QAndroidJniObject powerMgr = activity.callObjectMethod("getSystemService", "(Ljava/lang/String;)Ljava/lang/Object;",serviceName.object<jobject>());
            if ( powerMgr.isValid() )
            {
                jint levelAndFlags = QAndroidJniObject::getStaticField<jint>("android/os/PowerManager","SCREEN_DIM_WAKE_LOCK");

                QAndroidJniObject tag = QAndroidJniObject::fromString( "My Tag" ); // Why ???

                m_wakeLock = powerMgr.callObjectMethod("newWakeLock", "(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;", levelAndFlags,tag.object<jstring>());
            }
        }
    }

    if ( m_wakeLock.isValid() )
    {
        m_wakeLock.callMethod<void>("acquire", "()V");
        //qDebug() << "Locked device, can't go to standby anymore";
    }

#endif

    return app.exec();
}
