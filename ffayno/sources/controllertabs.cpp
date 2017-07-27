#include "controllertabs.h"

#include <QDir>
#include <QDebug>

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
    auto p_tab_button = std::make_unique<TabButton>(i_dir);
    connect(p_tab_button.get(), SIGNAL(leftClicked(TabButton*)),
            this, SLOT(onTabLeftClicked(TabButton*)));

    connect(p_tab_button.get(), SIGNAL(midClicked(TabButton*)),
            this, SLOT(onTabMidClicked(TabButton*)));

    connect(p_tab_button.get(), SIGNAL(rightClicked(TabButton*)),
            this, SLOT(onTabRightClicked(TabButton*)));

    mp_layout_tabs->addWidget(p_tab_button.get());

    m_tab_buttons.insert(std::move(p_tab_button));
}

void ControllerTabs::onTabLeftClicked(TabButton *ip_tab_button)
{
    AddTab(QDir::homePath());
    qDebug() << __FUNCTION__ << ip_tab_button;
}

void ControllerTabs::onTabMidClicked(TabButton *ip_tab_button)
{
    qDebug() << __FUNCTION__;

    mp_layout_tabs->removeWidget(ip_tab_button);
    const auto it_found = std::find_if(m_tab_buttons.cbegin(), m_tab_buttons.cend(),
    [ip_tab_button](const std::unique_ptr<TabButton>& ip_tab)
    {
        return ip_tab_button == ip_tab.get();
    });

//    m_tab_buttons.erase(it_found);
//    if (m_tab_buttons.empty())
        AddTab(QDir::homePath());
        AddTab(QDir::homePath());

    qDebug() << __FUNCTION__;
}

void ControllerTabs::onTabRightClicked(TabButton *ip_tab_button)
{
    qDebug() << __FUNCTION__ << ip_tab_button;
}
