#include "mainwindow.h"
#include "customwidget.h"
#include "widgetcities.h"
#include "widgetgraphics.h"

#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    MainWindow w;
    w.setWindowTitle("Main window");
    w.show();

    const QScopedPointer<QWidget> widget(new CustomWidget);
    widget->show();

    WidgetCities cities;
    cities.show();

    WidgetGraphics graphi;
    graphi.show();

    return app.exec();
}
