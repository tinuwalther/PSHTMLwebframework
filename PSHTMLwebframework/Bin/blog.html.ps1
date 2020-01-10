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
            div -id "1" -class "$ContainerStyleIn" -Content {

                h1 "$($Label) PSHTML Webframework"

                p {
                    a -href "https://www.w3schools.com/bootstrap4/tryit.asp?filename=trybs_template1" -Target _blank -Content {
                        "Bootstrap 4 Website Example"
                    }
                }

            }
            #endregion

            #region Panel
            div -id "2" -class "$ContainerStyleIn" -Content {

                # <!-- Panel style -->
                div -id "1" -Class "row" -Content {

                    # <!-- Panel left -->
                    div -class "col-sm-4" -content {
                        h3 "Day one in Paradise"
                    }

                    # <!-- Panel right -->
                    div -class "col-sm-8" -content {

                        h4 "First Example"

                        p {
                            "Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco."
                        }

                        p {
                            "Lorem ipsum dolor sit amet, consectetur adipisicing elit,"
                            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
                            "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                        }

                    }

                }

                hr

                # <!-- Panel style -->
                div -id "2" -Class "row" -Content {

                    # <!-- Panel left -->
                    div -class "col-sm-4" -content {
                        h3 "Day two in Paradise"
                    }

                    # <!-- Panel right -->
                    div -class "col-sm-8" -content {

                        h4 "Second Example"

                        p {
                            "Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco."
                        }

                        p {
                            "Lorem ipsum dolor sit amet, consectetur adipisicing elit,"
                            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
                            "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                        }

                    }

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
