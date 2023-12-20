#include "playmusic.h"

playmusic::playmusic()
{
    timer = new QTimer(this);

    connect(timer, SIGNAL(timeout()), this, SLOT(onTimeout()));

    timer->start(1000);
}


void playmusic::play(){
    QString directoryPath = "/home/nct/NCL/Music";

    QMediaPlaylist *playlist = new QMediaPlaylist();

    QDir directory(directoryPath);

    QStringList mp3Files = directory.entryList(QStringList() << "*.mp3", QDir::Files);

    foreach (QString mp3File, mp3Files) {
        QUrl fileUrl = QUrl::fromLocalFile(directory.filePath(mp3File));
        playlist->addMedia(fileUrl);
    }

    QMediaPlayer *player = new QMediaPlayer();
    player->setPlaylist(playlist);

    player->play();
}
