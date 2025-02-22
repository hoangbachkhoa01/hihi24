# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(imu_filter_madgwick_CONFIG_INCLUDED)
  return()
endif()
set(imu_filter_madgwick_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("FALSE" STREQUAL "TRUE")
  set(imu_filter_madgwick_SOURCE_PREFIX /home/khoa/catkin_ws/src/imu_filter_madgwick)
  set(imu_filter_madgwick_DEVEL_PREFIX /home/khoa/catkin_ws/devel_isolated/imu_filter_madgwick)
  set(imu_filter_madgwick_INSTALL_PREFIX "")
  set(imu_filter_madgwick_PREFIX ${imu_filter_madgwick_DEVEL_PREFIX})
else()
  set(imu_filter_madgwick_SOURCE_PREFIX "")
  set(imu_filter_madgwick_DEVEL_PREFIX "")
  set(imu_filter_madgwick_INSTALL_PREFIX /home/khoa/catkin_ws/install_isolated)
  set(imu_filter_madgwick_PREFIX ${imu_filter_madgwick_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'imu_filter_madgwick' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(imu_filter_madgwick_FOUND_CATKIN_PROJECT TRUE)

if(NOT "include;/usr/include " STREQUAL " ")
  set(imu_filter_madgwick_INCLUDE_DIRS "")
  set(_include_dirs "include;/usr/include")
  if(NOT " " STREQUAL " ")
    set(_report "Check the issue tracker '' and consider creating a ticket if the problem has not been reported yet.")
  elseif(NOT "http://ros.org/wiki/imu_filter_madgwick " STREQUAL " ")
    set(_report "Check the website 'http://ros.org/wiki/imu_filter_madgwick' for information and consider reporting the problem.")
  else()
    set(_report "Report the problem to the maintainer 'Martin Günther <martin.guenther1980@gmail.com>, Ivan Dryanovski <ivan.dryanovski@gmail.com>' and request to fix the problem.")
  endif()
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${imu_filter_madgwick_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'imu_filter_madgwick' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  ${_report}")
      endif()
    else()
      message(FATAL_ERROR "Project 'imu_filter_madgwick' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '\${prefix}/${idir}'.  ${_report}")
    endif()
    _list_append_unique(imu_filter_madgwick_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "imu_filter;imu_filter_nodelet;/usr/lib/x86_64-linux-gnu/libboost_system.so;/usr/lib/x86_64-linux-gnu/libboost_thread.so;/usr/lib/x86_64-linux-gnu/libboost_signals.so;/usr/lib/x86_64-linux-gnu/libboost_chrono.so;/usr/lib/x86_64-linux-gnu/libboost_date_time.so;/usr/lib/x86_64-linux-gnu/libboost_atomic.so;/usr/lib/x86_64-linux-gnu/libpthread.so")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND imu_filter_madgwick_LIBRARIES ${library})
  elseif(${library} MATCHES "^-l")
    list(APPEND imu_filter_madgwick_LIBRARIES ${library})
  elseif(${library} MATCHES "^-")
    # This is a linker flag/option (like -pthread)
    # There's no standard variable for these, so create an interface library to hold it
    if(NOT imu_filter_madgwick_NUM_DUMMY_TARGETS)
      set(imu_filter_madgwick_NUM_DUMMY_TARGETS 0)
    endif()
    # Make sure the target name is unique
    set(interface_target_name "catkin::imu_filter_madgwick::wrapped-linker-option${imu_filter_madgwick_NUM_DUMMY_TARGETS}")
    while(TARGET "${interface_target_name}")
      math(EXPR imu_filter_madgwick_NUM_DUMMY_TARGETS "${imu_filter_madgwick_NUM_DUMMY_TARGETS}+1")
      set(interface_target_name "catkin::imu_filter_madgwick::wrapped-linker-option${imu_filter_madgwick_NUM_DUMMY_TARGETS}")
    endwhile()
    add_library("${interface_target_name}" INTERFACE IMPORTED)
    if("${CMAKE_VERSION}" VERSION_LESS "3.13.0")
      set_property(
        TARGET
        "${interface_target_name}"
        APPEND PROPERTY
        INTERFACE_LINK_LIBRARIES "${library}")
    else()
      target_link_options("${interface_target_name}" INTERFACE "${library}")
    endif()
    list(APPEND imu_filter_madgwick_LIBRARIES "${interface_target_name}")
  elseif(TARGET ${library})
    list(APPEND imu_filter_madgwick_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND imu_filter_madgwick_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/khoa/catkin_ws/install_isolated/lib;/home/khoa/catkin_ws/devel_isolated/fake_localization/lib;/home/khoa/catkin_ws/devel_isolated/amcl/lib;/home/khoa/catkin_ws/devel_isolated/tf2_geometry_msgs/lib;/home/khoa/catkin_ws/devel_isolated/test_osm/lib;/home/khoa/catkin_ws/devel_isolated/rosserial_windows/lib;/home/khoa/catkin_ws/devel_isolated/rosserial_test/lib;/home/khoa/catkin_ws/devel_isolated/rosserial_embeddedlinux/lib;/home/khoa/catkin_ws/devel_isolated/polar_scan_matcher/lib;/home/khoa/catkin_ws/devel_isolated/osm_cartography/lib;/home/khoa/catkin_ws/devel_isolated/ncd_parser/lib;/home/khoa/catkin_ws/devel_isolated/mobile_robot/lib;/home/khoa/catkin_ws/devel_isolated/mobile_robot_description/lib;/home/khoa/catkin_ws/devel_isolated/laser_scan_matcher/lib;/home/khoa/catkin_ws/devel_isolated/laser_ortho_projector/lib;/home/khoa/catkin_ws/devel_isolated/laser_filters/lib;/home/khoa/catkin_ws/devel_isolated/imu_complementary_filter/lib;/home/khoa/catkin_ws/devel_isolated/hector_trajectory_server/lib;/home/khoa/catkin_ws/devel_isolated/hector_map_server/lib;/home/khoa/catkin_ws/devel_isolated/hector_imu_tools/lib;/home/khoa/catkin_ws/devel_isolated/hector_imu_attitude_to_tf/lib;/home/khoa/catkin_ws/devel_isolated/tf/lib;/home/khoa/catkin_ws/devel_isolated/tf2_ros/lib;/home/khoa/catkin_ws/devel_isolated/tf2_py/lib;/home/khoa/catkin_ws/devel_isolated/tf2_eigen/lib;/home/khoa/catkin_ws/devel_isolated/tf2_bullet/lib;/home/khoa/catkin_ws/devel_isolated/map_server/lib;/home/khoa/catkin_ws/devel_isolated/tf2/lib;/home/khoa/catkin_ws/devel_isolated/tf2_msgs/lib;/home/khoa/catkin_ws/devel_isolated/test_launches/lib;/home/khoa/catkin_ws/devel_isolated/teleop_twist_keyboard/lib;/home/khoa/catkin_ws/devel_isolated/teleop_twist_joy/lib;/home/khoa/catkin_ws/devel_isolated/teb_navigation/lib;/home/khoa/catkin_ws/devel_isolated/scan_tools/lib;/home/khoa/catkin_ws/devel_isolated/scan_to_cloud_converter/lib;/home/khoa/catkin_ws/devel_isolated/rviz_satellite/lib;/home/khoa/catkin_ws/devel_isolated/rviz_distance_tool/lib;/home/khoa/catkin_ws/devel_isolated/rplidar_ros/lib;/home/khoa/catkin_ws/devel_isolated/route_network/lib;/home/khoa/catkin_ws/devel_isolated/rosserial_xbee/lib;/home/khoa/catkin_ws/devel_isolated/rosserial_vex_v5/lib;/home/khoa/catkin_ws/devel_isolated/rosserial_vex_cortex/lib;/home/khoa/catkin_ws/devel_isolated/rosserial_tivac/lib;/home/khoa/catkin_ws/devel_isolated/rosserial_server/lib;/home/khoa/catkin_ws/devel_isolated/rosserial_python/lib;/home/khoa/catkin_ws/devel_isolated/rosserial_client/lib;/home/khoa/catkin_ws/devel_isolated/rosserial_msgs/lib;/home/khoa/catkin_ws/devel_isolated/rosserial_mbed/lib;/home/khoa/catkin_ws/devel_isolated/rosserial_arduino/lib;/home/khoa/catkin_ws/devel_isolated/rosserial/lib;/home/khoa/catkin_ws/devel_isolated/nmea_msgs/lib;/home/khoa/catkin_ws/devel_isolated/navigation/lib;/home/khoa/catkin_ws/devel_isolated/my_summit_path_planning/lib;/home/khoa/catkin_ws/devel_isolated/my_summit_mapping/lib;/home/khoa/catkin_ws/devel_isolated/my_summit_localization/lib;/home/khoa/catkin_ws/devel_isolated/my_move_base/lib;/home/khoa/catkin_ws/devel_isolated/my_laser_matcher/lib;/home/khoa/catkin_ws/devel_isolated/mpu_6050_driver/lib;/home/khoa/catkin_ws/devel_isolated/mobile_robot_simulation/lib;/home/khoa/catkin_ws/devel_isolated/mobile_robot_base/lib;/home/khoa/catkin_ws/devel_isolated/mobile_mini/lib;/home/khoa/catkin_ws/devel_isolated/marti_visualization_msgs/lib;/home/khoa/catkin_ws/devel_isolated/marti_status_msgs/lib;/home/khoa/catkin_ws/devel_isolated/marti_sensor_msgs/lib;/home/khoa/catkin_ws/devel_isolated/marti_perception_msgs/lib;/home/khoa/catkin_ws/devel_isolated/marti_nav_msgs/lib;/home/khoa/catkin_ws/devel_isolated/marti_dbw_msgs/lib;/home/khoa/catkin_ws/devel_isolated/marti_common_msgs/lib;/home/khoa/catkin_ws/devel_isolated/marti_can_msgs/lib;/home/khoa/catkin_ws/devel_isolated/laser_scan_splitter/lib;/home/khoa/catkin_ws/devel_isolated/laser_scan_sparsifier/lib;/home/khoa/catkin_ws/devel_isolated/kdl_conversions/lib;/home/khoa/catkin_ws/devel_isolated/hector_slam_launch/lib;/home/khoa/catkin_ws/devel_isolated/hector_slam/lib;/home/khoa/catkin_ws/devel_isolated/hector_geotiff_plugins/lib;/home/khoa/catkin_ws/devel_isolated/hector_geotiff/lib;/home/khoa/catkin_ws/devel_isolated/hector_nav_msgs/lib;/home/khoa/catkin_ws/devel_isolated/hector_marker_drawing/lib;/home/khoa/catkin_ws/devel_isolated/hector_compressed_map_transport/lib;/home/khoa/catkin_ws/devel_isolated/hector_map_tools/lib;/home/khoa/catkin_ws/devel_isolated/gps_rviz_plugin/lib;/home/khoa/catkin_ws/devel_isolated/gps_navigation/lib;/home/khoa/catkin_ws/devel_isolated/geometry2/lib;/home/khoa/catkin_ws/devel_isolated/geometry/lib;/home/khoa/catkin_ws/devel_isolated/eigen_conversions/lib;/home/khoa/catkin_ws/devel_isolated/Sub/lib;/home/khoa/catkin_ws/devel/lib;/opt/ros/melodic/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(imu_filter_madgwick_LIBRARY_DIRS ${lib_path})
      list(APPEND imu_filter_madgwick_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'imu_filter_madgwick'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND imu_filter_madgwick_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(imu_filter_madgwick_EXPORTED_TARGETS "imu_filter_madgwick_gencfg")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${imu_filter_madgwick_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "roscpp;sensor_msgs;geometry_msgs;tf2_ros;tf2_geometry_msgs;nodelet;pluginlib;message_filters;dynamic_reconfigure")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 imu_filter_madgwick_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${imu_filter_madgwick_dep}_FOUND)
      find_package(${imu_filter_madgwick_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${imu_filter_madgwick_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(imu_filter_madgwick_INCLUDE_DIRS ${${imu_filter_madgwick_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(imu_filter_madgwick_LIBRARIES ${imu_filter_madgwick_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${imu_filter_madgwick_dep}_LIBRARIES})
  _list_append_deduplicate(imu_filter_madgwick_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(imu_filter_madgwick_LIBRARIES ${imu_filter_madgwick_LIBRARIES})

  _list_append_unique(imu_filter_madgwick_LIBRARY_DIRS ${${imu_filter_madgwick_dep}_LIBRARY_DIRS})
  list(APPEND imu_filter_madgwick_EXPORTED_TARGETS ${${imu_filter_madgwick_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${imu_filter_madgwick_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
