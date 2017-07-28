#ifndef TABBUTTON_H
#define TABBUTTON_H

#include <QPushButton>
#include <QMouseEvent>

class TabButton : public QPushButton
{
    Q_OBJECT

public:
    TabButton(QWidget* ip_parent = Q_NULLPTR);
    TabButton(const QString& i_dir);
    virtual ~TabButton();

    const QString& getDir() const;

signals:
    void leftClicked(const QString&);
    void midClicked(TabButton*);
    void rightClicked(const QString&);

protected:
    void mousePressEvent(QMouseEvent* ip_mouse_event) override;

private:
    TabButton(const QString& i_dir, QWidget* ip_parent);

private:
    QString m_dir;
};

#endif // TABBUTTON_H
