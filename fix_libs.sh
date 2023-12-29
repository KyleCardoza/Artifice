EXECFILE=${BUILT_PRODUCTS_DIR}/${EXECUTABLE_PATH}
LIBPATH=${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}
NEWLIBPATH="@executable_path/../Frameworks"

install_name_tool -id "@executable_path/../Frameworks/libMagickCore-6.Q16.2.dylib" "${LIBPATH}/libMagickCore-6.Q16.2.dylib"

install_name_tool -change "/opt/ImageMagick/lib/libMagickCore-6.Q16.2.dylib" "@executable_path/../Frameworks/libMagickCore-6.Q16.2.dylib" "${LIBPATH}/libMagickWand-6.Q16.2.dylib"

install_name_tool -id "@executable_path/../Frameworks/libMagicklibMagickWand-6.Q16.2.dylib" "${LIBPATH}/libMagickWand-6.Q16.2.dylib"

install_name_tool -change "/opt/ImageMagick/lib/libMagickCore-6.Q16.2.dylib" "@executable_path/../Frameworks/libMagickCore-6.Q16.2.dylib" "${EXECFILE}"

install_name_tool -change "/opt/ImageMagick/lib/libMagickWand-6.Q16.2.dylib" "@executable_path/../Frameworks/libMagickWand-6.Q16.2.dylib" "${EXECFILE}"
