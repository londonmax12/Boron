#pragma once

#include "SparseSet.h"

#include <cstdint>
#include <memory>

namespace Boron {
	using EntityHandle = uint32_t;

	class Component {
	public:
		virtual ~Component() {}
	};

	class Registry
	{
	public:

	private:
		SparseSet m_Entities;
	};

}