
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
    #To use it from local: Link -href "Assets/BootStrap/bootstrap.min.css" -rel stylesheet
    link -href "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" -rel stylesheet -Attributes @{"integrity"="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"; "crossorigin"="anonymous"}
    link -href "https://fonts.googleapis.com/css?family=Quicksand&display=swap" -rel stylesheet

    # Define the scripts
    #To use it from local: Script -src "Assets/Jquery/jquery.min.js"
    Script -src "https://code.jquery.com/jquery-3.4.1.min.js"-Attributes @{"integrity"="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="; "crossorigin"="anonymous"}

    #Script -src "Assets/BootStrap/bootstrap.min.js"
    Script -src "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" -Attributes @{"integrity"="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"; "crossorigin"="anonymous"}
    Script -src "https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" -Attributes @{"integrity"="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"; "crossorigin"="anonymous"}

