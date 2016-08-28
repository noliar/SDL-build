$rev=& 'hg.exe' @('tip', '--template', '"hg-{rev}:{node|short}"');
Write-Host $rev;
$revnum=& 'hg.exe' @('tip', '--template', '"{rev}"');
Write-Host $revnum;
"#define SDL_REVISION ""$rev""`r`n#define SDL_REVISION_NUMBER $revnum" | Out-File "$env:APPVEYOR_BUILD_FOLDER\submodules\SDL\include\SDL_revision.h";
[Environment]::SetEnvironmentVariable("REVNUM", $revnum, "User");
