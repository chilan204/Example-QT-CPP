#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>

class controller : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int currentIndex READ currentIndex WRITE setCurrentIndex NOTIFY currentIndexChanged)
    Q_PROPERTY(bool isPlaying READ isPlaying WRITE setIsPlaying NOTIFY isPlayingChanged)

public:
    controller();

    int currentIndex();
    Q_INVOKABLE void setCurrentIndex(int index);

    bool isPlaying();
    Q_INVOKABLE void setIsPlaying(bool isPlaying);

    Q_INVOKABLE void next();
    Q_INVOKABLE void pre();
    Q_INVOKABLE QList <QString> getListMS();

signals:
    void currentIndexChanged();
    void isPlayingChanged();

private:
    QList <QString> m_listMS;
    int m_currentIndex;
    bool m_isPlaying;
};

#endif // CONTROLLER_H
