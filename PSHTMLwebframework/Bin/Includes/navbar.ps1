
<# <!-- Brand -->
a -class "navbar-brand" -href "#" -content {
    
    img -src "Assets/IMG/pshtml.png" -alt "Logo" -style "width:60px"

}
#>

# <!-- Toggler/collapsibe Button -->
#button -class "navbar-toggler" -data-target "#collapsibleNavbar" -data-toggle "collapse" -type "button"

# <!-- HomePage -->
li -class "nav-item" -content {

    a -class "nav-link" -href "index.html" -content {
        "Home"
    }

}

# <!-- NewPages -->
li -class "nav-item" -content {

    a -class "nav-link" -href "blog.html" -content {
        "Blog"
    }

}

li -class "nav-item" -content {

    a -class "nav-link" -href "about.html" -content {
        "About"
    }

}
