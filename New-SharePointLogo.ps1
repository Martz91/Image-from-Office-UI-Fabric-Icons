
<#
.SYNOPSIS
    Creates an image file from an Office UI Fabric Icons Unicode character to be used as a SharePoint site logo.

.DESCRIPTION
    This cmdlet generates an image file that contains an icon represented by a given Unicode character.
    The output is saved as an image file, which can be used as a logo for a SharePoint site.
    To get the unicode character for an icon, visit https://uifabricicons.azurewebsites.net/, right click the icon and select Copy Unicode

.PARAMETER UnicodeString
    The Unicode character to be converted into an image.

.PARAMETER FileName
    The output filename for the generated image file.

.PARAMETER BackgroundColor
    The hexadecimal value of the color to be used for the background

.PARAMETER ForegroundColor
    The hexadecimal value of the color of the icon

.EXAMPLE
    New-SharePointLogo -UnicodeString "ED73" -FileName ".\Logo.png" -BackgroundColor "#2cb5d0" -ForegroundColor "#FFFFFF"
    Creates a PNG image containing the icon represented by the Unicode character.

.NOTES
    Author: Martz91
    Date: 2024.09.26
    Version: 1.0
#>

function New-SharePointLogo {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, HelpMessage = "Provide the Unicode character to be converted into an image.")]
        [string]$UnicodeString,

        [Parameter(Mandatory = $true, HelpMessage = "Provide the filename where the image should be saved.")]
        [string]$FileName,

        [Parameter(Mandatory = $true, HelpMessage = "Provide the hexadecimal color value for the background color.")]
        [string]$BackgroundColor,

        [Parameter(Mandatory = $true, HelpMessage = "Provide the hexadecimal color value for the icon color.")]
        [string]$ForegroundColor
    )
    
    begin {
        Add-Type -AssemblyName System.Drawing

        # Load font from file
        $PrivateFontCollection = New-Object System.Drawing.Text.PrivateFontCollection
        $PrivateFontCollection.AddFontFile(".\fabric-mdl2-external-db8953bf.ttf")
        $Font = New-Object System.Drawing.Font($PrivateFontCollection.Families[0], 54, [System.Drawing.FontStyle]::Regular)

    }
    
    process {
        # Initialize Bitmap object
        $Bmp = New-Object System.Drawing.Bitmap 96,96

        # Initialize Color objects
        $ColorBg = [System.Drawing.ColorTranslator]::FromHtml($BackgroundColor)
        $ColorFg = [System.Drawing.ColorTranslator]::FromHtml($ForegroundColor)

        # Create brushes for back- and foreground
        $BrushBg = New-Object System.Drawing.SolidBrush($ColorBg)
        $BrushFg = New-Object System.Drawing.SolidBrush($ColorFg)

        # Create Graphics object and fill the background
        $Graphics = [System.Drawing.Graphics]::FromImage($Bmp)
        $Graphics.FillRectangle($BrushBg,0,0,$Bmp.Width, $Bmp.Height)

        # Draw the icon in foreground color
        $Graphics.DrawString([char]::ConvertFromUtf32("0x$UnicodeString"), $Font, $BrushFg, 0, 12)

        $Graphics.Dispose()

        $Bmp.Save($FileName)
    }
    
    end {
        
    }
}