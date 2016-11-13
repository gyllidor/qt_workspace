#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QDebug>
#include <QQmlProperty>
#include <QObject>

#include <thread>
#include <chrono>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlEngine engine;
    QQmlComponent window_component(&engine, QUrl::fromLocalFile(QStringLiteral("main.qml")));
    std::unique_ptr<QObject> p_window(window_component.create());
    if (!p_window)
    {
        qDebug() << window_component.errors();
        std::exit(EXIT_FAILURE);
    }

    std::thread thread([&]()
    {
        std::this_thread::sleep_for(std::chrono::seconds(1));
        p_window->setProperty("width", 200);
        std::this_thread::sleep_for(std::chrono::seconds(1));
        QQmlProperty(p_window.get(), "height").write(300);
    });

    std::thread thread1([&]()
    {
        thread.join();

        QObject* p_rect = p_window->findChild<QObject*>("rect_name");
        if (!p_rect)
        {
            qDebug() << "pew\n";
            return;
        }

        p_rect->setProperty("color", "green");

    });

    return app.exec();
}
