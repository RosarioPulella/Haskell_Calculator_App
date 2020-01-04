{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_pCalc (
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

bindir     = "C:\\Users\\OE\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\OE\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.5\\pCalc-0.1.0.0-KiRJ6KeacJ0t90dYCr8DQ-pCalc"
dynlibdir  = "C:\\Users\\OE\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.5"
datadir    = "C:\\Users\\OE\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.5\\pCalc-0.1.0.0"
libexecdir = "C:\\Users\\OE\\AppData\\Roaming\\cabal\\pCalc-0.1.0.0-KiRJ6KeacJ0t90dYCr8DQ-pCalc\\x86_64-windows-ghc-8.6.5\\pCalc-0.1.0.0"
sysconfdir = "C:\\Users\\OE\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "pCalc_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "pCalc_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "pCalc_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "pCalc_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "pCalc_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "pCalc_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
