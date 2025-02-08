#include <QApplication>
#include <QQmlApplicationEngine>
#include <QScreen>
#include <QRect>
#include <QQuickWindow>
#include <QLocale>
#include <QTranslator>
#include "collector.h"
#include <QQmlContext>
#include "logmanager.h"
#include "datapacketformation.h"
#include "systemcontroller.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QApplication app(argc, argv);

    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString &locale : uiLanguages) {
        const QString baseName = "esp_comm_" + QLocale(locale).name();
        if (translator.load(":/i18n/" + baseName)) {
            app.installTranslator(&translator);
            break;
        }
    }

    QQmlApplicationEngine engine;
    // LogManager for the LogActivity
    LogManager logManager;
    engine.rootContext()->setContextProperty("logManager", &logManager);
    // Expose the collector function to the QML
    Collector collector;
    engine.rootContext()->setContextProperty("collector", &collector);
    // Expose the SystemController to the QML
    SystemController systemController;
    engine.rootContext()->setContextProperty("systemController", &systemController);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    // See if the window is empty or not
    if (engine.rootObjects().isEmpty())
        return -1;
    // Get the top window
    QObject *topLevel = engine.rootObjects().first();
    QQuickWindow *window = qobject_cast<QQuickWindow *>(topLevel);

    // Center the window
    if (window) {
        QRect screenGeometry = app.primaryScreen()->geometry();
        int x = (screenGeometry.width() - window->width()) / 2;
        int y = (screenGeometry.height() - window->height()) / 2;
        window->setPosition(x, y);
    }


    return app.exec();
}
