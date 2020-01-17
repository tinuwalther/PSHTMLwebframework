# Table of Contents

- [Table of Contents](#table-of-contents)
- [PSHTMLwebframework](#pshtmlwebframework)
  - [Create the Webframework](#create-the-webframework)
  - [Build the Home page](#build-the-home-page)
  - [Create a new Webpage](#create-a-new-webpage)
  - [Publish the website](#publish-the-website)
  - [Change the header](#change-the-header)
  - [Change the footer](#change-the-footer)
  - [Modify the Template-Page](#modify-the-template-page)
  - [Adding images](#adding-images)
  - [Change website style](#change-website-style)
- [PSHTMLwebframework Content](#pshtmlwebframework-content)

# PSHTMLwebframework

The PSHTMLwebframework builds HTML-Files with PSHTML from native PowerShell-Scripts.

## Create the Webframework

To create the Webframework with PSHTMLwebframework, run the following commands:

1. Start VSCode or PowerShell ISE
2. git clone https://github.com/tinuwalther/PSHTMLwebframework.git
3. git pull
4. .\CI\Build-Module.ps1

## Build the Home page

To build the Home page (index.html), run the following commands:

1. Import-Module -Name .\PSHTMLwebframweork.psd1
2. Run Publish-WEBHtmlPages

## Create a new Webpage

To create a new Webpage from the Template, run the following commands:

1. Run New-WEBPage -newpage Page1
2. Modify the new Page1.ps1
3. Run Publish-WEBHtmlPages

After each changes on one or more Script-Page, you must run Publish-WEBHtmlPages to publish the changes to the HTML-File.

## Publish the website

To publish the website on your personal web space:

1. Remove the Folder Bin from the PSHTMLwebframweork
2. Upload the content of PSHTMLwebframweork to your web space

## Change the header

To change the header, edit the Script header.ps1 in Bin/Includes:

````powershell

#HomePage
li -Content {
    a -href "index.html" -Content {
        "Home"
    }
}

#NewPages
New pages will be automatically added with the Build-WEBHtmlPages-Command.
````

## Change the footer

To change the footer, edit the Script footer.ps1 in Bin/Includes:

````powershell
Footer {

    div -id "footer" -class "container-fluid" -Content {

        hr

        $PSHTMLlink = a {"PSHTML"} -href "https://github.com/Stephanevg/PSHTML"  -Target _blank

        a -href "index.html" -class "badge badge-pill badge-primary" -Content {
            "Home"
        }

        " | Based on $($PSHTMLlink)"

        hr
    }

}
````

## Modify the Template-Page

To modify the Template-Page, edit the Script page.ps1 in Bin/Templates.

## Adding images

Save your images to the folder Assets/IMG and add a new region to your Script-Page:

````powershell
div -id "img1" -class 'container-fluid' -Content {

    img -src "Assets/IMG/words.png" -class "img-thumbnail"

}
````

## Change website style

To change website styles, edit the style.scc in Style:

````css
body { background: #4CA3DD !important;}

p {
    font-family: "QuickSand", sans-serif;
  }

  h1 {
    font-family: "QuickSand", sans-serif;
}
h2 {
    font-family: "QuickSand", sans-serif;
}

h3 {
    font-family: "QuickSand", sans-serif;
}

table {
    font-family: "QuickSand", sans-serif;
}

Div {
    margin: 60px;
    background: #fdfdfc;
}

img {
    max-width:100% ;
}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
  }
  
  li {
    float: left;
  }
  
  li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
  }
  
  /* Change the link color to #111 (black) on hover */
  li a:hover {
    background-color: #111;
  }

  .active {
    background-color: #4CAF50;
  }
````

# PSHTMLwebframework Content

The PSHTMLwebframework contains the following files and folders:

````Text
+---PSHTMLwebframweork
|   |   index.html
|   |
|   +---Assets
|   |   +---BootStrap
|   |   |       bootstrap.min.css
|   |   |       bootstrap.min.js
|   |   |
|   |   +---Chartjs
|   |   |       Chart.bundle.min.js
|   |   |       LICENSE.md
|   |   |
|   |   +---IMG
|   |   |       words.png
|   |   |
|   |   \---Jquery
|   |           jquery-3.3.1.slim.min.js
|   |
|   +---Bin
|   |   |   index.ps1
|   |   |   Load-Environment.ps1
|   |   |   PSHTMLwebframweork.psd1
|   |   |   PSHTMLwebframweork.psm1
|   |   |
|   |   +---Includes
|   |   |       footer.ps1
|   |   |       header.ps1
|   |   |
|   |   \---Templates
|   |           page.ps1
|   |
|   \---Style
|           style.css  
````
