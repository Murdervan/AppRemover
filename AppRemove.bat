# Tjek om scriptet kører som administrator
If (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrator")) {
    Write-Host "Administrator-rettigheder kræves. Genstarter som administrator..."
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

Clear-Host
Write-Host "===================================="
Write-Host "         Microsoft App Remover      "
Write-Host "          made by Murdervan         "
Write-Host "    https://github.com/murdervan/   "
Write-Host "====================================`n"

Function Show-Menu {
    Write-Host "==========================="
    Write-Host "   Microsoft App Remover Menu"
    Write-Host "==========================="`n

    Write-Host "Essential Removals:"
    Write-Host "1. Remove Microsoft Store"
    Write-Host "2. Remove Microsoft Get Started"
    Write-Host "3. Remove Microsoft Get Help`n"

    Write-Host "Gaming Apps:"
    Write-Host "4. Remove Xbox Gaming Overlay"
    Write-Host "5. Remove Xbox App"
    Write-Host "6. Remove Xbox Speech-to-Text Overlay"
    Write-Host "7. Remove Xbox Identity Provider`n"

    Write-Host "Office and Communication:"
    Write-Host "8. Remove Microsoft Teams"
    Write-Host "9. Remove Microsoft OneDrive"
    Write-Host "10. Remove Microsoft Office Hub"
    Write-Host "11. Remove Microsoft Skype`n"

    Write-Host "Entertainment and News:"
    Write-Host "12. Remove Microsoft Solitaire Collection"
    Write-Host "13. Remove Microsoft News"
    Write-Host "14. Remove Microsoft Photos"
    Write-Host "15. Remove Microsoft Movies & TV`n"

    Write-Host "Productivity and Tools:"
    Write-Host "16. Remove Microsoft Alarms & Clock"
    Write-Host "17. Remove Microsoft Weather"
    Write-Host "18. Remove Windows Mail & Calendar"
    Write-Host "19. Remove Windows Camera"
    Write-Host "20. Remove Windows Maps"
    Write-Host "21. Remove Microsoft Paint`n"

    Write-Host "Miscellaneous:"
    Write-Host "22. Remove Microsoft Edge"
    Write-Host "23. Remove Windows Feedback Hub"
    Write-Host "24. Remove 3D Builder`n"

    Write-Host "25. Remove ALL listed apps"
    Write-Host "26. Check Installed Microsoft Apps"
    Write-Host "27. Exit`n"
}

Function Remove-App {
    param ($PackageName)
    Get-AppxPackage -AllUsers | Where-Object {$_.Name -like "*$PackageName*"} | Remove-AppxPackage -ErrorAction SilentlyContinue
}

Function Remove-All {
    Write-Host "`nRemoving all listed Microsoft apps..."
    $apps = @(
        "WindowsStore","YourPhone","Microsoft.Getstarted","Microsoft.GetHelp",
        "Microsoft.XboxGamingOverlay","Microsoft.XboxApp","Microsoft.XboxSpeechToTextOverlay","Microsoft.XboxIdentityProvider",
        "MicrosoftTeams","Microsoft.OneDrive","Microsoft.OfficeHub","Microsoft.SkypeApp",
        "MicrosoftSolitaireCollection","Microsoft.News","Microsoft.Windows.Photos","Microsoft.ZuneVideo",
        "Microsoft.Alarms","Microsoft.BingWeather","microsoft.windowscommunicationsapps","Microsoft.WindowsCamera",
        "Microsoft.WindowsMaps","Microsoft.MSPaint","Microsoft.MicrosoftEdge","Microsoft.WindowsFeedbackHub","Microsoft.3DBuilder"
    )
    foreach ($app in $apps) {
        Remove-App $app
    }
    Write-Host "`nAlle apps er blevet fjernet.`n"
}

Function Check-Installed {
    Write-Host "`nInstallerede Microsoft apps:`n"
    Get-AppxPackage -AllUsers | Select-Object Name
    Write-Host ""
    Pause
}

do {
    Show-Menu
    $choices = Read-Host "Vælg apps at fjerne (f.eks. 1 2 3 for Store, Get Started, Get Help)"
    $choices = $choices -split "\s+"

    foreach ($choice in $choices) {
        switch ($choice) {
            1  { Remove-App "WindowsStore" }
            2  { Remove-App "Microsoft.Getstarted" }
            3  { Remove-App "Microsoft.GetHelp" }
            4  { Remove-App "Microsoft.XboxGamingOverlay" }
            5  { Remove-App "Microsoft.XboxApp" }
            6  { Remove-App "Microsoft.XboxSpeechToTextOverlay" }
            7  { Remove-App "Microsoft.XboxIdentityProvider" }
            8  { Remove-App "MicrosoftTeams" }
            9  { Remove-App "Microsoft.OneDrive" }
            10 { Remove-App "Microsoft.OfficeHub" }
            11 { Remove-App "Microsoft.SkypeApp" }
            12 { Remove-App "MicrosoftSolitaireCollection" }
            13 { Remove-App "Microsoft.News" }
            14 { Remove-App "Microsoft.Windows.Photos" }
            15 { Remove-App "Microsoft.ZuneVideo" }
            16 { Remove-App "Microsoft.Alarms" }
            17 { Remove-App "Microsoft.BingWeather" }
            18 { Remove-App "microsoft.windowscommunicationsapps" }
            19 { Remove-App "Microsoft.WindowsCamera" }
            20 { Remove-App "Microsoft.WindowsMaps" }
            21 { Remove-App "Microsoft.MSPaint" }
            22 { Remove-App "Microsoft.MicrosoftEdge" }
            23 { Remove-App "Microsoft.WindowsFeedbackHub" }
            24 { Remove-App "Microsoft.3DBuilder" }
            25 { Remove-All }
            26 { Check-Installed }
            27 { exit }
            default { Write-Host "`nUgyldigt valg: $choice`n" }
        }
    }

} while ($true)
