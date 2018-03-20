{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_gimmePerson (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "D:\\Projects\\Haskell Programming From First Principles\\Ch13\\gimmePerson\\.stack-work\\install\\d318cd9c\\bin"
libdir     = "D:\\Projects\\Haskell Programming From First Principles\\Ch13\\gimmePerson\\.stack-work\\install\\d318cd9c\\lib\\x86_64-windows-ghc-8.2.2\\gimmePerson-0.1.0.0-AURpD6PMhFz1Z70AHR6I4s-gimmePerson"
dynlibdir  = "D:\\Projects\\Haskell Programming From First Principles\\Ch13\\gimmePerson\\.stack-work\\install\\d318cd9c\\lib\\x86_64-windows-ghc-8.2.2"
datadir    = "D:\\Projects\\Haskell Programming From First Principles\\Ch13\\gimmePerson\\.stack-work\\install\\d318cd9c\\share\\x86_64-windows-ghc-8.2.2\\gimmePerson-0.1.0.0"
libexecdir = "D:\\Projects\\Haskell Programming From First Principles\\Ch13\\gimmePerson\\.stack-work\\install\\d318cd9c\\libexec\\x86_64-windows-ghc-8.2.2\\gimmePerson-0.1.0.0"
sysconfdir = "D:\\Projects\\Haskell Programming From First Principles\\Ch13\\gimmePerson\\.stack-work\\install\\d318cd9c\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "gimmePerson_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "gimmePerson_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "gimmePerson_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "gimmePerson_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "gimmePerson_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "gimmePerson_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
