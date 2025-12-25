from PyInstaller.utils.hooks import collect_dynamic_libs, collect_data_files

binaries = collect_dynamic_libs('hidapi')
datas = collect_data_files('hidapi')
hiddenimports = ['hid', 'hidapi']

