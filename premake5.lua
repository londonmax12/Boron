outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

workspace "Boron"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Distribution"
    }

    project "Boron"
        location "projects/Boron"
        kind "StaticLib"
        language "C++"
        cppdialect "C++20"
        staticruntime "off"

        targetdir ("bin/" .. outputdir .. "/%{prj.name}")
        objdir ("bin/int/" .. outputdir .. "/%{prj.name}")

        includedirs
        {
            "projects/boron/src",
        }

        files
        {
            "projects/%{prj.name}/src/**.h",
            "projects/%{prj.name}/src/**.cpp",
        }
        filter "configurations:Debug"
            buildoptions "/MDd"
            symbols "on"

        filter "configurations:Release"
            buildoptions "/MD"
            optimize "on"

        filter "configurations:Distribution"
            buildoptions "/MD"
            optimize "on"

    project "Example"
        location "projects/Example"
        kind "ConsoleApp"
        language "C++"
        cppdialect "C++20"
        staticruntime "off"

        targetdir ("bin/" .. outputdir .. "/%{prj.name}")
        objdir ("bin/int/" .. outputdir .. "/%{prj.name}")

        files
        {
            "projects/%{prj.name}/src/**.h",
            "projects/%{prj.name}/src/**.cpp",
        }

        includedirs
        {
            "projects/Boron/src"
        }        

        links
        {
            "Boron"
        }

        filter "configurations:Debug"
            buildoptions "/MDd"
            symbols "on"

        filter "configurations:Release"
            buildoptions "/MD"
            optimize "on"

        filter "configurations:Distribution"
            buildoptions "/MD"
            optimize "on"