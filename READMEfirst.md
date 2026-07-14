# AutoCAD Install Fix

AutoCAD 2027 安装卡在 89% 或 97% 时的一键修复脚本，免重启。

## 适用场景

- AutoCAD 2027 安装进度卡在 89%，材质库安装阶段回退
- 授权服务（AdskLicensingService）异常导致安装中断
- 历史安装残留导致新安装失败

## 快速使用

右键 `fix.bat` → **以管理员身份运行**，脚本按以下步骤自动执行：

| 步骤 | 操作 |
|------|------|
| 1 | 终止冲突进程（acad.exe / setup.exe / msiexec.exe / AdskLicensingService.exe） |
| 2 | 修复授权服务（停用 → 设为自动启动 → 切换为本地系统账户 → 重新启动） |
| 3 | 卸载卡死的材质库及 Recap 组件（含两条硬编码 GUID） |
| 4 | 删除材质库残留目录 |
| 5 | 删除 `C:\Autodesk` 安装缓存 |
| 6 | 清空 `%TEMP%`、`C:\Windows\Temp`、用户本地临时目录 |
| 7 | 重置 Windows Installer 服务 |
| 8 | 临时关闭 Windows Defender 实时防护 |
| — | 自动启动安装程序 |

## 使用前需要修改的地方

打开 `fix.bat`，搜索以下标记并改为你自己的路径和版本：

### 1. 安装程序路径（必改）

```batch
# 脚本最后一行，改为你实际的 setup.exe 路径
"D:\CAD2027\CAD2027\Setup\setup.exe"
```

### 2. 材质库 GUID（换版本必改）

```batch
# 以下两个 GUID 对应 AutoCAD 2027 的材质库组件
# 如果用的是其他版本（2025/2026 等），请用 Orca 或 Registry 查找对应的 ProductCode 替换
msiexec /x {A4E5D97F-7933-47C2-890C-0A6E5A0E7ECF} /qn >nul 2>&1
msiexec /x {6AB9E00A-7E90-44D2-8591-7D91DE5458E2} /qn >nul 2>&1
```

> 查找 GUID 的方法：打开注册表 `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall`，搜索 "Material Library"，找到 `UninstallString` 中的 GUID。

### 3. 版本号路径（换版本必改）

```batch
# 清理安装缓存时指定的版本路径，改为你实际的版本号
rd /s /q "C:\Autodesk\WI\Autodesk AutoCAD 2027" >nul 2>&1
```

## 注意事项

- 安装程序启动后，务必选择 **自定义安装**，手动取消勾选以下组件：
  - Material Library（材质库）
  - Recap
  - Docs（文档）
- 第 8 步会临时关闭 Windows Defender 实时防护。安装完成后进入 **Windows 安全中心 → 病毒和威胁防护 → 管理设置**，手动重新开启实时保护。
- 脚本会清空临时文件夹，请提前保存临时目录中的重要文件。
- 仅在实际安装环境（Windows 11 22H2+）测试通过，其他系统版本未验证。

## 项目结构

```
autocad-install-fix/
├── fix.bat       # 一键修复脚本
└── README.md     # 本文件
```

## 许可

MIT License
