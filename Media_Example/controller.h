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
    Q_PROPERTY(int currentIndex READ currentIndex WRITE setCurrentIndex NOTIFY currentIndexChanged)
    Q_PROPERTY(bool isPlaying READ isPlaying WRITE setIsPlaying NOTIFY isPlayingChanged)
    Q_PROPERTY(int position READ position WRITE setPosition NOTIFY positionChanged)
    Q_PROPERTY(int duration READ duration WRITE setDuration NOTIFY durationChanged)

public:
    controller();

    int currentIndex();
    void setCurrentIndex(int index);

    bool isPlaying();
    void setIsPlaying(bool isPlaying);

    int position();
    void setPosition(int );

    int duration();
    void setDuration(int );

    Q_INVOKABLE void next();
    Q_INVOKABLE void pre();
    Q_INVOKABLE void play();
    Q_INVOKABLE void pause();
//    Q_INVOKABLE void selectSong(int index);
    Q_INVOKABLE QStringList getListMS();

    void readFolder();

public slots:
    void onTimeOut();

signals:
    void currentIndexChanged();
    void isPlayingChanged();
    void positionChanged();
    void durationChanged();

private:
    QStringList m_listMS;
    QMediaPlayer m_player;
    QTimer m_timer;
    int m_currentIndex;
    bool m_isPlaying;
    int m_position;
    int m_duration;
    QString m_path;
};

#endif // CONTROLLER_H
