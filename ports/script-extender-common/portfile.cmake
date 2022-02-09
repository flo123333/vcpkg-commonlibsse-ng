vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO ianpatt/common
  REF 66149ee3e5cc783884658bc9500e944d3a61bfbe
  SHA512 90a612613ce03b38dbbf4c0b3354bfcb1150ca3b8a5e9709c371edb3fd4af5b0f94ea138bacabc2fab1be2ebd39c9bd25dee9eb43b26c754725bbcf934c48b03
  HEAD_REF master
)

vcpkg_configure_cmake(
SOURCE_PATH "${SOURCE_PATH}"
PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
