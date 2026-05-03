--- @diagnostic disable: undefined-global, undefined-field, lowercase-global

project "Box2D"
    targetname "box2d"
    location "."
    kind "StaticLib"
    language "C"
    cdialect "C11"

    files
    {
        "include/**.h",
        "src/**.c",
        "src/**.h",
    }

    includedirs
    {
        "include",
        "src",
    }

    filter "system:android"
        androidnamespace "com.tribufu.alnilam.vendor.box2d"

    if _ACTION == "vs2026" and os.target() == "windows" then
        filter { "system:windows", "architecture:x86_64" }
            targetdir("%{prj.location}/bin/win-x64")
        filter { "system:windows", "architecture:x86" }
            targetdir("%{prj.location}/bin/win-x86")
        filter { "system:windows", "architecture:AARCH64" }
            targetdir("%{prj.location}/bin/win-arm64")
        filter { "system:windows", "architecture:ARM" }
            targetdir("%{prj.location}/bin/win-arm")
    end

    if not (_ACTION == "vs2026") then
        filter { "platforms:*" }
            targetdir("%{prj.location}/bin/%{cfg.platform}")
    end
