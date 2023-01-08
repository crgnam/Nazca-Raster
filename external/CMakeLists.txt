add_subdirectory(tinyobjloader)
# add_subdirectory(METIS)
# add_subdirectory(GKlib)

# Manually add lodepng library as it does not come with a CMakeLists.txt
add_library(
    lodepng

    lodepng/lodepng.cpp
    lodepng/lodepng.h
)
set_target_properties(lodepng PROPERTIES LINKER_LANGUAGE CXX)