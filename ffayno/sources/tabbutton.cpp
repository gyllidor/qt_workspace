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
    setObjectName(QStringLiteral("tab0"));
    QSizePolicy size_policy(QSizePolicy::Minimum, QSizePolicy::Minimum);
    size_policy.setHorizontalStretch(0);
    size_policy.setVerticalStretch(0);
    size_policy.setHeightForWidth(sizePolicy().hasHeightForWidth());
    setSizePolicy(size_policy);
    setMaximumSize(QSize(16777215, 1018));
    setLayoutDirection(Qt::LeftToRight);

    setText("tab0");
}

TabButton::~TabButton()
{

}

void TabButton::mousePressEvent(QMouseEvent *ip_mouse_event)
{
    if (ip_mouse_event->button() == Qt::LeftButton)
    {
        qDebug() << "woohoo leftbutton";
        emit leftClicked(this);
    }

    if (ip_mouse_event->button() == Qt::MidButton)
    {
        qDebug() << "woohoo midbutton";
        emit midClicked(this);
    }

    if (ip_mouse_event->button() == Qt::RightButton)
    {
        qDebug() << "woohoo rightbutton";
        emit rightClicked(this);
    }

    QPushButton::mousePressEvent(ip_mouse_event);
}

