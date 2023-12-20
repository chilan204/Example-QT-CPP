#include "controller.h"
#include "QDebug"

controller::controller()
{
    m_path = "/home/nct/NCL/Example_NCL-main/Media_Example/music";
    m_isPlaying = false;
    m_currentIndex = 0;
    m_duration = 0;
    m_position = 0;
    connect(&m_timer, &QTimer::timeout, this, &controller::onTimeOut);
    m_timer.start(1000);
    readFolder();
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

int controller::position()
{
    return m_position;
}

void controller::setPosition(int position)
{
    if (m_position == position) return;
    m_position = position;
    emit positionChanged();
}

int controller::duration()
{
    return m_duration;
}

void controller::setDuration(int duration)
{
    if (m_duration == duration) return;
    m_duration = duration;
    emit durationChanged();
}

void controller::next()
{
    if (m_currentIndex == m_listMS.length()-1){m_currentIndex = 0;}
    else {m_currentIndex += 1;}
    play();
    emit currentIndexChanged();
}

void controller::pre()
{
    if (m_currentIndex == 0){m_currentIndex = m_listMS.length()-1;}
    else {m_currentIndex -= 1;}
    play();
    emit currentIndexChanged();
}

void controller::play()
{
    m_player.setMedia(QUrl::fromLocalFile(m_path + "/" + m_listMS[m_currentIndex]));
    m_player.play();
    setIsPlaying(true);
}

void controller::pause()
{
    m_player.pause();
    setIsPlaying(false);
}

QStringList controller::getListMS()
{
    return m_listMS;
}

void controller::readFolder()
{
    QDir directory(m_path);
    m_listMS = directory.entryList(QStringList() << "*.mp3", QDir::Files);
}

void controller::onTimeOut()
{
    setPosition(m_player.position());
    setDuration(m_player.duration());
}
