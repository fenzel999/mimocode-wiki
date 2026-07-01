# uninstall.ps1 - 一键卸载

Write-Host "卸载 mimocode-wiki..." -ForegroundColor Cyan

# 删除工具
$toolsDest = "$env:USERPROFILE\.mimocode\tools"
if (Test-Path $toolsDest) {
    $toolPath = Join-Path $toolsDest "wiki.ts"
    if (Test-Path $toolPath) {
        Remove-Item -Path $toolPath -Force
    }
}

# 删除技能
$skillsDest = "$env:USERPROFILE\.mimocode\skills"
if (Test-Path $skillsDest) {
    $skills = @(
        "wiki", "wiki-autoresearch", "wiki-canvas", "wiki-ingest",
        "wiki-lint", "wiki-query", "wiki-save", "wiki-think"
    )
    
    foreach ($skill in $skills) {
        $path = Join-Path $skillsDest $skill
        if (Test-Path $path) {
            Remove-Item -Path $path -Recurse -Force
        }
    }
}

Write-Host "卸载完成！" -ForegroundColor Green
Write-Host "只删除了 mimocode-wiki 的插件，其他插件不受影响。" -ForegroundColor White
