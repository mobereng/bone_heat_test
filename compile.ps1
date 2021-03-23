New-Item -ItemType Directory -Force -Path build/
Remove-Item build/* -Recurse -Confirm:$false -exclude .gitkeep
cmake -S . -B build/ -DCMAKE_GENERATOR_PLATFORM=x64 -DLIBIGL_DIR="../../libraries/libigl/"
MSBuild.exe build/BoneHeat.sln -property:Configuration=Release -m -fl -flp:logfile=diagnostic.log;verbosity=diagnostic
MSBuild.exe build/BoneHeat.sln -property:Configuration=Release -m -fl -flp:logfile=detailed.log;verbosity=detailed
MSBuild.exe build/BoneHeat.sln -property:Configuration=Release -m -fl -flp:logfile=normal.log;verbosity=normal
MSBuild.exe build/BoneHeat.sln -property:Configuration=Release -m -fl -flp:logfile=minimal.log;verbosity=minimal
MSBuild.exe build/BoneHeat.sln -property:Configuration=Release -m -fl -flp:logfile=quiet.log;verbosity=quiet
