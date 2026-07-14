# AutoCAD Install Fix / AutoCAD インストール修正 / AutoCAD 설치 수정

一键修复 AutoCAD 2027 安装卡 89%/97% 的批处理脚本。

---

## English

**Applicable Scenarios:**
- AutoCAD 2027 installation stuck at 89%, rolling back during material library phase
- Licensing service (AdskLicensingService) failure interrupting installation
- Previous installation leftovers preventing fresh install

**Usage:** Right-click `fix.bat` → **Run as Administrator**.

| Step | Action |
|------|--------|
| 1 | Kill conflicting processes (acad.exe / setup.exe / msiexec.exe / AdskLicensingService.exe) |
| 2 | Repair licensing service (stop → set auto-start → switch to LocalSystem → restart) |
| 3 | Uninstall stuck material libraries and Recap components (includes two hardcoded GUIDs) |
| 4 | Delete material library residual directories |
| 5 | Delete `C:\Autodesk` installation cache |
| 6 | Clear `%TEMP%`, `C:\Windows\Temp`, and user local temp directory |
| 7 | Reset Windows Installer service |
| 8 | Temporarily disable Windows Defender real-time protection |
| — | Auto-launch installer |

**Required Changes Before Use:**

Open `fix.bat` and modify the following:

1. **Installer path (must change):**
   ```batch
   "D:\CAD2027\CAD2027\Setup\setup.exe"   # Replace with your actual path
   ```

2. **Material Library GUIDs (must change for different versions):**
   ```batch
   msiexec /x {A4E5D97F-7933-47C2-890C-0A6E5A0E7ECF} /qn >nul 2>&1
   msiexec /x {6AB9E00A-7E90-44D2-8591-7D91DE5458E2} /qn >nul 2>&1
   ```
   > Find GUID: Registry `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall`, search "Material Library", copy GUID from `UninstallString`.

3. **Version path (must change for different versions):**
   ```batch
   rd /s /q "C:\Autodesk\WI\Autodesk AutoCAD 2027" >nul 2>&1   # Replace version number
   ```

**Notes:**
- During installation, choose **Custom Install** and uncheck: Material Library, Recap, Docs.
- Step 8 temporarily disables Windows Defender. Re-enable it in **Windows Security → Virus & threat protection → Manage settings** after install.
- Script clears temp folders — save important temp files beforehand.
- Tested on Windows 11 22H2+ only.

**License:** MIT

---

## 日本語

**適用シーン:**
- AutoCAD 2027 のインストールが 89% で停止し、マテリアルライブラリの段階でロールバックする
- ライセンスサービス（AdskLicensingService）の異常によるインストール中断
- 過去のインストール残留物が新規インストールを妨げる

**使用方法:** `fix.bat` を右クリック → **管理者として実行**。

| 手順 | 操作 |
|------|------|
| 1 | 競合プロセスの終了（acad.exe / setup.exe / msiexec.exe / AdskLicensingService.exe） |
| 2 | ライセンスサービスの修復（停止 → 自動起動に設定 → LocalSystem に切替 → 再起動） |
| 3 | 停止中のマテリアルライブラリと Recap コンポーネントのアンインストール（2つのハードコード GUID を含む） |
| 4 | マテリアルライブラリの残留ディレクトリを削除 |
| 5 | `C:\Autodesk` インストールキャッシュを削除 |
| 6 | `%TEMP%`、`C:\Windows\Temp`、ユーザー一時フォルダをクリア |
| 7 | Windows Installer サービスをリセット |
| 8 | Windows Defender リアルタイム保護を一時無効化 |
| — | インストーラーを自動起動 |

**使用前に変更が必要な箇所:**

`fix.bat` を開き、以下を修正してください。

1. **インストーラーのパス（要変更）:**
   ```batch
   "D:\CAD2027\CAD2027\Setup\setup.exe"   # 実際のパスに置き換え
   ```

2. **マテリアルライブラリ GUID（他バージョンでは要変更）:**
   ```batch
   msiexec /x {A4E5D97F-7933-47C2-890C-0A6E5A0E7ECF} /qn >nul 2>&1
   msiexec /x {6AB9E00A-7E90-44D2-8591-7D91DE5458E2} /qn >nul 2>&1
   ```
   > GUID の探し方: レジストリ `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall` で "Material Library" を検索し、`UninstallString` から GUID をコピー。

3. **バージョンパス（他バージョンでは要変更）:**
   ```batch
   rd /s /q "C:\Autodesk\WI\Autodesk AutoCAD 2027" >nul 2>&1   # バージョン番号を置き換え
   ```

**注意事項:**
- インストール時に **カスタムインストール** を選択し、Material Library、Recap、Docs のチェックを外す。
- 手順 8 で Defender を一時無効化。インストール後、**Windows セキュリティ → ウイルスと脅威の防止 → 設定の管理** で再有効化。
- スクリプトは一時フォルダをクリアするため、重要なファイルは事前に保存。
- Windows 11 22H2+ のみテスト済み。

**ライセンス:** MIT

---

## 한국어

**적용 시나리오:**
- AutoCAD 2027 설치가 89%에서 멈추고 재료 라이브러리 단계에서 롤백됨
- 라이선스 서비스(AdskLicensingService) 오류로 설치 중단
- 이전 설치 잔여물로 인해 새 설치 실패

**사용법:** `fix.bat` 우클릭 → **관리자 권한으로 실행**.

| 단계 | 작업 |
|------|------|
| 1 | 충돌 프로세스 종료 (acad.exe / setup.exe / msiexec.exe / AdskLicensingService.exe) |
| 2 | 라이선스 서비스 복구 (중지 → 자동 시작 설정 → LocalSystem 전환 → 재시작) |
| 3 | 중단된 재료 라이브러리 및 Recap 구성 요소 제거 (하드코딩된 GUID 2개 포함) |
| 4 | 재료 라이브러리 잔여 디렉터리 삭제 |
| 5 | `C:\Autodesk` 설치 캐시 삭제 |
| 6 | `%TEMP%`, `C:\Windows\Temp`, 사용자 임시 폴더 정리 |
| 7 | Windows Installer 서비스 재설정 |
| 8 | Windows Defender 실시간 보호 임시 비활성화 |
| — | 설치 프로그램 자동 실행 |

**사용 전 변경해야 할 사항:**

`fix.bat`을 열고 다음을 수정하세요.

1. **설치 프로그램 경로 (필수 변경):**
   ```batch
   "D:\CAD2027\CAD2027\Setup\setup.exe"   # 실제 경로로 변경
   ```

2. **재료 라이브러리 GUID (다른 버전에서 필수 변경):**
   ```batch
   msiexec /x {A4E5D97F-7933-47C2-890C-0A6E5A0E7ECF} /qn >nul 2>&1
   msiexec /x {6AB9E00A-7E90-44D2-8591-7D91DE5458E2} /qn >nul 2>&1
   ```
   > GUID 찾는 방법: 레지스트리 `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall`에서 "Material Library" 검색, `UninstallString`에서 GUID 복사.

3. **버전 경로 (다른 버전에서 필수 변경):**
   ```batch
   rd /s /q "C:\Autodesk\WI\Autodesk AutoCAD 2027" >nul 2>&1   # 버전 번호 변경
   ```

**주의사항:**
- 설치 시 **사용자 지정 설치**를 선택하고 Material Library, Recap, Docs 체크 해제.
- 8단계에서 Defender 임시 비활성화. 설치 후 **Windows 보안 → 바이러스 및 위협 방지 → 설정 관리**에서 다시 활성화.
- 스크립트가 임시 폴더를 정리하므로 중요 파일은 미리 저장.
- Windows 11 22H2+에서만 테스트됨.

**라이선스:** MIT

---

## Русский

**Сценарии применения:**
- Установка AutoCAD 2027 зависает на 89%, откат на этапе библиотеки материалов
- Сбой службы лицензирования (AdskLicensingService), прерывающий установку
- Остатки предыдущей установки мешают новой

**Использование:** ПКМ по `fix.bat` → **Запуск от имени администратора**.

| Шаг | Действие |
|------|----------|
| 1 | Завершение конфликтующих процессов (acad.exe / setup.exe / msiexec.exe / AdskLicensingService.exe) |
| 2 | Восстановление службы лицензирования (остановка → автостарт → LocalSystem → перезапуск) |
| 3 | Удаление зависших библиотек материалов и компонентов Recap (включая два GUID) |
| 4 | Удаление остаточных каталогов библиотек материалов |
| 5 | Удаление кэша установки `C:\Autodesk` |
| 6 | Очистка `%TEMP%`, `C:\Windows\Temp`, локальной временной папки пользователя |
| 7 | Сброс службы Windows Installer |
| 8 | Временное отключение Windows Defender |
| — | Автозапуск установщика |

**Что нужно изменить перед использованием:**

Откройте `fix.bat` и измените следующее:

1. **Путь к установщику (обязательно):**
   ```batch
   "D:\CAD2027\CAD2027\Setup\setup.exe"   # Замените на ваш путь
   ```

2. **GUID библиотек материалов (обязательно для других версий):**
   ```batch
   msiexec /x {A4E5D97F-7933-47C2-890C-0A6E5A0E7ECF} /qn >nul 2>&1
   msiexec /x {6AB9E00A-7E90-44D2-8591-7D91DE5458E2} /qn >nul 2>&1
   ```
   > Поиск GUID: реестр `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall`, поиск "Material Library", скопируйте GUID из `UninstallString`.

3. **Путь с версией (обязательно для других версий):**
   ```batch
   rd /s /q "C:\Autodesk\WI\Autodesk AutoCAD 2027" >nul 2>&1   # Измените номер версии
   ```

**Примечания:**
- При установке выберите **Выборочная установка** и снимите галочки с Material Library, Recap, Docs.
- Шаг 8 временно отключает Defender. Включите обратно: **Безопасность Windows → Защита от вирусов и угроз → Управление настройками**.
- Скрипт очищает временные папки — сохраните важные файлы заранее.
- Проверено только на Windows 11 22H2+.

**Лицензия:** MIT

---

## Español

**Escenarios aplicables:**
- Instalación de AutoCAD 2027 atascada al 89%, retrocediendo en la fase de biblioteca de materiales
- Fallo del servicio de licencias (AdskLicensingService) que interrumpe la instalación
- Residuos de instalaciones anteriores que impiden una nueva instalación

**Uso:** Clic derecho en `fix.bat` → **Ejecutar como administrador**.

| Paso | Acción |
|------|--------|
| 1 | Terminar procesos conflictivos (acad.exe / setup.exe / msiexec.exe / AdskLicensingService.exe) |
| 2 | Reparar servicio de licencias (detener → autoinicio → LocalSystem → reiniciar) |
| 3 | Desinstalar bibliotecas de materiales atascadas y componentes Recap (incluye dos GUID) |
| 4 | Eliminar directorios residuales de bibliotecas de materiales |
| 5 | Eliminar caché de instalación `C:\Autodesk` |
| 6 | Limpiar `%TEMP%`, `C:\Windows\Temp`, carpeta temporal local del usuario |
| 7 | Restablecer servicio Windows Installer |
| 8 | Desactivar temporalmente la protección en tiempo real de Windows Defender |
| — | Iniciar instalador automáticamente |

**Cambios necesarios antes de usar:**

Abra `fix.bat` y modifique lo siguiente:

1. **Ruta del instalador (obligatorio):**
   ```batch
   "D:\CAD2027\CAD2027\Setup\setup.exe"   # Reemplace con su ruta real
   ```

2. **GUID de bibliotecas de materiales (obligatorio para otras versiones):**
   ```batch
   msiexec /x {A4E5D97F-7933-47C2-890C-0A6E5A0E7ECF} /qn >nul 2>&1
   msiexec /x {6AB9E00A-7E90-44D2-8591-7D91DE5458E2} /qn >nul 2>&1
   ```
   > Buscar GUID: registro `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall`, buscar "Material Library", copiar GUID de `UninstallString`.

3. **Ruta de versión (obligatorio para otras versiones):**
   ```batch
   rd /s /q "C:\Autodesk\WI\Autodesk AutoCAD 2027" >nul 2>&1   # Cambie el número de versión
   ```

**Notas:**
- Durante la instalación, seleccione **Instalación personalizada** y desmarque Material Library, Recap, Docs.
- Paso 8 desactiva Defender temporalmente. Reactívelo en **Seguridad de Windows → Protección antivirus y contra amenazas → Administrar configuración**.
- El script limpia carpetas temporales — guarde archivos importantes antes.
- Probado solo en Windows 11 22H2+.

**Licencia:** MIT

---

## Français

**Scénarios applicables:**
- Installation d'AutoCAD 2027 bloquée à 89%, retour arrière lors de la phase de bibliothèque de matériaux
- Défaillance du service de licence (AdskLicensingService) interrompant l'installation
- Résidus d'installations précédentes empêchant une nouvelle installation

**Utilisation:** Clic droit sur `fix.bat` → **Exécuter en tant qu'administrateur**.

| Étape | Action |
|-------|--------|
| 1 | Terminer les processus conflictuels (acad.exe / setup.exe / msiexec.exe / AdskLicensingService.exe) |
| 2 | Réparer le service de licence (arrêter → démarrage automatique → LocalSystem → redémarrer) |
| 3 | Désinstaller les bibliothèques de matériaux bloquées et composants Recap (inclut deux GUID) |
| 4 | Supprimer les répertoires résiduels des bibliothèques de matériaux |
| 5 | Supprimer le cache d'installation `C:\Autodesk` |
| 6 | Vider `%TEMP%`, `C:\Windows\Temp`, dossier temporaire local de l'utilisateur |
| 7 | Réinitialiser le service Windows Installer |
| 8 | Désactiver temporairement la protection en temps réel de Windows Defender |
| — | Lancer automatiquement l'installateur |

**Modifications nécessaires avant utilisation:**

Ouvrez `fix.bat` et modifiez ce qui suit:

1. **Chemin de l'installateur (obligatoire):**
   ```batch
   "D:\CAD2027\CAD2027\Setup\setup.exe"   # Remplacez par votre chemin réel
   ```

2. **GUID des bibliothèques de matériaux (obligatoire pour autres versions):**
   ```batch
   msiexec /x {A4E5D97F-7933-47C2-890C-0A6E5A0E7ECF} /qn >nul 2>&1
   msiexec /x {6AB9E00A-7E90-44D2-8591-7D91DE5458E2} /qn >nul 2>&1
   ```
   > Recherche GUID: registre `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall`, chercher "Material Library", copier le GUID depuis `UninstallString`.

3. **Chemin de version (obligatoire pour autres versions):**
   ```batch
   rd /s /q "C:\Autodesk\WI\Autodesk AutoCAD 2027" >nul 2>&1   # Changer le numéro de version
   ```

**Remarques:**
- Lors de l'installation, choisissez **Installation personnalisée** et décochez Material Library, Recap, Docs.
- L'étape 8 désactive temporairement Defender. Réactivez-le dans **Sécurité Windows → Protection contre les virus et menaces → Gérer les paramètres**.
- Le script vide les dossiers temporaires — sauvegardez les fichiers importants au préalable.
- Testé uniquement sur Windows 11 22H2+.

**Licence:** MIT

---

## Deutsch

**Anwendbare Szenarien:**
- AutoCAD 2027-Installation bleibt bei 89% hängen, Rollback in der Materialbibliothek-Phase
- Lizenzdienstfehler (AdskLicensingService) unterbricht die Installation
- Rückstände früherer Installationen verhindern Neuinstallation

**Verwendung:** Rechtsklick auf `fix.bat` → **Als Administrator ausführen**.

| Schritt | Aktion |
|---------|--------|
| 1 | Konfliktprozesse beenden (acad.exe / setup.exe / msiexec.exe / AdskLicensingService.exe) |
| 2 | Lizenzdienst reparieren (stoppen → Autostart → LocalSystem → neustarten) |
| 3 | Hängende Materialbibliotheken und Recap-Komponenten deinstallieren (inkl. zwei GUIDs) |
| 4 | Restverzeichnisse der Materialbibliotheken löschen |
| 5 | Installationscache `C:\Autodesk` löschen |
| 6 | `%TEMP%`, `C:\Windows\Temp`, Benutzer-Temp-Ordner leeren |
| 7 | Windows Installer-Dienst zurücksetzen |
| 8 | Windows Defender-Echtzeitschutz vorübergehend deaktivieren |
| — | Installer automatisch starten |

**Vor Verwendung zu ändernde Stellen:**

Öffnen Sie `fix.bat` und ändern Sie Folgendes:

1. **Installer-Pfad (muss geändert werden):**
   ```batch
   "D:\CAD2027\CAD2027\Setup\setup.exe"   # Durch Ihren tatsächlichen Pfad ersetzen
   ```

2. **Materialbibliothek-GUIDs (muss für andere Versionen geändert werden):**
   ```batch
   msiexec /x {A4E5D97F-7933-47C2-890C-0A6E5A0E7ECF} /qn >nul 2>&1
   msiexec /x {6AB9E00A-7E90-44D2-8591-7D91DE5458E2} /qn >nul 2>&1
   ```
   > GUID-Suche: Registrierung `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall`, nach "Material Library" suchen, GUID aus `UninstallString` kopieren.

3. **Versionspfad (muss für andere Versionen geändert werden):**
   ```batch
   rd /s /q "C:\Autodesk\WI\Autodesk AutoCAD 2027" >nul 2>&1   # Versionsnummer ändern
   ```

**Hinweise:**
- Wählen Sie bei der Installation **Benutzerdefinierte Installation** und deaktivieren Sie Material Library, Recap, Docs.
- Schritt 8 deaktiviert Defender vorübergehend. Wieder aktivieren unter **Windows-Sicherheit → Viren- und Bedrohungsschutz → Einstellungen verwalten**.
- Das Skript leert temporäre Ordner — wichtige Dateien vorher sichern.
- Nur unter Windows 11 22H2+ getestet.

**Lizenz:** MIT

---

## Português

**Cenários aplicáveis:**
- Instalação do AutoCAD 2027 travada em 89%, retrocedendo na fase da biblioteca de materiais
- Falha do serviço de licenciamento (AdskLicensingService) interrompendo a instalação
- Resíduos de instalações anteriores impedindo nova instalação

**Uso:** Clique direito em `fix.bat` → **Executar como administrador**.

| Etapa | Ação |
|-------|------|
| 1 | Encerrar processos conflitantes (acad.exe / setup.exe / msiexec.exe / AdskLicensingService.exe) |
| 2 | Reparar serviço de licenciamento (parar → início automático → LocalSystem → reiniciar) |
| 3 | Desinstalar bibliotecas de materiais travadas e componentes Recap (inclui dois GUIDs) |
| 4 | Excluir diretórios residuais das bibliotecas de materiais |
| 5 | Excluir cache de instalação `C:\Autodesk` |
| 6 | Limpar `%TEMP%`, `C:\Windows\Temp`, pasta temporária local do usuário |
| 7 | Redefinir serviço Windows Installer |
| 8 | Desativar temporariamente a proteção em tempo real do Windows Defender |
| — | Iniciar instalador automaticamente |

**Alterações necessárias antes do uso:**

Abra `fix.bat` e modifique o seguinte:

1. **Caminho do instalador (obrigatório):**
   ```batch
   "D:\CAD2027\CAD2027\Setup\setup.exe"   # Substitua pelo seu caminho real
   ```

2. **GUIDs das bibliotecas de materiais (obrigatório para outras versões):**
   ```batch
   msiexec /x {A4E5D97F-7933-47C2-890C-0A6E5A0E7ECF} /qn >nul 2>&1
   msiexec /x {6AB9E00A-7E90-44D2-8591-7D91DE5458E2} /qn >nul 2>&1
   ```
   > Localizar GUID: registro `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall`, buscar "Material Library", copiar GUID de `UninstallString`.

3. **Caminho da versão (obrigatório para outras versões):**
   ```batch
   rd /s /q "C:\Autodesk\WI\Autodesk AutoCAD 2027" >nul 2>&1   # Alterar número da versão
   ```

**Observações:**
- Durante a instalação, selecione **Instalação personalizada** e desmarque Material Library, Recap, Docs.
- Etapa 8 desativa o Defender temporariamente. Reative em **Segurança do Windows → Proteção contra vírus e ameaças → Gerenciar configurações**.
- O script limpa pastas temporárias — salve arquivos importantes antes.
- Testado apenas no Windows 11 22H2+.

**Licença:** MIT

---

## 中文（原版）

**适用场景:**
- AutoCAD 2027 安装进度卡在 89%，材质库安装阶段回退
- 授权服务（AdskLicensingService）异常导致安装中断
- 历史安装残留导致新安装失败

**使用方式:** 右键 `fix.bat` → **以管理员身份运行**。

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

**使用前需要修改的地方:**

打开 `fix.bat`，修改以下内容：

1. **安装程序路径（必改）:**
   ```batch
   "D:\CAD2027\CAD2027\Setup\setup.exe"   # 改为实际的 setup.exe 路径
   ```

2. **材质库 GUID（换版本必改）:**
   ```batch
   msiexec /x {A4E5D97F-7933-47C2-890C-0A6E5A0E7ECF} /qn >nul 2>&1
   msiexec /x {6AB9E00A-7E90-44D2-8591-7D91DE5458E2} /qn >nul 2>&1
   ```
   > 查找 GUID：注册表 `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall`，搜索 "Material Library"，从 `UninstallString` 复制 GUID。

3. **版本号路径（换版本必改）:**
   ```batch
   rd /s /q "C:\Autodesk\WI\Autodesk AutoCAD 2027" >nul 2>&1   # 改为实际版本号
   ```

**注意事项:**
- 安装时选择 **自定义安装**，取消勾选 Material Library、Recap、Docs。
- 第 8 步临时关闭 Defender，安装完成后在 **Windows 安全中心 → 病毒和威胁防护 → 管理设置** 中重新开启。
- 脚本会清空临时文件夹，提前保存重要文件。
- 仅 Windows 11 22H2+ 测试通过。

**许可:** MIT
