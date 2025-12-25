# -*- mode: python ; coding: utf-8 -*-

from PyInstaller.utils.hooks import collect_dynamic_libs, collect_submodules

block_cipher = None

try:
    hidapi_binaries = collect_dynamic_libs('hidapi')
except:
    hidapi_binaries = []

try:
    hidapi_modules = collect_submodules('hidapi')
except:
    hidapi_modules = []

a = Analysis(
    ['sora_tray.py'],
    pathex=[],
    binaries=hidapi_binaries,
    datas=[
        ('icons', 'icons'),
    ],
    hiddenimports=[
        'wx.lib.agw',
        'wx.lib.pubsub',
        'hid',
    ] + hidapi_modules,
    hookspath=['hooks'],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)

pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.zipfiles,
    a.datas,
    [],
    name='sora_tray',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon=None,
)

