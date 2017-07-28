#include "controllertabs.h"

#include <QDir>
#include <QDebug>

ControllerTabs::ControllerTabs(QObject *ip_parent)
    : QObject(ip_parent)
{
}

ControllerTabs::ControllerTabs(QLayout *ip_layout_tabs)
    : QObject()
    , mp_layout_tabs(ip_layout_tabs)
{
    AddTab(QDir::homePath());
}

ControllerTabs::~ControllerTabs()
{
}

void ControllerTabs::AddTab(const QString &i_dir)
{
    auto p_tab_button = new TabButton(i_dir);
    connect(p_tab_button, SIGNAL(leftClicked(const QString&)),
            this, SLOT(onTabLeftClicked(const QString&)));

    connect(p_tab_button, SIGNAL(midClicked(TabButton*)),
            this, SLOT(onTabMidClicked(TabButton*)));

    connect(p_tab_button, SIGNAL(rightClicked(const QString&)),
            this, SLOT(onTabRightClicked(const QString&)));

    mp_layout_tabs->addWidget(p_tab_button);
    qDebug() << mp_layout_tabs->count();
}

void ControllerTabs::onTabLeftClicked(const QString& i_path)
{
    qDebug() << __FUNCTION__ << i_path;
    emit leftClickedTab(i_path);
}

void ControllerTabs::onTabMidClicked(TabButton *ip_tab_button)
{
    mp_layout_tabs->removeWidget(ip_tab_button);
    ip_tab_button->deleteLater();
    if (mp_layout_tabs->count() == 0)
        AddTab(QDir::homePath());

    qDebug() << __FUNCTION__;
}

void ControllerTabs::onTabRightClicked(const QString &i_path)
{
    qDebug() << __FUNCTION__ << i_path;
    emit rightClickedTab(i_path);
}
