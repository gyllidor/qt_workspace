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
    , m_dir(i_dir)
{
    setObjectName(i_dir);
    QSizePolicy size_policy(QSizePolicy::Minimum, QSizePolicy::Minimum);
    size_policy.setHorizontalStretch(0);
    size_policy.setVerticalStretch(0);
    size_policy.setHeightForWidth(sizePolicy().hasHeightForWidth());
    setSizePolicy(size_policy);
    setMaximumSize(QSize(16777215, 1018));
    setLayoutDirection(Qt::LeftToRight);

    setText(i_dir);
}

TabButton::~TabButton()
{

}

const QString &TabButton::getDir() const
{
    return m_dir;
}

void TabButton::mousePressEvent(QMouseEvent *ip_mouse_event)
{
    if (ip_mouse_event->button() == Qt::LeftButton)
    {
        qDebug() << "woohoo leftbutton";
        emit leftClicked(getDir());
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
        emit rightClicked(getDir());
        return;
    }

    QPushButton::mousePressEvent(ip_mouse_event);
}

