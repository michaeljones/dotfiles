#!/bin/tcsh -f

set installdir = "/user_data/ARCHIVE/local/git"
mkdir -p $installdir

cd $installdir

# Grab the latest git page
wget http://git.or.cz/ >& /dev/null

if ( ! -e index.html ) then
	exit
endif

# Find the link in it
grep ">tar.gz<" index.html | sed 's/^.*http/http/g' | sed 's/">.*$//g' > url

set tarball = `cat url | sed 's/^.*\///g'` 
set gitversion = `cat url | sed 's/^.*\///g' | sed 's/.tar.gz//g'`

if ( -e $installdir/latest ) then
	set lastversion = `cat $installdir/latest`
	if ( $lastversion == $gitversion ) then
		rm -f $installdir/index.html $installdir/url
		exit
	endif
endif

# Download it
cat url | xargs wget >& /dev/null

# Extract it
tar zxf $tarball

# Change into the extracted directory
cd $gitversion

# Make and install it
make prefix=/user_data/ARCHIVE/local/git NO_DEFLATE_BOUND=1 >& $installdir/install.log
make prefix=/user_data/ARCHIVE/local/git NO_DEFLATE_BOUND=1 doc >>& $installdir/install.log
make prefix=/user_data/ARCHIVE/local/git NO_DEFLATE_BOUND=1 install >>& $installdir/install.log
make prefix=/user_data/ARCHIVE/local/git NO_DEFLATE_BOUND=1 install-doc >>& $installdir/install.log

echo $gitversion > $installdir/latest

cd $installdir

# Release notes
grep ">Release notes<" index.html | sed 's/^.*http/http/g' | sed 's/">.*$//g' > url
cat url | xargs wget >& /dev/null

set notes = `cat url | sed 's/^.*\///g'`

cat $notes | mail -s "$gitversion has been installed" $EMAIL

rm -f $installdir/index.html
rm -f $installdir/url

