$page = $MyInvocation.MyCommand.Name -replace '.ps1'

$HTML = html {

    head {
        
        Meta -name viewport -content_tag "width=device-width, initial-scale=1.0"
        link -rel 'icon' -href 'https://avatars1.githubusercontent.com/u/56639134?s=400&u=9c1a1dc1a8d8718534bf7d455042c7382cc419a0&v=4' -type 'image/x-icon'
        Link -href "Style/style.css" -rel stylesheet
        Link -href "Assets/BootStrap/bootstrap.min.css" -rel stylesheet
        Script -src "Assets/BootStrap/bootstrap.min.js"
        link -href "https://fonts.googleapis.com/css?family=Quicksand&display=swap" -rel "stylesheet"
        
        Title "$($page.ToUpper()) | PSHTMLwebexample"
    }

    body {

        div -Class "container" -Content {

            Include -Name header

            #region Section 1
            div -id "1" -class 'jumbotron container-fluid' -content {
            
                p {
                    h2 $page.ToUpper()
                }
    
            }
            #endregion

            #region Section 2
            div -id "2" -class 'container-fluid' -Content {

                h3 "Automated $($page.ToUpper()) Page"

                p {
                    "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
                }

            }
            #endregion
                
            Include -Name footer

        } 

    }
    
}

$HTML | out-File -Filepath ..\$($page).html -Encoding utf8
