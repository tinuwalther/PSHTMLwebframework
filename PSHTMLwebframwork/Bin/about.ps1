$page  = $MyInvocation.MyCommand.Name -replace '.ps1'
$Label = (Get-Culture).TextInfo.ToTitleCase($page.ToLower())
$Title = "PSHTMLwebexample"

$HTML = html {

    head {
        
        Meta -name viewport -content_tag "width=device-width, initial-scale=1.0"
        link -rel 'icon' -href 'https://avatars1.githubusercontent.com/u/56639134?s=400&u=9c1a1dc1a8d8718534bf7d455042c7382cc419a0&v=4' -type 'image/x-icon'
        Link -href "Style/style.css" -rel stylesheet
        Link -href "Assets/BootStrap/bootstrap.min.css" -rel stylesheet
        Script -src "Assets/BootStrap/bootstrap.min.js"
        link -href "https://fonts.googleapis.com/css?family=Quicksand&display=swap" -rel "stylesheet"
        
        Title "$($page.ToUpper()) | $($Title)"
    }

    body {

        div -Class "container pt-4" -Content {

            header {

                ul -Content {

                    Include -Name header

                    #FixedLinks
                    li -Content {
                        a -href "https://pshtml.readthedocs.io/" -Content {
                            "PSHTML"
                        } -Target _blank
                    }
                    li -Content {
                        a -href "https://getbootstrap.com/" -Content {
                            "Bootstrap"
                        } -Target _blank
                    }
                    li -Content {
                        a -href "https://www.w3schools.com/" -Content {
                            "w3schools"
                        } -Target _blank
                    }

                }

            }

            #region jumbotron
            div -id "j1" -class 'jumbotron text-center' -content {
        
                p {
                    h1 "$($Title)"
                }

                hr

                p {
                    "Automatically created website "
                    b { $($Label) }
                    $link = a {"PSHTMLwebframework"} -href "https://github.com/tinuwalther/PSHTMLwebframwork/blob/develop/README.md" -Target _blank
                    " | Generated with $($link)"
                }
            } 
            #endregion

            #region Section
            div -id "1" -class 'container-fluid' -Content {

                h1 "$($Label) PSHTMLwebframework"

                p { "The PSHTMLwebframework builds HTML-Files with PSHTML from native PowerShell-Scripts." }

                h2 "Create the Webframework"

                p { "To create the Webframework with PSHTMLwebframework, run the following commands:" }
                p { "1. git clone https://github.com/tinuwalther/PSHTMLwebframwork.git" } -class "text-monospace"
                p { "2. git checkout develop" } -class "text-monospace"
                p { "3. git pull" } -class "text-monospace"

                h2 "Build the Home page"

                p { "To build the Home page (index.html), run the following commands:" }
                p { "1. Import-Module .\PSHTMLwebframwork.psd1" } -class "text-monospace"
                p { "2. Run Build-WEBHtmlPages" } -class "text-monospace"

                h2 "Create a new Webpage"

                p { "To create a new Webpage from the Template, run the following commands:" }
                p { "1. Run New-WEBPage -newpage Page1" } -class "text-monospace"
                p { "2. Modify the new Page1.ps1" } -class "text-monospace"
                p { "3. Run Build-WEBHtmlPages" } -class "text-monospace"
                p { "After each changes on one or more Script-Page, you must run Build-WEBHtmlPages to publish the changes to the HTML-File." }
                p { 
                    "For more information read about "
                    a {"PSHTMLwebframework"} -href "https://github.com/tinuwalther/PSHTMLwebframwork/blob/develop/README.md" -Target _blank
                    " on github.com"
                }
            }
            #endregion
            
            Include -Name footer
                
        } 
    
    }
    
}

$HTML | out-File -Filepath ..\$($page).html -Encoding utf8
