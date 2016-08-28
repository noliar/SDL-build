& 'MSBuild.exe' @('submodules/SDL/VisualC-WinRT/UWP_VS2015/SDL-UWP.vcxproj', '/p:Configuration=Release', '/p:Platform=ARM');
New-Item -Force -ItemType directory -Path ./output/uwp/contents/runtimes/win10-arm/native;
Copy-Item .\submodules\SDL\VisualC-WinRT\UWP_VS2015\ARM\Release\SDL-UWP\SDL2.dll output\uwp\contents\runtimes\win10-arm\native;
& 'MSBuild.exe' @('submodules/SDL/VisualC-WinRT/UWP_VS2015/SDL-UWP.vcxproj', '/p:Configuration=Release', '/p:Platform=x64');
New-Item -Force -ItemType directory -Path ./output/uwp/contents/runtimes/win10-x64/native;
Copy-Item .\submodules\SDL\VisualC-WinRT\UWP_VS2015\x64\Release\SDL-UWP\SDL2.dll output\uwp\contents\runtimes\win10-x64\native;
& 'MSBuild.exe' @('submodules/SDL/VisualC-WinRT/UWP_VS2015/SDL-UWP.vcxproj', '/p:Configuration=Release', '/p:Platform=Win32');
New-Item -Force -ItemType directory -Path ./output/uwp/contents/runtimes/win10-x86/native;
Copy-Item .\submodules\SDL\VisualC-WinRT\UWP_VS2015\Release\SDL-UWP\SDL2.dll output\uwp\contents\runtimes\win10-x86\native;
$rev=[Environment]::GetEnvironmentVariable("REVNUM","User");
Invoke-WebRequest "https://dist.nuget.org/win-x86-commandline/v3.5.0-rc1/NuGet.exe" -OutFile "$env:APPVEYOR_BUILD_FOLDER\nuget.exe"
& "$env:APPVEYOR_BUILD_FOLDER\nuget.exe" @('pack', 'build\DevZH.SDL.Internal-UWP.nuspec', '-BasePath', "$env:APPVEYOR_BUILD_FOLDER\output\uwp", '-Version', '"2.0.4"', '-Suffix', """nightly-$rev""", '-Verbosity', 'detailed');
& 'MSBuild.exe' @('submodules/SDL/VisualC/SDL/SDL.vcxproj', '/p:PlatformToolset=v140', '/p:Configuration=Release', '/p:Platform=Win32');
New-Item -Force -ItemType directory -Path ./output/win/contents/runtimes/win7-x86/native;
Copy-Item .\submodules\SDL\VisualC\SDL\Win32\Release\SDL2.dll output\win\contents\runtimes\win7-x86\native;
& 'MSBuild.exe' @('submodules/SDL/VisualC/SDL/SDL.vcxproj', '/p:PlatformToolset=v140', '/p:Configuration=Release', '/p:Platform=x64');
New-Item -Force -ItemType directory -Path ./output/win/contents/runtimes/win7-x64/native;
Copy-Item .\submodules\SDL\VisualC\SDL\x64\Release\SDL2.dll output\win\contents\runtimes\win7-x64\native
& "$env:APPVEYOR_BUILD_FOLDER\nuget.exe" @('pack', 'build\DevZH.SDL.Internal-Windows.nuspec', '-BasePath', "$env:APPVEYOR_BUILD_FOLDER\output\win", '-Version', '"2.0.4"', '-Suffix', """nightly-$rev""", '-Verbosity', 'detailed');
