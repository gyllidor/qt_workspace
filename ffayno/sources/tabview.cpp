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
    mp_list_view->setModel(mp_fs_model);

    connect(mp_list_view, SIGNAL(doubleClicked(const QModelIndex&)),
            this, SLOT(doubleClicked(const QModelIndex&)));
}

TabView::~TabView()
{
    delete mp_fs_model;
}

QString TabView::getRootPath() const
{
    return mp_fs_model->rootPath();
}

void TabView::onTabClicked(TabButton *ip_tab_button)
{
    qDebug() << __FUNCTION__ << ip_tab_button->getPath();

    changeRootDir(ip_tab_button->getPath());
}

void TabView::doubleClicked(const QModelIndex &index)
{
    qDebug() << mp_fs_model->filePath(index);

    if (QFileInfo(mp_fs_model->filePath(index)).isFile())
        return;

    changeRootDir(mp_fs_model->filePath(index));
}

void TabView::changeRootDir(const QString &i_new_root_dir)
{
    mp_list_view->setRootIndex(mp_fs_model->index(i_new_root_dir));
    mp_fs_model->setRootPath(i_new_root_dir);

    emit tabViewRootChanged(this);
}
