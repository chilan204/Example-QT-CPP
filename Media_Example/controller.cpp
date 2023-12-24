#include "controller.h"

controller::controller()
{
    m_path = "/home/nct/NCL/Example-QT-CPP/Media_Example/Music";

    QDir directory(m_path);
    QStringList mp3Files = directory.entryList(QStringList() << "*.mp3", QDir::Files);
    QMediaPlaylist *m_listMS = new QMediaPlaylist();
    foreach (QString mp3File, mp3Files) {
        qDebug() << mp3File;
        QUrl fileUrl = QUrl::fromLocalFile(directory.filePath(mp3File));
        m_listMS->addMedia(fileUrl);
    }
    QMediaPlayer *player = new QMediaPlayer();
    player->setPlaylist(m_listMS);
    player->play();

    m_isPlaying = true;
}

int controller::currentIndex()
{
    return m_currentIndex;
}

void controller::setCurrentIndex(int index)
{
    if (m_currentIndex == index) return;
    m_currentIndex = index;
    emit currentIndexChanged();
}

bool controller::isPlaying()
{
    return m_isPlaying;
}

void controller::setIsPlaying(bool isPlaying)
{
    if (m_isPlaying == isPlaying) return;
    m_isPlaying = isPlaying;
    emit isPlayingChanged();
}

void controller::next()
{
    if (m_currentIndex == m_listMS.length()-1){m_currentIndex = 0;}
    else {m_currentIndex += 1;}
    emit currentIndexChanged();
}

void controller::pre()
{
    if (m_currentIndex == 0){m_currentIndex = m_listMS.length()-1;}
    else {m_currentIndex -= 1;}
    emit currentIndexChanged();
}

void controller::play(bool isPlaying)
{
    m_isPlaying = !isPlaying;
    emit isPlayingChanged();
}

void controller::pause()
{
//    if (m_currentIndex == m_listMS.length()-1){m_currentIndex = 0;}
//    else {m_currentIndex += 1;}
//    emit currentIndexChanged();
}

QStringList controller::getListMS()
{
    return m_listMS;
}
