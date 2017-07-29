#ifndef CONTROLLERTABS_H
#define CONTROLLERTABS_H

#include "tabbutton.h"
#include "tabview.h"

#include <QLayout>

#include <set>
#include <memory>

class ControllerTabs : public QObject
{
    Q_OBJECT

public:
    ControllerTabs(QLayout* ip_layout_tabs);
    virtual ~ControllerTabs();

    void Init();

signals:
    void tabClickedLeftBtn(TabButton*);
    void tabClickedRight(TabButton*);

private:
    TabButton* addTab(const QString& i_dir);

public slots:
    void onViewRootDirChangedFirst(const TabView* ip_tab_view);
    void onViewRootDirChangedSecond(const TabView* ip_tab_view);

private slots:
    void onTabLeftClicked(TabButton *ip_tab_button);
    void onTabMidClicked(TabButton *ip_tab_button);
    void onTabRightClicked(TabButton *ip_tab_button);

private:
    void onViewRootDirChanged(const TabView* ip_tab_view
                              , TabButton*& ip_active_tab_first
                              , TabButton*& ip_active_tab_second);
    TabButton* findFirstExistanceTab(const QString& i_dir);

private:
    QLayout* mp_layout_tabs;
    TabButton* mp_active_tab_first;
    TabButton* mp_active_tab_second;
};

#endif // CONTROLLERTABS_H
