$page  = ($MyInvocation.MyCommand.Name -replace '.ps1') -replace '.html'
$Label = (Get-Culture).TextInfo.ToTitleCase($page.ToLower())
$Title = "PSHTML Web example"
$ContainerStyleOut = "container-md pt-3 bg-light text-dark"
$ContainerStyleIn  = "container-fluid"

$HTML = html {

    head {
        
        Meta -name viewport -content_tag "width=device-width, initial-scale=1.0"
        
        link -rel 'icon' -href 'https://avatars1.githubusercontent.com/u/56639134?s=400&u=9c1a1dc1a8d8718534bf7d455042c7382cc419a0&v=4' -type 'image/x-icon'
        Link -href "Style/style.css" -rel stylesheet
        Link -href "Assets/BootStrap/bootstrap.min.css" -rel stylesheet
        link -href "https://fonts.googleapis.com/css?family=Quicksand&display=swap" -rel "stylesheet"

        Script -src "https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"
        Script -src "Assets/BootStrap/bootstrap.min.js"
        
        Title "$($page.ToUpper()) | $($Title)"
    }

    body {

        header {

            Include header

        }

        nav -class "navbar navbar-expand-sm bg-dark navbar-dark sticky-top" -content {

            # <!-- Toggler/collapsibe Button -->
            button -class "navbar-toggler" -Attributes @{
                "type"="button"
                "data-toggle"="collapse"
                "data-target"="#collapsibleNavbar"
            } -content {
                span -class "navbar-toggler-icon"
            }

            # <!-- Navbar links -->
            div -class "collapse navbar-collapse" -id "collapsibleNavbar" -Content {

                ul -class "navbar-nav" -content {

                    Include navbar
    
                    #FixedLinks
                    li -class "nav-item" -content {
                        a -class "nav-link" -href "https://pshtml.readthedocs.io/" -Target _blank -content { "PSHTML" }
                    }
            
                    li -class "nav-item" -content {
                        a -class "nav-link" -href "https://getbootstrap.com/" -Target _blank -content { "Bootstrap" }
                    }
            
                    li -class "nav-item" -content {
                        a -class "nav-link" -href "https://www.w3schools.com/" -Target _blank -content { "w3schools" }
                    }
            
                }
    
            }

        }

        div -Class "$ContainerStyleOut" -Content {

            #region jumbotron
            div -id "j1" -class 'jumbotron text-center' -content {
        
                h1 "$($Title)"

                hr

                p {
                    "Automatically created website "
                    b { $($Label) }
                    $link = a {"PSHTMLwebframework"} -href "https://github.com/tinuwalther/PSHTMLwebframework/blob/develop/README.md" -Target _blank
                    " | Generated with $($link)"
                }
            } 
            #endregion

            #region Section
            div -id "1" -class "$ContainerStyleIn" -Content {

                h1 "$($Label) PSHTML Webframework"

            }
            #endregion

            #region Section
            div -id "2" -class "$ContainerStyleIn" -Content {

                p { "The PSHTMLwebframework builds HTML-Files with PSHTML from native PowerShell-Scripts." }

                h2 "Create the Webframework"

                p {"To create the Webframework with PSHTMLwebframework, run the following commands:"}
                pre -content {
                    "git clone https://github.com/tinuwalther/PSHTMLwebframework.git"
                    br
                    "git checkout develop"
                    br
                    "git pull"
                }

                h2 "Build the Home page"

                p { "To build the Home page (index.html), run the following commands:" }
                pre -content {
                    "Import-Module -Name .\PSHTMLwebframework.psd1 -Force"
                    br
                    "Publish-WEBHtmlPages"
                }

                h2 "Create a new Webpage"

                p { "To create a new Webpage from the Template, run the following commands:" }
                pre -content {
                    "New-WEBPage -newpage MyNewScriptPage"
                    br
                    "Modify the new MyNewScriptPage.ps1"
                    br
                    "Publish-WEBHtmlPages"
                }
                p { "After each changes on one or more Script-Page, you must run Publish-WEBHtmlPages to publish the changes to the HTML-File." }
                p { 
                    "For more information read about "
                    a {"PSHTMLwebframework"} -href "https://github.com/tinuwalther/PSHTMLwebframework/blob/develop/README.md" -Target _blank
                    " on github.com"
                }
            }

            hr

            #endregion
            
        } 
    
    }

    Footer {
                
        Include -Name footer
        
    }

}

$HTML | out-File -Filepath ..\$($page).html -Encoding utf8
