if (VCPKG_LIBRARY_LINKAGE STREQUAL static)
  message(STATUS "Note: Fully Dynamic Game Engine overrides static library linkage to dynamic to build its DLL; you can still statically link to Trueflame/Hopesfire.")
endif ()
set(VCPKG_LIBRARY_LINKAGE dynamic)

vcpkg_from_gitlab(
  GITLAB_URL https://gitlab.com
  OUT_SOURCE_PATH SOURCE_PATH
  REPO colorglass/fully-dynamic-game-engine
  REF 7f28b30104972462756398155129f081f6342f05
  SHA512 0
  HEAD_REF main
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        "trueflame"          BUILD_TRUEFLAME
        "black-book"         BUILD_BLACK_BOOK
        "black-book-scripts" INSTALL_BLACK_BOOK_SCRIPTS
        "hopesfire"          BUILD_HOPESFIRE
        "trueflame-tests"    BUILD_TRUEFLAME_TESTS
        "black-book-tests"   BUILD_BLACK_BOOK_TESTS
        "hopesfire-tests"    BUILD_HOPESFIRE_TESTS
        )

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME FullyDynamicGameEngine CONFIG_PATH share)

file(GLOB CMAKE_CONFIGS "${CURRENT_PACKAGES_DIR}/share/FullyDynamicGameEngine/FullyDynamicGameEngine/*.cmake")
file(INSTALL ${CMAKE_CONFIGS} DESTINATION "${CURRENT_PACKAGES_DIR}/share/FullyDynamicGameEngine")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/FullyDynamicGameEngine/FullyDynamicGameEngine")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)

# if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
#   file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin" "${CURRENT_PACKAGES_DIR}/debug/bin")
# endif()

if (INSTALL_BLACK_BOOK_SCRIPTS)
  file(GLOB FDGE_SCRIPTS
    "${SOURCE_PATH}/BlackBook/contrib/Papyrus/Source/Scripts/*.psc"
  )

  file(INSTALL ${FDGE_SCRIPTS}
       DESTINATION "${CURRENT_PACKAGES_DIR}/contrib/papyrus/fully-dynamic-game-engine"
  )
endif ()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
