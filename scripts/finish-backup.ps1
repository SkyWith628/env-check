<#
  finish-backup.ps1 — 학교 OneDrive → USB(D:) 백업을 마무리한다 (복사 + 검증 + README). 여러 번 실행해도 안전(증분 복사).

  사용:  pwsh -NoProfile -File scripts\finish-backup.ps1            # 복사 + 검증
         pwsh -NoProfile -File scripts\finish-backup.ps1 -SkipCopy  # 검증만

  하는 일
   1) robocopy로 원본과 다른 파일만 다시 복사 (동시 작업 2, 재시도 3회×10초: OneDrive 클라우드 오류 0x185를 줄이기 위함)
   2) 원본·백업의 파일 수/용량을 세어 누락·크기 불일치 목록 작성
   3) 누락을 분류: Unity Library 캐시(재생성) / cosmetic-agent(사용자가 백업 불필요로 결정) / oblige(GitHub에 있음) / 그 밖
   4) D:\onedrive_school_20261127\README.txt, 백업-누락목록.txt, D:\_backup_logs\summary.txt 작성
  "이상 없음" 판정은 '그 밖' 누락 0 + 크기 불일치 0 + robocopy 정상 종료일 때만 한다.
#>
param(
  [string]$Src = 'C:\Users\gkfkd\OneDrive - 인덕대학교',
  [string]$Dst = 'D:\onedrive_school_20261127',
  [string]$LogDir = 'D:\_backup_logs',
  [switch]$SkipCopy
)
$ErrorActionPreference = 'Continue'
New-Item -ItemType Directory -Force -Path $LogDir | Out-Null
$internal = '.849C9593-D756-4E56-8D6E-42412F2A707B'
$out = Join-Path $LogDir 'summary.txt'
function W($m) { ("[{0}] {1}" -f (Get-Date -Format 'HH:mm:ss'), $m) | Tee-Object -FilePath $out -Append }

if (-not (Test-Path $Dst)) { W "대상 없음: $Dst (USB가 연결돼 있는지 확인)"; exit 2 }

$rc = 0
if (-not $SkipCopy) {
  W '복사 시작 (증분)'
  $log = Join-Path $LogDir ('robocopy-' + (Get-Date -Format 'yyyyMMdd-HHmm') + '.log')
  # cosmetic-agent: 사용자가 백업 불필요로 결정(2026-11-27) → 복사 대상에서 제외
  robocopy $Src $Dst /E /COPY:DAT /DCOPY:DAT /R:3 /W:10 /MT:2 /XJ `
    /XD node_modules .venv venv .next __pycache__ (Join-Path $Src 'WorkSpace\claude\cosmetic-agent') `
    /XF desktop.ini $internal /NP /NDL /UNILOG:$log | Out-Null
  $rc = $LASTEXITCODE
  $e = (Select-String -Path $log -Pattern 'ERROR 389' -Encoding Unicode -ErrorAction SilentlyContinue | Measure-Object).Count
  W "복사 종료 exit=$rc (0~7 정상, 8 이상 오류), 클라우드 오류(0x185) ${e}건, 로그 $log"
}

$exDirs = @('node_modules', '.venv', 'venv', '.next', '__pycache__')
$exFiles = @('desktop.ini', $internal)
function Get-AllFiles($root) {
  $stack = [System.Collections.Generic.Stack[string]]::new(); $stack.Push($root)
  while ($stack.Count -gt 0) {
    $d = $stack.Pop()
    try { $entries = [System.IO.Directory]::EnumerateFileSystemEntries($d) } catch { continue }
    foreach ($x in $entries) {
      $name = [System.IO.Path]::GetFileName($x)
      try { $isDir = ([System.IO.File]::GetAttributes($x) -band [System.IO.FileAttributes]::Directory) -ne 0 } catch { continue }
      if ($isDir) { if ($exDirs -notcontains $name) { $stack.Push($x) } }
      elseif ($exFiles -notcontains $name) { $x }
    }
  }
}
W '원본 목록 수집 중'
$srcMap = @{}
foreach ($f in Get-AllFiles $Src) { $srcMap[$f.Substring($Src.Length)] = ([System.IO.FileInfo]::new($f)).Length }
W ("원본 파일 {0:N0}개 / {1:N2} GB" -f $srcMap.Count, (($srcMap.Values | Measure-Object -Sum).Sum / 1GB))
W '백업 목록 수집 중'
$dstMap = @{}
foreach ($f in Get-AllFiles $Dst) { $rel = $f.Substring($Dst.Length); if ($rel -notin @('\README.txt', '\백업-누락목록.txt')) { $dstMap[$rel] = ([System.IO.FileInfo]::new($f)).Length } }
W ("백업 파일 {0:N0}개 / {1:N2} GB" -f $dstMap.Count, (($dstMap.Values | Measure-Object -Sum).Sum / 1GB))

$missing = [System.Collections.Generic.List[string]]::new(); $mismatch = [System.Collections.Generic.List[string]]::new()
foreach ($k in $srcMap.Keys) {
  if (-not $dstMap.ContainsKey($k)) { $missing.Add($k) }
  elseif ($dstMap[$k] -ne $srcMap[$k]) { $mismatch.Add($k) }
}
$mLib   = @($missing | Where-Object { $_ -match '\\Library\\' })
$mCos   = @($missing | Where-Object { $_ -notmatch '\\Library\\' -and $_ -match '^\\WorkSpace\\claude\\cosmetic-agent\\' })
$mObl   = @($missing | Where-Object { $_ -notmatch '\\Library\\' -and $_ -match '^\\WorkSpace\\claude\\oblige\\' })
$mReal  = @($missing | Where-Object { $_ -notmatch '\\Library\\' -and $_ -notmatch '^\\WorkSpace\\claude\\(cosmetic-agent|oblige)\\' })
W ("누락 합계 {0}개 = Unity Library 캐시 {1} + cosmetic-agent(제외 결정) {2} + oblige(GitHub에 있음) {3} + 그 밖 {4} / 크기 불일치 {5}개" -f $missing.Count, $mLib.Count, $mCos.Count, $mObl.Count, $mReal.Count, $mismatch.Count)
if ($mReal.Count) {
  W '--- 그 밖 누락: 폴더별 ---'
  $mReal | ForEach-Object { $p = $_.TrimStart('\') -split '\\'; ($p[0..([math]::Min(3, $p.Count - 2))] -join '\') } | Group-Object | Sort-Object Count -Descending | Select-Object -First 15 | ForEach-Object { W ('  {0,6}  {1}' -f $_.Count, $_.Name) }
}
if ($mismatch.Count) { W '--- 크기 불일치 예시(최대 20) ---'; $mismatch | Select-Object -First 20 | ForEach-Object { W "  $_" } }

($missing | Sort-Object) | Set-Content -LiteralPath (Join-Path $Dst '백업-누락목록.txt') -Encoding UTF8
$ok = ($mReal.Count -eq 0 -and $mismatch.Count -eq 0 -and $rc -lt 8)
$readme = @"
학교 OneDrive 백업 (인덕대학교 계정, 2027-02 만료 예정)
백업 일시 : $(Get-Date -Format 'yyyy-MM-dd HH:mm')
원본      : $Src
복사 도구 : robocopy /E (증분, 여러 번 실행)
제외 항목 : node_modules, .venv, venv, .next, __pycache__ 폴더, desktop.ini, OneDrive 내부 파일, WorkSpace\claude\cosmetic-agent (사용자 결정: 백업 불필요)
파일 수   : 원본 $($srcMap.Count) / 백업 $($dstMap.Count)
누락      : 합계 $($missing.Count)개 = Unity Library 캐시 $($mLib.Count) + cosmetic-agent $($mCos.Count) + oblige(GitHub에 있음) $($mObl.Count) + 그 밖 $($mReal.Count)
크기 불일치: $($mismatch.Count)개
검증 결과 : $(if ($ok) { '이상 없음 (Library 캐시·cosmetic-agent·oblige 제외)' } else { '확인 필요 - 그 밖 누락 또는 크기 불일치가 있음. 백업-누락목록.txt 참고' })
원인 메모 : 누락은 OneDrive가 클라우드에서 내려받지 못한 파일입니다(오류 0x185 클라우드 작업 실패).
주의      : exFAT 드라이브입니다. USB를 뽑기 전에 '하드웨어 안전하게 제거'를 사용하세요.
          .git 폴더가 포함되어 있어 코드 폴더는 git 이력까지 보존됩니다.
"@
Set-Content -LiteralPath (Join-Path $Dst 'README.txt') -Value $readme -Encoding UTF8
W ('최종 판정: ' + $(if ($ok) { '이상 없음' } else { '확인 필요' }))
W '전체 완료'
