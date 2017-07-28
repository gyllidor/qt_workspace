#include "tabview.h"

#include <QDebug>

TabView::TabView(QObject *parent)
    : QObject(parent)
{

}

TabView::TabView(QListView *ip_list_view, QObject *parent)
    : QObject(parent)
    , mp_list_view(ip_list_view)
    , mp_fs_model(new QFileSystemModel())
{
    mp_fs_model->setFilter(QDir::AllEntries | QDir::NoDot);
    mp_fs_model->setRootPath(QDir::homePath());

    mp_list_view->setModel(mp_fs_model);
    mp_list_view->setRootIndex(mp_fs_model->index(QDir::homePath()));

    connect(mp_list_view, SIGNAL(doubleClicked(const QModelIndex&)),
            this, SLOT(doubleClicked(const QModelIndex&)));
}

TabView::~TabView()
{
    delete mp_fs_model;
}

void TabView::onTabButtonClicked(const QString &i_path)
{
    qDebug() << __FUNCTION__ << i_path;

    mp_fs_model->setRootPath(i_path);
    mp_list_view->setRootIndex(mp_fs_model->index(i_path));
}

void TabView::doubleClicked(const QModelIndex &index)
{
    qDebug() << mp_fs_model->filePath(index);

    if (QFileInfo(mp_fs_model->filePath(index)).isFile())
        return;

    const QString path = mp_fs_model->filePath(index);
    mp_list_view->setRootIndex(mp_fs_model->index(path));
    mp_fs_model->setRootPath(path);
}
