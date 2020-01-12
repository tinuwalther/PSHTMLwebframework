
    # <!-- Do not change the code unless you know exactly what you are doing -->

    # Define all the meta data
    meta -name "viewport"    -content_tag "width=device-width, user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=3.0"
    meta -name "keywords"    -content_tag "PSHTML, PowerShell, PowerShell Module, PSHTML Webframework, PowerShell Webframework"
    meta -name "author"      -content_tag "Martin Walther Foto & IT"
    meta -name "description" -content_tag "The PSHTMLwebframework builds HTML-Files with PSHTML from native PowerShell-Scripts."

    # Define the favicon
    link -rel 'icon' -href 'https://avatars1.githubusercontent.com/u/56639134?s=400&u=9c1a1dc1a8d8718534bf7d455042c7382cc419a0&v=4' -type 'image/x-icon'
    
    # Define the stylesheets
    Link -href "Style/style.css" -rel stylesheet
    Link -href "Assets/BootStrap/bootstrap.min.css" -rel stylesheet
    link -href "https://fonts.googleapis.com/css?family=Quicksand&display=swap" -rel stylesheet

    # Define the scripts
    Script -src "Assets/Jquery/jquery.min.js"
    Script -src "Assets/BootStrap/bootstrap.min.js"
