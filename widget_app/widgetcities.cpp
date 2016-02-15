#include "widgetcities.h"

WidgetCities::WidgetCities(QWidget *parent)
    : QWidget(parent)
    , mp_widget(new QListWidget(this))
    , mp_edit(new QLineEdit(this))
    , mp_button(new QPushButton("Quite gently", this))
{
    setWindowTitle("Cities");

    QVBoxLayout* p_layout = new QVBoxLayout(this);
    p_layout->addWidget(mp_widget);
    p_layout->addWidget(mp_edit);
    p_layout->addWidget(mp_button);

    setLayout(p_layout);

    QStringList cities;
    cities << "Romny" << "Yakumovuchi" << "Procivka";
    for (const auto& city : cities)
        mp_widget->addItem(city);

    connect(mp_widget, SIGNAL(itemClicked(QListWidgetItem*))
            , this, SLOT(itemClicked(QListWidgetItem*)));
    connect(mp_edit, SIGNAL(editingFinished()), this, SLOT(updateItem()));
    connect(mp_button, SIGNAL(clicked()), qApp, SLOT(quit()));
}

void WidgetCities::itemClicked(QListWidgetItem *ip_widget_item)
{
    mp_edit->setText(ip_widget_item->text());
    update();
}

void WidgetCities::updateItem()
{
    const auto p_current_item = mp_widget->currentItem();
    if (p_current_item)
        p_current_item->setText(mp_edit->text());
}

