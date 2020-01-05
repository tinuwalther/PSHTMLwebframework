$page    = 'home'
$Label   = (Get-Culture).TextInfo.ToTitleCase($page.ToLower())
$Title   = "PSHTML Webexample"

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

                nav -class "navbar navbar-expand-sm bg-dark fixed-top" -content {

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

            #region jumbotron
            div -id "j1" -class 'jumbotron text-center' -content {
        
                p {
                    h1 "$($Title)"
                }

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
            div -id "1" -class 'container-fluid text-center' -Content {

                img -src "Assets/IMG/words.png" -class "img-rounded mx-auto d-block"

            }
            #endregion

            #region Section
            div -id "2" -class 'container-fluid' -Content {

                h4 "Lorem ipsum dolor sit amet"

                p {
                    "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
                }

            }
            #endregion
            
            Footer {
            
                Include -Name footer
                
            }
                
        } 
    
    }
    
}

$HTML | out-File -Filepath ..\index.html -Encoding utf8
