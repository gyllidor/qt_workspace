#include "mainwindow.h"
#include "ui_mainwindow.h"

#include "controllertabs.h"

#include <QGridLayout>
#include <QPushButton>
#include <QListView>
#include <QFileSystemModel>
#include <QScrollArea>
#include <QDebug>

#include "tabbutton.h"
#include "tabview.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    mp_controller_tabs = std::make_unique<ControllerTabs>(ui->formLayout);
    mp_tab_view_left = std::make_unique<TabView>(ui->listViewLeft);
    mp_tab_view_right = std::make_unique<TabView>(ui->listViewRight);

    connect(mp_controller_tabs.get(), SIGNAL(leftClickedTab(const QString&))
            , mp_tab_view_left.get(), SLOT(onTabButtonClicked(const QString&)));

    connect(mp_controller_tabs.get(), SIGNAL(rightClickedTab(const QString&))
            , mp_tab_view_right.get(), SLOT(onTabButtonClicked(const QString&)));

}

MainWindow::~MainWindow()
{
    delete ui;
}
