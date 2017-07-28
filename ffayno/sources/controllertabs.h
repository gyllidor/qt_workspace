#ifndef CONTROLLERTABS_H
#define CONTROLLERTABS_H

#include "tabbutton.h"

#include <QLayout>

#include <set>
#include <memory>

class ControllerTabs : public QObject
{
    Q_OBJECT

public:
    ControllerTabs(QObject* ip_parent);
    ControllerTabs(QLayout* ip_layout_tabs);
    virtual ~ControllerTabs();

signals:
    void leftClickedTab(const QString&);
    void rightClickedTab(const QString&);

private slots:
    void AddTab(const QString& i_dir);
    void onTabLeftClicked(const QString &i_path);
    void onTabMidClicked(TabButton *ip_tab_button);
    void onTabRightClicked(const QString &i_path);

private:
    QLayout* mp_layout_tabs;
};

#endif // CONTROLLERTABS_H
