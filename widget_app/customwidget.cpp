#include "customwidget.h"

CustomWidget::CustomWidget(QWidget *parent)
    : QWidget(parent)
{
    setWindowTitle("custom");

    resize(240, 120);
}

void CustomWidget::paintEvent(QPaintEvent*)
{
    QPainter painter(this);
    painter.setPen(QColor("#FF0000"));

    const QRect rect1 = rect().adjusted(10, 10, -10, -10);
    painter.drawRect(rect1);

    QRect rect2(QPoint(0, 0), QSize(40, 40));
    if (m_lastPos.isNull())
        rect2.moveCenter(rect().center());
    else
        rect2.moveCenter(m_lastPos);

    painter.fillRect(rect2, QColor("#FFBB55"));
}

void CustomWidget::mousePressEvent(QMouseEvent *ip_mouse_event)
{
    m_lastPos = ip_mouse_event->pos();
    update();
}

void CustomWidget::mouseMoveEvent(QMouseEvent *ip_mouse_event)
{
    m_lastPos = ip_mouse_event->pos();

    const QRect widget_rect = rect().adjusted(30, 30, -30, -30);
    if (m_lastPos.x() < widget_rect.left())
        m_lastPos.setX(widget_rect.left());

    if (m_lastPos.x() > widget_rect.right())
        m_lastPos.setX(widget_rect.right());

    if (m_lastPos.y() < widget_rect.top())
        m_lastPos.setY(widget_rect.top());

    if (m_lastPos.y() > widget_rect.bottom())
        m_lastPos.setY(widget_rect.bottom());

    update();
}

