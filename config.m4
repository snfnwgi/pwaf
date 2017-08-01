dnl $Id$
dnl config.m4 for extension pwaf

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary. This file will not work
dnl without editing.

dnl If your extension references something external, use with:

dnl PHP_ARG_WITH(pwaf, for pwaf support,
dnl Make sure that the comment is aligned:
dnl [  --with-pwaf             Include pwaf support])

dnl Otherwise use enable:

PHP_ARG_ENABLE(pwaf, whether to enable pwaf support,
Make sure that the comment is aligned:
[  --enable-pwaf           Enable pwaf support])

if test "$PHP_PWAF" != "no"; then
  dnl Write more examples of tests here...

  dnl # --with-pwaf -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/pwaf.h"  # you most likely want to change this
  dnl if test -r $PHP_PWAF/$SEARCH_FOR; then # path given as parameter
  dnl   PWAF_DIR=$PHP_PWAF
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for pwaf files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       PWAF_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$PWAF_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the pwaf distribution])
  dnl fi

  dnl # --with-pwaf -> add include path
  dnl PHP_ADD_INCLUDE($PWAF_DIR/include)

  dnl # --with-pwaf -> check for lib and symbol presence
  dnl LIBNAME=pwaf # you may want to change this
  dnl LIBSYMBOL=pwaf # you most likely want to change this 

  dnl PHP_CHECK_LIBRARY($LIBNAME,$LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $PWAF_DIR/$PHP_LIBDIR, PWAF_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_PWAFLIB,1,[ ])
  dnl ],[
  dnl   AC_MSG_ERROR([wrong pwaf lib version or lib not found])
  dnl ],[
  dnl   -L$PWAF_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(PWAF_SHARED_LIBADD)

  PHP_NEW_EXTENSION(pwaf, pwaf.c, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
fi
