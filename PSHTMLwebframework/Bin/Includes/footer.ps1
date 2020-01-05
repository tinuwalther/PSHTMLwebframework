
div -id "footer" -class "container-fluid text-center" -Content {

    hr

    a -href "#" -class "badge badge-primary" -Content {
        "Top"
    }

    $PSHTMLlink    = a {"PSHTML"} -href "https://github.com/Stephanevg/PSHTML"  -Target _blank
    " | Based on $($PSHTMLlink) | "

    span -class "badge badge-primary" -Content {
        "v0.0.7"
    }

    hr

}
