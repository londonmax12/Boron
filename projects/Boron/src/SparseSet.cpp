#include "SparseSet.h"

void Boron::SparseSet::Add(int key)
{
    if (m_IndexMap.find(key) == m_IndexMap.end()) {
        m_Keys.push_back(key);
        m_IndexMap[key] = m_Keys.size() - 1;
    }
}

void Boron::SparseSet::Remove(int key)
{
    auto it = m_IndexMap.find(key);
    if (it != m_IndexMap.end()) {
        int last_key = m_Keys.back();
        int index = it->second;
        m_Keys[index] = last_key;
        m_IndexMap[last_key] = index;
        m_Keys.pop_back();
        m_IndexMap.erase(it);
    }
}

bool Boron::SparseSet::Contains(int key)
{
    return m_IndexMap.find(key) != m_IndexMap.end();
}

int Boron::SparseSet::Size()
{
    return m_Keys.size();
}

const std::vector<int>& Boron::SparseSet::Keys()
{
    return m_Keys;
}
