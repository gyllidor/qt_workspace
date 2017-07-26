#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QGridLayout>
#include <QPushButton>
#include <QListView>
#include <QFileSystemModel>
#include <QDebug>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    mp_fs_model_left = new QFileSystemModel(this);
    mp_fs_model_left->setFilter(QDir::AllEntries | QDir::NoDot);
    mp_fs_model_left->setRootPath(QDir::homePath());

    ui->listViewLeft->setModel(mp_fs_model_left);
    ui->listViewLeft->setRootIndex(mp_fs_model_left->index(QDir::homePath()));
    ui->listViewLeft->connect(ui->listViewLeft, SIGNAL(doubleClicked(const QModelIndex &)), this, SLOT(doubleClickedLeft(const QModelIndex&)));

    mp_fs_model_right = new QFileSystemModel(this);
    mp_fs_model_right->setFilter(QDir::AllEntries | QDir::NoDot);
    mp_fs_model_right->setRootPath(QDir::homePath());

    ui->listViewRight->connect(ui->listViewRight, SIGNAL(doubleClicked(const QModelIndex &)), this, SLOT(doubleClickedRight(const QModelIndex&)));
    ui->listViewRight->setModel(mp_fs_model_right);
    ui->listViewRight->setRootIndex(mp_fs_model_right->index(QDir::homePath()));

    // todo: bind button/tab
}

MainWindow::~MainWindow()
{
    delete ui;
    delete mp_fs_model_left;
    delete mp_fs_model_right;
}

void MainWindow::doubleClickedLeft(const QModelIndex &index)
{
    doubleClick(mp_fs_model_left, ui->listViewLeft, index);
}

void MainWindow::doubleClickedRight(const QModelIndex &index)
{
    doubleClick(mp_fs_model_right, ui->listViewRight, index);
}

void MainWindow::doubleClick(QFileSystemModel *ip_fs_model, QListView *ip_list_view, const QModelIndex &index)
{
    qDebug() << ip_fs_model->filePath(index);
    if (QFileInfo(ip_fs_model->filePath(index)).isFile())
        return;

    const QString path = ip_fs_model->filePath(index);
    ip_list_view->setRootIndex(ip_fs_model->index(path));
    ip_fs_model->setRootPath(path);
}
