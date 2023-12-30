#include "controller.h"

#define PATH_LOCAL "/home/nct/NCL/Example-QT-CPP/Media_Example/Music"
//#define PATH_LOCAL "/home/nct/NCL/NCL_Example/Media_Example/Music"

controller::controller()
{
    QDir directory(PATH_LOCAL);
    m_listMS = directory.entryList(QStringList() << "*.mp3", QDir::Files);

    connect(&m_timer, &QTimer::timeout, this, &controller::onTimeout);
    m_timer.start(1000);

    m_currentIndex = 0;
    m_player.setMedia(QUrl::fromLocalFile(PATH_LOCAL + QString("/") + m_listMS[currentIndex()]));
    m_isPlaying = false;
    m_isRepeat = false;
    m_isShuffle = false;
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

bool controller::isRepeat()
{
    return m_isRepeat;
}

void controller::setIsRepeat(bool isRepeat)
{
    if (m_isRepeat == isRepeat) return;
    m_isRepeat = isRepeat;
    emit isRepeatChanged();
}

bool controller::isShuffle()
{
    return m_isShuffle;
}

void controller::setIsShuffle(bool isShuffle)
{
    if (m_isShuffle == isShuffle) return;
    m_isShuffle = isShuffle;
    emit isShuffleChanged();
}


int controller::duration()
{
    return m_duration;
}

void controller::setDuration(int duration)
{
    m_duration = duration;
    emit durationChanged();
}

int controller::position()
{
    return m_position;
}

void controller::setPosition(int position)
{
    m_position = position;
    emit positionChanged();
}

void controller::setPositionfromUI(double pos)
{
    m_player.setPosition(pos * m_player.duration());
}

void controller::next()
{
    if (m_currentIndex == m_listMS.length()-1){m_currentIndex = 0;}
    else {m_currentIndex += 1;}
    m_player.setMedia(QUrl::fromLocalFile(PATH_LOCAL + QString("/") + m_listMS[currentIndex()]));
    play();
    emit currentIndexChanged();
}

void controller::pre()
{
    if (m_currentIndex == 0){m_currentIndex = m_listMS.length()-1;}
    else {m_currentIndex -= 1;}
    m_player.setMedia(QUrl::fromLocalFile(PATH_LOCAL + QString("/") + m_listMS[currentIndex()]));
    play();
    emit currentIndexChanged();
}

void controller::play()
{
    m_player.play();
    setIsPlaying(true);
}

void controller::pause()
{
    m_player.pause();
    setIsPlaying(false);
}

void controller::selectSong(int index)
{
    setCurrentIndex(index);
    m_player.setMedia(QUrl::fromLocalFile(PATH_LOCAL + QString("/") + m_listMS[currentIndex()]));
    play();
}

QStringList controller::getListMS()
{
    return m_listMS;
}

void controller::onTimeout()
{
    setDuration(m_player.duration());
    setPosition(m_player.position());
    if (m_isPlaying && m_position >= m_duration) {
        if (m_isRepeat) {
            play();
        }
        else if (m_isShuffle) {
            int index;
            do {
                index = QRandomGenerator::global()->bounded(0, m_listMS.length());
            } while (index == m_currentIndex);
            selectSong(index);
        }
        else {
            next();
        }
        setDuration(m_player.duration());
        setPosition(m_player.position());
    }
}
