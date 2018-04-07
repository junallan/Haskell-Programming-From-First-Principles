{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_arbitrary (
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

bindir     = "D:\\Projects\\Haskell Programming From First Principles\\Ch14\\arbitrary\\.stack-work\\install\\df451585\\bin"
libdir     = "D:\\Projects\\Haskell Programming From First Principles\\Ch14\\arbitrary\\.stack-work\\install\\df451585\\lib\\x86_64-windows-ghc-8.2.2\\arbitrary-0.1.0.0-6wBPFUbftTw3CpXquhqa5f-arbitrary"
dynlibdir  = "D:\\Projects\\Haskell Programming From First Principles\\Ch14\\arbitrary\\.stack-work\\install\\df451585\\lib\\x86_64-windows-ghc-8.2.2"
datadir    = "D:\\Projects\\Haskell Programming From First Principles\\Ch14\\arbitrary\\.stack-work\\install\\df451585\\share\\x86_64-windows-ghc-8.2.2\\arbitrary-0.1.0.0"
libexecdir = "D:\\Projects\\Haskell Programming From First Principles\\Ch14\\arbitrary\\.stack-work\\install\\df451585\\libexec\\x86_64-windows-ghc-8.2.2\\arbitrary-0.1.0.0"
sysconfdir = "D:\\Projects\\Haskell Programming From First Principles\\Ch14\\arbitrary\\.stack-work\\install\\df451585\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "arbitrary_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "arbitrary_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "arbitrary_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "arbitrary_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "arbitrary_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "arbitrary_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
