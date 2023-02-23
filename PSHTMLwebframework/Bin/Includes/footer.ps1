
span -id "footer" -class "text-center" -Content {

    a -href "#" -Class "btn-sm btn btn-outline-success" -Content {
        "I $([char]9829) PS >"
    }

    $PSHTMLlink    = a {"PSHTML"} -href "https://github.com/Stephanevg/PSHTML"  -Target _blank
    " | Based on $($PSHTMLlink) | Bootstrap v5.3.0 | "

    span -class "badge text-bg-success" -Content {
        "v0.1.2"
    }

}
