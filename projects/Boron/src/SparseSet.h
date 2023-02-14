#pragma once
#include <vector>
#include <unordered_map>

namespace Boron {
    class SparseSet {
    public:
        void Add(int key);
        void Remove(int key);
        bool Contains(int key);
        int Size();
        const std::vector<int>& Keys();
    private:
        std::vector<int> m_Keys;
        std::unordered_map<int, int> m_IndexMap;
    };
}