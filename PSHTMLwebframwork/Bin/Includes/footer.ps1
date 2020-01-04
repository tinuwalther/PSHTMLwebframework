Footer {

    div -id "footer" -class "container-fluid" -Content {

        hr

        $PSHTMLlink = a {"PSHTML"} -href "https://github.com/Stephanevg/PSHTML"  -Target _blank

        a -href "index.html" -class "badge badge-pill badge-primary" -Content {
            "Home"
        }
        
        " | Based on $($PSHTMLlink)"
        
        hr
    }
    
}
