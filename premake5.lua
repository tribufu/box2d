--- @diagnostic disable: undefined-global, undefined-field, lowercase-global

project "Box2D"
    location "."
    kind "StaticLib"
    language "C"
    cdialect "C11"

    removeplatforms { "Any CPU" }

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
        androidnamespace "com.tribufu.vendor.box2d"
