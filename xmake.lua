target("openvbs")
    add_rules("mode.debug", "mode.release")
    set_kind("static")
    set_languages("c++11")
    add_files("jujube.cpp", "npole.cpp")
    add_includedirs(".", {public = true})
    add_headerfiles("jujube.h", "npole.h")
    if is_plat("windows") then
        add_cxflags("/utf-8")
        add_syslinks("oleaut32", "ole32", "uuid")
    elseif is_plat("linux", "macosx", "bsd") then
        add_syslinks("dl")
    end
    if not is_plat("windows", "mingw") then
        add_cxflags("-fPIC")
    end
