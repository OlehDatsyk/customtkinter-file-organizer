@echo off
setlocal enabledelayedexpansion
title File Organizer - Startup
cd /d "%~dp0"

echo =====================================================================
echo   File Organizer - Windows Startup Script (Was made by Oleh Datsyk)
echo =====================================================================
echo.

REM --- Step 1: Check Python is installed ---
echo [1/5] Checking for Python...
where python >nul 2>nul
if errorlevel 1 (
    echo.
    echo [ERROR] Python was not found on this computer.
    echo Please install Python from https://www.python.org/downloads/
    echo During installation, make sure to check "Add python.exe to PATH".
    echo.
    pause
    exit /b 1
)
echo     Python found: 
python --version
echo.

REM --- Step 2: Create virtual environment if it doesn't exist ---
echo [2/5] Checking for virtual environment...
if not exist "venv\Scripts\activate.bat" (
    echo     No virtual environment found. Creating one now...
    python -m venv venv
    if errorlevel 1 (
        echo.
        echo [ERROR] Failed to create the virtual environment.
        pause
        exit /b 1
    )
    echo     Virtual environment created.
) else (
    echo     Virtual environment already exists.
)
echo.

REM --- Step 3: Activate virtual environment ---
echo [3/5] Activating virtual environment...
call "venv\Scripts\activate.bat"
if errorlevel 1 (
    echo.
    echo [ERROR] Failed to activate the virtual environment.
    pause
    exit /b 1
)
echo     Virtual environment activated.
echo.

REM --- Step 4: Install dependencies ---
echo [4/5] Checking dependencies...
python -c "import customtkinter" >nul 2>nul
if errorlevel 1 (
    echo     customtkinter not found. Installing dependencies...
    if exist "requirements.txt" (
        pip install -r requirements.txt
    ) else (
        pip install customtkinter
    )
    if errorlevel 1 (
        echo.
        echo [ERROR] Failed to install dependencies.
        pause
        exit /b 1
    )
    echo     Dependencies installed.
) else (
    echo     Dependencies already satisfied.
)
echo.

REM --- Step 5: Check for .env file (informational only, app doesn't currently require one) ---
if exist ".env.example" (
    if not exist ".env" (
        echo [INFO] No .env file found. If this app requires configuration,
        echo        copy .env.example to .env and fill in the required values.
        echo.
    )
)

REM --- Launch the application ---
echo [5/5] Launching File Organizer...
echo.
python "File_Organizer.py"

if errorlevel 1 (
    echo.
    echo ============================================
    echo   The application closed with an error.
    echo   See the message above for details.
    echo ============================================
    pause
    exit /b 1
)

echo.
echo Application closed normally.
pause
