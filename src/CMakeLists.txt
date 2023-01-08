add_executable(metis_example metis_example.cpp)
target_link_libraries(metis_example PUBLIC
                      ${CMAKE_SOURCE_DIR}/external/METIS/prefix/lib/libmetis.a
                      ${CMAKE_SOURCE_DIR}/external/GKlib/prefix/lib/libGKlib.a)