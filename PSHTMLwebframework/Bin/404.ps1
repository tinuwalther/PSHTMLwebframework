$page  = ($MyInvocation.MyCommand.Name -replace '.ps1') -replace '.html'
$Label = (Get-Culture).TextInfo.ToTitleCase($page.ToLower())
$Title = "PSHTML Webexample"
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
            div -id "1" -class "$ContainerStyleIn text-center" -Content {

                h1 "$($Label) PSHTML Webframework"

            }
            #endregion

            #region Section
            div -id "2" -class "$ContainerStyleIn text-center" -Content {

                br

                img -src "Assets/IMG/404.png" -class "img-rounded mx-auto d-block" -height "30%"

                br

                h2 "File not found"

                p {
                    "The site configured at this address does not contain the requested file."
                }

                p {
                    "If this is your site, make sure that the filename case matches the URL."
                    br
                    "For root URLs (like http://example.com/) you must provide an index.html file."
                }

                br

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
