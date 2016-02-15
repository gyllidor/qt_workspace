#ifndef CUSTOMWIDGET_H
#define CUSTOMWIDGET_H

#include <QtWidgets>

class CustomWidget : public QWidget
{
    Q_OBJECT
public:
    explicit CustomWidget(QWidget *parent = 0);
    void paintEvent(QPaintEvent* ip_paint_event) override;
    void mousePressEvent(QMouseEvent* ip_mouse_event) override;
    void mouseMoveEvent(QMouseEvent* ip_mouse_event) override;

signals:

public slots:

private:
    QPoint m_lastPos;
};

#endif // CUSTOMWIDGET_H
