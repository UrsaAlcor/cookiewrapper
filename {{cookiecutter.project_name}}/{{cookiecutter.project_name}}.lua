help([[
Description
===========
Load {{cookiecutter.project_name}} compression library

]])

local name = "${package}"
local version = "${version}"
local dist = os.getenv("ALCOR_DIST")

local path = pathJoin(dist, name, version)

-- Binary folder
prepend_path("PATH", pathJoin(path, "bin"))

-- Static Library folders
prepend_path("LIBRARY_PATH", pathJoin(path, "lib"))

-- Dynamic Library folders
prepend_path("LD_LIBRARY_PATH", pathJoin(path, "lib"))

-- Man Pages
prepend_path("MANPATH", pathJoin(path, "share", "man"))

-- Includes
prepend_path("CPATH", pathJoin(path,"include"))

-- Package configuration
prepend_path("PKG_CONFIG_PATH", pathJoin(path, "lib", "pkgconfig"))
