# New-SharePointLogo PowerShell Script

## Overview

`New-SharePointLogo` is a PowerShell cmdlet that generates an image file containing an icon from the Office UI Fabric Icons set. This image can be used as a logo for SharePoint sites.

The script converts a Unicode character (representing an icon) into an image with user-defined background and foreground colors.

## Prerequisites

This script uses a Microsoft font, **Office UI Fabric Icons**, which is **not** included in this repository since it does not belong to me.

### How to Download the Required Font

The font is loaded in the [Office UI Fabric Icons](https://uifabricicons.azurewebsites.net/) webpage and can be downloaded with the following link: [https://uifabricicons.azurewebsites.net/icons/external/mdl2/fonts/fabric-mdl2-external-db8953bf.woff](https://uifabricicons.azurewebsites.net/icons/external/mdl2/fonts/fabric-mdl2-external-db8953bf.woff)

In order to use it in PowerShell it needs to be converted to ttf. This can be done by one of the free converters found online.

Once the font is downloaded, place the `.ttf` file in the same directory as the script. The script expects the font file to be named `fabric-mdl2-external-db8953bf.ttf`.

## Parameters

- `UnicodeString` (Required): The Unicode character to be converted into an image. Visit [Office UI Fabric Icons](https://uifabricicons.azurewebsites.net/) to find the Unicode character for an icon.
  
- `FileName` (Required): The output file path and name for the generated image. The image will be saved in `.png` format.

- `BackgroundColor` (Required): The hexadecimal color value to use for the background (e.g., `#2cb5d0`).

- `ForegroundColor` (Required): The hexadecimal color value for the icon (e.g., `#FFFFFF`).

## Example Usage

```powershell
New-SharePointLogo -UnicodeString "ED73" -FileName ".\Logo.png" -BackgroundColor "#2cb5d0" -ForegroundColor "#FFFFFF"
```

This example will create a PNG image named `Logo.png` with the icon represented by the Unicode character `ED73`, a background color of `#2cb5d0`, and a white icon.