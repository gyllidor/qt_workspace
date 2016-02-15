#ifndef WIDGETCITIES_H
#define WIDGETCITIES_H

#include <QtWidgets>

class WidgetCities : public QWidget
{
    Q_OBJECT
public:
    explicit WidgetCities(QWidget *parent = 0);

private slots:
    void itemClicked(QListWidgetItem* ip_widget_item);
    void updateItem();

private:
    QListWidget* mp_widget;
    QLineEdit* mp_edit;
    QPushButton* mp_button;
};

#endif // WIDGETCITIES_H
