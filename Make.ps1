# Root paths
$sourceRoot = "C:\Users\user\Documents\GitHub\PortableApps\Source"
$buildRoot  = "C:\Users\user\Documents\GitHub\PortableApps\Build"

# Ensure the main Build folder exists
if (-not (Test-Path $buildRoot)) {
    Write-Host "Creating main Build folder: $buildRoot"
    New-Item -Path $buildRoot -ItemType Directory | Out-Null
}

function Merge-SourceToBuild {
    param (
        [string]$sourceParent
    )

    # Path to !Common folder
    $commonFolder = Join-Path $sourceParent '!Common'

    # Get all subfolders in Source excluding !Common
    $sourceSubfolders = Get-ChildItem -Path $sourceParent -Directory | Where-Object { $_.Name -ne "!Common" }

    foreach ($sub in $sourceSubfolders) {
        # Corresponding folder in Build
        $targetFolder = Join-Path $buildRoot $sub.Name

        # Create Build subfolder if it doesn't exist
        if (-not (Test-Path $targetFolder)) {
            Write-Host "Creating folder: $targetFolder"
            New-Item -Path $targetFolder -ItemType Directory | Out-Null
        }

        # Copy !Common contents first
        if (Test-Path $commonFolder) {
            Write-Host "Copying !Common from $commonFolder to $targetFolder"
            Copy-Item -Path "$commonFolder\*" -Destination $targetFolder -Recurse -Force
        }

        # Copy contents of the source subfolder
        Write-Host "Copying source subfolder from $($sub.FullName) to $targetFolder"
        Copy-Item -Path "$($sub.FullName)\*" -Destination $targetFolder -Recurse -Force
    }
}

# Merge Obsidian
Merge-SourceToBuild -sourceParent (Join-Path $sourceRoot "Obsidian")

# Merge ObsidianLegacyWin7
Merge-SourceToBuild -sourceParent (Join-Path $sourceRoot "ObsidianLegacyWin7")

Write-Host "Done."
