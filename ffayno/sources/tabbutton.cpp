#include "tabbutton.h"

#include <QDir>
#include <QDebug>

TabButton::TabButton(QWidget *ip_parent)
    : TabButton(QDir::homePath(), ip_parent)
{

}

TabButton::TabButton(const QString &i_dir)
    : TabButton(i_dir, Q_NULLPTR)
{
}

TabButton::TabButton(const QString &i_dir, QWidget *ip_parent)
    : QPushButton(ip_parent)
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
    if (ip_mouse_event->button() == Qt::LeftButton)
    {
        qDebug() << "woohoo leftbutton";
        emit leftClicked(this);
        return;
    }

    if (ip_mouse_event->button() == Qt::MidButton)
    {
        qDebug() << "woohoo midbutton";
        emit midClicked(this);
        return;
    }

    if (ip_mouse_event->button() == Qt::RightButton)
    {
        qDebug() << "woohoo rightbutton";
        emit rightClicked(this);
        return;
    }

    QPushButton::mousePressEvent(ip_mouse_event);
}

