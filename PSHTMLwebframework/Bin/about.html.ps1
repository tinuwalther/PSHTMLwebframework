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

                    div -id "1" -class "$ContainerStyleIn" -Content {

                        h1 "$($Label) PSHTML Webframework"

                        p {
                            "The PSHTMLwebframework builds HTML-Files with PSHTML from native PowerShell-Scripts."
                        }

                    }

                }

                article -id "SiteContent1" -Content {

                    div -id "2" -class "$ContainerStyleIn" -Content {

                        h2 "Create the Webframework"

                        p {"To create the Webframework with PSHTMLwebframework, run the following commands:"}
                        
                        pre -content {
                            "git clone https://github.com/tinuwalther/PSHTMLwebframework.git"
                            br
                            "git checkout develop"
                            br
                            "git pull"
                            br
                            ".\CI\Build-Module.ps1"
                        }
                    
                    }

                }
            
                article -id "SiteContent2" -Content {

                    div -id "2" -class "$ContainerStyleIn" -Content {

                        h2 "Build the Home page"

                        p { "To build the Home page (index.html), run the following commands:" }
                        
                        pre -content {
                            "Import-Module -Name .\PSHTMLwebframework.psd1 -Force"
                            br
                            "Publish-WEBHtmlPages"
                        }
                    
                    }

                }
            
                article -id "SiteContent3" -Content {

                    div -id "2" -class "$ContainerStyleIn" -Content {

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

                }
            
                article -id "SiteContent4" -Content {

                    div -id "2" -class "$ContainerStyleIn" -Content {

                        h2 "Publish the Webframework"

                        p { "To publish the Webframework to your provider, following this guid:" }
                        
                        pre -content {
                            "1. Upload the content of your PSHTMLwebframework to your webspace" 
                            br
                            "2. Remove the folder Bin in your webspace"
                            br
                            "3. Browse to your webspace and enjoy your new Website"
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
