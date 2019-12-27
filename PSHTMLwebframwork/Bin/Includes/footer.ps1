Footer {

    div -id "footer" -class "container-fluid" -Content {

        hr

        $PSHTMLlink = a {"PSHTML"} -href "https://github.com/Stephanevg/PSHTML"  -Target _blank
        p {
            "Generated with $($PSHTMLlink)"
        }
        
    }
    
}
