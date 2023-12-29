#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <QDir>
#include <QMediaPlayer>
#include <QMediaPlaylist>
#include <QTimer>

class controller : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int currentIndex     READ currentIndex   WRITE setCurrentIndex   NOTIFY currentIndexChanged)
    Q_PROPERTY(bool isPlaying       READ isPlaying      WRITE setIsPlaying      NOTIFY isPlayingChanged)
    Q_PROPERTY(int duration         READ duration       WRITE setDuration       NOTIFY durationChanged)
    Q_PROPERTY(int position         READ position       WRITE setPosition       NOTIFY positionChanged)

public:
    controller();

    int currentIndex();
    void setCurrentIndex(int index);

    bool isPlaying();
    void setIsPlaying(bool isPlaying);

    int duration();
    void setDuration(int duration);

    int position();
    void setPosition(int position);

    Q_INVOKABLE void setPositionfromUI(double pos);

    Q_INVOKABLE void next();
    Q_INVOKABLE void pre();
    Q_INVOKABLE void play();
    Q_INVOKABLE void pause();
    Q_INVOKABLE void selectSong();
    Q_INVOKABLE QStringList getListMS();

public slots:
    void onTimeout();

signals:
    void currentIndexChanged();
    void isPlayingChanged();
    void durationChanged();
    void positionChanged();


private:
    QMediaPlayer m_player;
    QStringList m_listMS;
    QTimer m_timer;
    int m_duration;
    int m_position;
    int m_currentIndex;
    bool m_isPlaying;
};

#endif // CONTROLLER_H
