#include "widgetgraphics.h"

WidgetGraphics::WidgetGraphics(QWidget *parent)
    : QWidget(parent)
    , mp_graphics_view(new QGraphicsView(this))
    , mp_graphics_scene(new QGraphicsScene(this))
{
    setWindowTitle("Graphi");

    mp_graphics_view->setScene(mp_graphics_scene);

    QVBoxLayout* p_layout = new QVBoxLayout(this);
    p_layout->setMargin(0);
    p_layout->addWidget(mp_graphics_view);

    setLayout(p_layout);

    QGraphicsItem* rect1 = mp_graphics_scene->addRect(0, 0, 40, 40, Qt::NoPen, QColor("#FFBB33"));
    rect1->setFlags(QGraphicsItem::ItemIsFocusable | QGraphicsItem::ItemIsMovable);
}

