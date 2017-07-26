#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QFileSystemModel>
#include <QListView>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

public slots:
    void doubleClickedLeft(const QModelIndex &index);
    void doubleClickedRight(const QModelIndex &index);

private:
    void doubleClick(QFileSystemModel* ip_fs_model, QListView* ip_list_view, const QModelIndex &index);

private:
    Ui::MainWindow *ui;
    QFileSystemModel* mp_fs_model_left;
    QFileSystemModel* mp_fs_model_right;
};

#endif // MAINWINDOW_H
