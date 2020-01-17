# <!-- Do not change this code -->
$page  = ($MyInvocation.MyCommand.Name -replace '.ps1') -replace '.html'
$Label = (Get-Culture).TextInfo.ToTitleCase($page.ToLower())

# <!-- Here you can change the values of the variables below -->
$WebsiteTitle      = "PSHTML Webexample"
$ContainerStyleOut = "container-md pt-3 bg-light text-dark"
$ContainerStyleIn  = "container-fluid"

# <!-- Here you can change the content for your website, but never change the head, the header, the nav, or the footer -->
$HTML = html {

    # <!-- Do not change the head -->
    head {
                
        Include meta
        
        Title "$($page.ToUpper()) | $($WebsiteTitle)"
    }

    body {

        # <!-- Do not change the header -->
        header {

            Include header

        }

        # <!-- Do not change the nav -->
        nav -class "navbar navbar-expand-sm bg-dark navbar-dark sticky-top" -content {

            # <!-- Brand -->
            a -class "navbar-brand" -href "#" -content {
    
                img -src "Assets/IMG/pshtml.png" -alt "Logo" -style "width:60px"
            
            }

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

        # <!-- Here you can change the content for your website -->
        section -id "Section1" -Content {

            div -Class "$ContainerStyleOut" -Content {

                # <!-- Here you can change the content for your website -->

                article -id "Jumbotron1" -Content {

                    div -id "j1" -class 'jumbotron text-center' -content {
                
                        h1 "$($WebsiteTitle)"

                        hr

                        p {
                            "Automatically created website "
                            b { $($Label) }
                            $link = a {"PSHTMLwebframework"} -href "https://github.com/tinuwalther/PSHTMLwebframework/blob/develop/README.md" -Target _blank
                            " | Generated with $($link)"
                        }
                    } 

                }

                article -id "SiteOverview" -Content {

                    div -id "1" -class "$ContainerStyleIn text-center" -Content {

                        h1 "$($Label) PSHTML Webframework"

                        p {
                            "The PSHTMLwebframework builds HTML-Files with PSHTML from native PowerShell-Scripts."
                        }

                    }

                }

                article -id "SiteContent1" -Content {

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

                    }
                    
                }

                br
                    
            }
    
        }
            
        # <!-- Do not change the footer -->
        Footer {
                
            Include -Name footer
            
        }

    }

}

# <!-- Do not change this code -->
$HTML | out-File -Filepath ..\$($page).html -Encoding utf8
