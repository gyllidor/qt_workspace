#include "tabbutton.h"

#include <QDir>
#include <QDebug>

TabButton::TabButton(const QString &i_dir)
    : QPushButton(nullptr)
{
    setPath(i_dir);
    QSizePolicy size_policy(QSizePolicy::Minimum, QSizePolicy::Minimum);
    size_policy.setHorizontalStretch(0);
    size_policy.setVerticalStretch(0);
    size_policy.setHeightForWidth(sizePolicy().hasHeightForWidth());
    setSizePolicy(size_policy);
    setMaximumSize(QSize(120, 1018));
    setLayoutDirection(Qt::LeftToRight);
}

TabButton::~TabButton()
{
}

QString TabButton::getPath() const
{
    return objectName();
}

void TabButton::setPath(const QString &i_path)
{
    setObjectName(i_path);
    setText(QFileInfo(i_path).baseName());
}

void TabButton::mousePressEvent(QMouseEvent *ip_mouse_event)
{
    switch (ip_mouse_event->button())
    {
    case Qt::LeftButton:
        emit leftClicked(this);
        return;

    case Qt::MidButton:
        emit midClicked(this);
        return;

    case Qt::RightButton:
        emit rightClicked(this);
        return;

    default:
        break;
    }

    QPushButton::mousePressEvent(ip_mouse_event);
}

