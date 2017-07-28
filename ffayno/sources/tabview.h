#ifndef TABVIEW_H
#define TABVIEW_H

#include <QListView>
#include <QFileSystemModel>

class TabView : public QObject
{
    Q_OBJECT
public:
    explicit TabView(QObject *parent = 0);
    explicit TabView(QListView* ip_list_view, QObject *parent = 0);
    ~TabView();

public slots:
    void onTabButtonClicked(const QString& i_path);
    void doubleClicked(const QModelIndex& index);

private:
    QListView* mp_list_view;
    QFileSystemModel* mp_fs_model;
};

#endif // TABVIEW_H
