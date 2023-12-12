#include "controller.h"

controller::controller()
{
    m_listMS.push_back("Nang tho");
    m_listMS.push_back("Thang tu la noi doi cua em - Ha Anh Tuan");
    m_listMS.push_back("Suyt nua thi");
    m_listMS.push_back("Va ngay nao do");
    m_listMS.push_back("Con mo bang gia");
    m_listMS.push_back("Hoa tan tinh tan");
    m_listMS.push_back("Ben tren tang lau");
    m_listMS.push_back("Cat doi noi sau");

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

QList<QString> controller::getListMS()
{
    return m_listMS;
}
