#ifndef WIDGETGRAPHICS_H
#define WIDGETGRAPHICS_H

#include <QtWidgets>

class WidgetGraphics : public QWidget
{
    Q_OBJECT
public:
    explicit WidgetGraphics(QWidget *parent = 0);

private:
    QGraphicsView* mp_graphics_view;
    QGraphicsScene* mp_graphics_scene;
};

#endif // WIDGETGRAPHICS_H
