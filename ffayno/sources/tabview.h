#ifndef TABVIEW_H
#define TABVIEW_H

#include "tabbutton.h"

#include <QListView>
#include <QFileSystemModel>

class TabView : public QObject
{
    Q_OBJECT
public:
    explicit TabView(QObject *parent = 0);
    explicit TabView(QListView* ip_list_view, QObject *parent = 0);
    ~TabView();

    QString getRootPath() const;

signals:
    void tabViewRootChanged(const TabView*);

public slots:
    void onTabClicked(TabButton *ip_tab_button);
    void doubleClicked(const QModelIndex& index);

private:
    void changeRootDir(const QString& i_new_root_dir);

private:
    QListView* mp_list_view;
    QFileSystemModel* mp_fs_model;
};

#endif // TABVIEW_H
