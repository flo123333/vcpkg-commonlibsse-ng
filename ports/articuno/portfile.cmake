vcpkg_from_gitlab(
  GITLAB_URL https://gitlab.com
  OUT_SOURCE_PATH SOURCE_PATH
  REPO colorglass/articuno
  REF 44a45d9b73e48f0f26f541ccee519c0dda3916a2
  SHA512 ef5322c5999b3e930f49ade541752ee91ad26112043bedcbcbd04df3c467a6c772c0162b7409cdf87ed845aef5b7854784967b40ac219c890654ab5431f49f72
  HEAD_REF main
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        "icywind-archive"       BUILD_ICYWIND_ARCHIVE
        "jsoncons-archive"      BUILD_JSONCONS_ARCHIVE
        "rapidyaml-archive"     BUILD_RAPIDYAML_ARCHIVE
        "toml11-archive"        BUILD_TOML11_ARCHIVE
        "tomlplusplus-archive"  BUILD_TOMLPP_ARCHIVE
        "pugixml-archive"       BUILD_PUGIXML_ARCHIVE
        "tests"                 BUILD_TESTS
        )

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_install_cmake()

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
