
span -id "footer" -class "text-center" -Content {

    a -href "#" -class "badge badge-primary" -Content {
        "Top"
    }

    $PSHTMLlink    = a {"PSHTML"} -href "https://github.com/Stephanevg/PSHTML"  -Target _blank
    " | Based on $($PSHTMLlink) | Bootstrap v5.3.0-alpha1 | "

    span -class "badge badge-primary" -Content {
        "v0.1.2"
    }

}
