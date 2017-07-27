#ifndef CONTROLLERTABS_H
#define CONTROLLERTABS_H

#include "tabbutton.h"

#include <QLayout>

#include <set>
#include <memory>

class ControllerTabs : QObject
{
    Q_OBJECT

public:
    ControllerTabs(QLayout* ip_layout_tabs);
    virtual ~ControllerTabs();

private slots:
    void AddTab(const QString& i_dir);
    void onTabLeftClicked(TabButton* ip_tab_button);
    void onTabMidClicked(TabButton* ip_tab_button);
    void onTabRightClicked(TabButton* ip_tab_button);

private:
    std::set<std::unique_ptr<TabButton>> m_tab_buttons;
    QLayout* mp_layout_tabs;
};

#endif // CONTROLLERTABS_H
