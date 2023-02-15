
span -id "footer" -class "text-center" -Content {

    a -href "#" -class "badge rounded-pill text-bg-primary" -Content {
        "Top"
    }

    $PSHTMLlink    = a {"PSHTML"} -href "https://github.com/Stephanevg/PSHTML"  -Target _blank
    " | Based on $($PSHTMLlink) | Bootstrap v5.3.0 | "

    span -class "badge rounded-pill text-bg-primary" -Content {
        "v0.1.2"
    }

}
