@echo off
del *.pdf

set files=resume-cn,resume,resume-elab
echo Generating...

for %%f in (%files%) do (
  (
    echo #import "main.typ": *;
    echo #show: chicv
  ) > %%f.typ
)

echo #runReader(Chinese) >> resume-cn.typ
echo #runReader(Simplified) >> resume.typ
echo #runReader(EnglishFull) >> resume-elab.typ

for %%f in (%files%) do (
  typst compile %%f.typ
  @REM del %%f.typ
)
