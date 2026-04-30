@echo off
REM ==========================================
REM 部署到 NAS 的构建脚本
REM 使用: deploy-nas.bat [目标目录]
REM 默认目标: D:\nas\reading-notes
REM ==========================================

set TARGET_DIR=%1
if "%TARGET_DIR%"=="" set TARGET_DIR=D:\nas\reading-notes

echo [1/2] 构建静态站点...
call npx quartz build

echo [2/2] 复制文件到 NAS 目录...
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"
xcopy /E /I /Y public\* "%TARGET_DIR%"

echo ✅ 部署完成! 文件已输出到: %TARGET_DIR%
echo 📌 使用 Nginx/Apache 指向该目录即可访问