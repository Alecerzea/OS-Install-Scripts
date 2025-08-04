@echo off
for %%f in (*.webp) do (
    ffmpeg -i "%%f" "%%~nf.jpg"
    if exist "%%~nf.jpg" (
        del "%%f"
        echo Converted and removed: %%f
    ) else (
        echo Failed to convert: %%f
    )
)
echo All done!
pause

