#-------------------------------------------------
#
# Project created by QtCreator 2016-02-13T17:52:05
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = widget_app
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    customwidget.cpp \
    widgetcities.cpp \
    widgetgraphics.cpp

HEADERS  += mainwindow.h \
    customwidget.h \
    widgetcities.h \
    widgetgraphics.h

FORMS    += mainwindow.ui

QMAKE_CXXFLAGS += "-O2 -Wall -Wcast-align -Wcast-qual -Werror -Wextra \
-Wnon-virtual-dtor -Wno-unused-parameter -Wshadow -Wwrite-strings -fno-omit-frame-pointer \
-fno-optimize-sibling-calls -fno-strict-aliasing -fsigned-char -fstrict-overflow -std=c++11 \
-Wno-ignored-qualifiers -Wno-c++0x-compat -Wno-array-bounds -Wno-empty-body"
